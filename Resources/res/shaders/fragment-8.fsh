#ifdef GL_ES
precision lowp float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

float min = 0.025;
float max = 0.975;

void main(void) {
    float t = CC_Time[0];
    vec2 uv = v_texCoord;
    
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord);
    vec4 r = vec4(1,1,1,1)*v_orColor;
    vec4 g = vec4(1,1,1,1)*v_orColor;
    vec4 b = vec4(1,1,1,1)*v_orColor;
    float delta = 10.0;
    if (v_orColor.r < min) {
        r = vec4(1,1,1,1)*texture2D(CC_Texture0, v_texCoord);
        r = vec4(50.0 - 50.0*sin(delta*t + uv.y*2.0), r.g, r.b, r.a);
    } else if (v_orColor.r > max) {
        r = vec4(1,1,1,1)*texture2D(CC_Texture0, v_texCoord);
        r = vec4(200.0*sin(delta*t + uv.y*2.0), r.g, r.b, r.a);
    }
    if (v_orColor.g < min) {
        g = vec4(1,1,1,1)*texture2D(CC_Texture0, v_texCoord);
        g = vec4(g.r, 50.0 - 50.0*sin(delta*t + uv.y*2.0), g.b, g.a);
    } else if (v_orColor.g > max) {
        g = vec4(1,1,1,1)*texture2D(CC_Texture0, v_texCoord);
        g = vec4(g.r, 200.0 - 200.0*sin(delta*t + uv.y*2.0), g.b, g.a);
    }
    if (v_orColor.b < min) {
        b = vec4(1,1,1,1)*texture2D(CC_Texture0, v_texCoord);
        b = vec4(b.r, b.g, 50.0 - 50.0*sin(delta*t + uv.y*2.0), b.a);
    } else if (v_orColor.b > max) {
        b = vec4(1,1,1,1)*texture2D(CC_Texture0, v_texCoord);
        b = vec4(b.r, b.g, 200.0*cos(delta*t + uv.y*2.0), b.a);
    }
    gl_FragColor = vec4(r.r, g.g, b.b, v_orColor.a);
}
