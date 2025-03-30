varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main()
{
    float t = CC_Time[0];
    vec2 uv = v_texCoord;
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord);
    gl_FragColor = (1.2 + 1.0*sin(50.0*t + uv.y*2.0))*v_orColor.bgra;
}
