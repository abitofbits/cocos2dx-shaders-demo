#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main(void)
{
    float t = CC_Time[1]*1.5;
    vec2 uv = v_texCoord;
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord);
    vec2 onePixel = vec2(1.0 / 960.0, 1.0 / 640.0);
    vec4 color;
    color.rgb = vec3(0.5);
    color -= texture2D(CC_Texture0, v_texCoord - onePixel * sin(t*1.1)) * 3.0;
    color += texture2D(CC_Texture0, v_texCoord + onePixel * cos(t*1.1)) * 3.0;
    color.rgb = vec3((color.r + color.g + color.b) / 3.0);
    gl_FragColor = vec4(color.rgb, 1);
    gl_FragColor = vec4(0.1*(sin(t)),0.65,0.9,1)*gl_FragColor;
    float center = 0.5;
    float centerX1 = center + (0.25*sin(t));
    float centerX2 = center + (0.5*sin(t));
    float radius1 = 0.72 - center;
    float radius2 = radius1 + 0.006;
    float w1 = uv.x*1.5 - centerX1*1.5;
    float h1 = uv.y - center;
    vec2 norm = v_texCoord.st;
    float theta = atan(norm.y, norm.x);
    float r = length(norm);
    float w2 = radius1;
    float h2 = radius1*1.5;
    float w3 = radius2;
    float h3 = radius2*1.5;
    float a = w1*w1 + h1*h1;
    float b = w2*w2 + h2*h2;
    float c = w3*w3 + h3*h3;
    if (a > b) {
        if (a > c) {
            if (uv.x > centerX1) {
                gl_FragColor = vec4(1.-sin(t),1.-sin(t),1.-sin(t),1);
            } else {
                gl_FragColor = vec4(sin(t),sin(t),sin(t),1);
            }
        } else {
            if (uv.x < centerX1) {
                gl_FragColor = vec4(1.-sin(t),1.-sin(t),1.-sin(t),1);
            } else {
                gl_FragColor = vec4(sin(t),sin(t),sin(t),1);
            }
        }
    } else {
        if (uv.x > centerX1) {
            color.rgb = mix(color.rgb, color.rgb*color.a + 1.0, color.a);
            gl_FragColor = v_fragmentColor*color;
        }
    }
}
