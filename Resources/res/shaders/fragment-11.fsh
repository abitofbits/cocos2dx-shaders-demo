#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_NoiseTexture;
uniform sampler2D u_CausticTexture;

varying vec4 v_fragmentColor;
varying vec2 v_texCoord1;
varying vec2 v_texCoord2;

void main(void)
{
    float time = 2.5*CC_Time[1];
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord1);
    float gray = dot(v_orColor.rgb, vec3(0.299, 0.587, 0.114));
    gl_FragColor = vec4(gray, gray, gray, v_orColor.a);
    
    int x = int(mod(gl_FragCoord.x / 10.0, 10.0));
    int y = int(mod(gl_FragCoord.y / 10.0, 10.0));
    
    float t = CC_Time[0];
    vec2 distortion = 2.0*texture2D(u_NoiseTexture, v_texCoord2*sin(t)*2.125).xy - 1.0;
    vec2 distortionOffset = distortion*0.05;
    
    vec2 norm = v_texCoord1.st;
    float theta = atan(norm.y, norm.x);
    float r = length(norm);
    float delta = sin(r*time) + theta;
    if (gl_FragCoord.x/10. + delta < 87.) {
        if (gl_FragCoord.x/10. + delta > 31.) {
            if (gl_FragCoord.y/10. + delta < 93.) {
                if (gl_FragCoord.y/10. + delta > 7.) {
                    float min = 0.385;
                    gl_FragColor += vec4(-min,-min,-min,1)*v_fragmentColor*texture2D(CC_Texture0, v_texCoord1 + delta/100.);
                }
            }
        }
    }
    if (gl_FragCoord.x/10. + delta < 86.) {
        if (gl_FragCoord.x/10. + delta > 30.) {
            if (gl_FragCoord.y/10. + delta < 90.) {
                if (gl_FragCoord.y/10. + delta > 10.) {
                    gl_FragColor = vec4(0.8*(1.-delta/3.),0,0,1)*v_fragmentColor*texture2D(CC_Texture0, v_texCoord1 + delta/100.);
                    gl_FragColor += 0.15*v_fragmentColor * texture2D(u_CausticTexture, v_texCoord1 + delta/100.);
                }
            }
        }
    }
}
