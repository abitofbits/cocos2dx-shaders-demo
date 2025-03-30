#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_NoiseTexture;
uniform sampler2D u_CausticTexture;

varying vec4 v_fragmentColor;
varying vec2 v_texCoord1;
varying vec2 v_texCoord2;

void main(){
    vec2 dist = texture2D(u_NoiseTexture, v_texCoord1*1.0).xy;
    
    vec2 distortionScroll = vec2(sin(CC_Time[0]), 0.0);
    vec2 screen01 = (0.5*v_texCoord1.xy/gl_FragColor.w + 0.5);
    vec2 noiseSize = vec2(256., 256.);
    vec2 tc2 = screen01/noiseSize + distortionScroll;
    
    float t = CC_Time[0]*3.;
	vec2 distortion = 2.0*texture2D(CC_Texture0, distortionScroll * cos(t*2.*cos(t)) + sin(t*2.*sin(t))).xy - 1.0;
    vec2 distortionOffset = distortion*0.1;
    
    float time = CC_Time[1]*10.0;
    vec2 uv = v_texCoord1;
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord1);
    float x = gl_FragCoord.x - (0.5 - 960.0 / 2.0);
    float y = gl_FragCoord.y - (0.5 - 640.0 / 2.0);
    float mov = cos(x / 640.0 + time/3.) + 0.25;
    float c1 = 0.5+abs(sin(t/2. + uv.y*1.2));
    float c2 = mov;
    float c3 = sin(c2/2.);
    
    gl_FragColor = v_fragmentColor*texture2D(CC_Texture0, v_texCoord1);
    
    int xx = int(mod(x / 10.0, 10.0));
    if (xx < 5) {
        vec4 r = v_fragmentColor * texture2D(u_CausticTexture, uv + vec2(0.02*sin(5.0*t + uv.y*2.0), 0.0));
        vec4 g = v_fragmentColor * texture2D(u_CausticTexture, uv + vec2(0.02*sin(5.0*t + uv.y*3.0), 0.0));
        vec4 b = v_fragmentColor * texture2D(u_CausticTexture, uv + vec2(0.02*sin(5.0*t + uv.y*4.0), 0.0));
        gl_FragColor += 0.5*vec4(r.r, g.g, b.b, (r.a + b.a + g.a)/3.0);
    } else {
        vec4 r = v_fragmentColor * texture2D(u_CausticTexture, uv - vec2(0.03*sin(5.0*t + uv.y*2.0), 0.0));
        vec4 g = v_fragmentColor * texture2D(u_CausticTexture, uv - vec2(0.03*sin(5.0*t + uv.y*3.0), 0.0));
        vec4 b = v_fragmentColor * texture2D(u_CausticTexture, uv - vec2(0.03*sin(5.0*t + uv.y*4.0), 0.0));
        gl_FragColor += 0.5*vec4(r.r, g.g, b.b, (r.a + b.a + g.a)/3.0);
    }
    
    if (v_orColor.r < 0.05) {
        if (v_orColor.g < 0.05) {
            if (v_orColor.b < 0.05) {
                gl_FragColor += vec4(c1,c2,c3,1)*texture2D(CC_Texture0, v_texCoord1 + distortionOffset);
            }
        }
    } else {
        gl_FragColor = vec4(0.915,0.625,0.15,1)*gl_FragColor;
    }
}
