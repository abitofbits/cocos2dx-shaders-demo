#ifdef GL_ES
precision lowp float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

float min = 0.03;
float max = 0.98;

void main(void) {
    float t = CC_Time[0];
    vec2 uv = v_texCoord;
    
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord);
    vec4 r = vec4(1,1,1,1)*v_orColor;
    vec4 g = vec4(1,1,1,1)*v_orColor;
    vec4 b = vec4(1,1,1,1)*v_orColor;
    float delta = 10.0;
    if (v_orColor.r < min) {
        if (v_orColor.g < min) {
            if (v_orColor.b < min) {
                r = vec4(1,1,1,1)*texture2D(CC_Texture0, v_texCoord);
                r = vec4(-sin(delta*t + uv.y*2.0), 1, 1, r.a);
                g = vec4(1,1,1,1)*texture2D(CC_Texture0, v_texCoord);
                g = vec4(1, cos(delta*t + uv.y*2.0), 1, r.a);
                b = vec4(1,1,1,1)*texture2D(CC_Texture0, v_texCoord);
                b = vec4(1, 1, sin(delta*t + uv.y*2.0), r.a);
            }
        }
    }
    gl_FragColor = vec4(r.r, g.g, b.b, v_orColor.a);
}
