#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main(void)
{
    float time = CC_Time[1]*2.0;
    vec2 uv = v_texCoord;
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord);
    float mov0 = cos((time*2.))*100.;
    float c1 = 0.95*(sin(time)) + 0.539;
    float c2 = 0.75*c1+(sin(c1-sin(mov0/500.+time)));
    float c3 = 0.75*c2+(sin(c2+sin(mov0)));
    if (v_orColor.r < 0.05) {
        if (v_orColor.g < 0.05) {
            if (v_orColor.b < 0.05) {
                gl_FragColor = vec4(1,1,1,1)*vec4(c1,c2,c3,1.0);
            } else {
                gl_FragColor = vec4(0.8,0.6,0.2,1)*vec4(c1,c2,c3,1.0)*v_orColor;
            }
        } else {
            gl_FragColor = vec4(0.8,0.6,0.2,1)*vec4(c1,c2,c3,1.0)*v_orColor;
        }
    } else {
        gl_FragColor = vec4(0.8,0.6,0.2,1)*vec4(c1,c2,c3,1.0)*v_orColor;
    }
}