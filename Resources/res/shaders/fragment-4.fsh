#ifdef GL_ES
precision lowp float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

float min = 0.02;
float max = 0.98;

void main(void) {
    float t = CC_Time[0];
    vec2 uv = v_texCoord;
    
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord);
    vec4 r = vec4(1,1,1,1)*v_orColor;
    vec4 g = vec4(1,1,1,1)*v_orColor;
    vec4 b = vec4(1,1,1,1)*v_orColor;
    float delta = 100.0;
    if (v_orColor.r < min) {
        r = vec4(1,1,1,1)*texture2D(CC_Texture0, v_texCoord);
        r = vec4(sin(delta*t + uv.y*2.0), r.g, r.b, r.a);
    } else if (v_orColor.r > max) {
        r = vec4(1,1,1,1)*texture2D(CC_Texture0, v_texCoord);
        r = vec4(sin(delta*t + uv.y*2.0), r.g, r.b, r.a);
    }
    gl_FragColor = vec4(r.r, g.g, b.b, v_orColor.a);
}
