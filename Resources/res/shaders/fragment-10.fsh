varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main()
{
    float t = CC_Time[0];
    vec2 uv = v_texCoord;
    vec2 norm = v_texCoord.st;
    float theta = atan(norm.y, norm.x);
    float r = length(norm);
    vec2 coord = vec2(-r * sin(theta*t*100.0), -r * cos(theta*t*100.0))/2.0 + 0.5;
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord);
    
    if (uv.x < coord.x) {
        if (uv.y > 0.5) {
            gl_FragColor = 1.2*v_orColor.bgra;
        } else {
            gl_FragColor = v_orColor.rbga;
        }
    } else {
        gl_FragColor = v_orColor.grba;
    }
}
