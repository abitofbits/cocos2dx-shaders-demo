varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

#ifdef GL_ES
precision highp float;
#endif

void main()
{
    float t = CC_Time[0];
    vec2 uv = v_texCoord;
    float wave = 0.02;
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord);
    
    float gradient = gl_FragCoord.y;
    int x = int(mod(gl_FragCoord.x / 10.0, 10.0));
    if (x < 9) {
        gl_FragColor = vec4(v_orColor.r * 0.5, v_orColor.g, v_orColor.b * 0.5, v_orColor.a);
    } else {
        gl_FragColor = vec4(v_orColor.r, v_orColor.g + abs(sin(gradient*t)), v_orColor.b, v_orColor.a);
    }
}
