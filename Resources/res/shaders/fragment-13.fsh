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
    float x = gl_FragCoord.x - (0.5 - 960.0 / 2.0);
    float y = gl_FragCoord.y - (0.5 - 640.0 / 2.0);
    float mov0 = x+y+cos(sin(time)*2.)*100.+sin(x/100.)*1000.;
    float mov1 = y / 640.0 / 0.2 + time;
    float mov2 = x / 960.0 / 0.2;

    float c1 = 0.005*(sin(mov1+time*10.)/2.+mov2/4.-mov1-mov2+time) + 0.539;
    float c2 = 0.4*c1+(sin(c1-sin(mov0/500.+time)-sin(y/80.-time)+sin((x+y)/250.)*100.));
    float c3 = 0.4*c2-(sin(c2+sin(mov1+mov2-c2)-cos(mov2)+sin(x/1500.)));
    if (v_orColor.r < 0.05) {
        if (v_orColor.g < 0.05) {
            if (v_orColor.b < 0.05) {
                gl_FragColor = vec4(0,8,0,1)*vec4(c1,c2,c3,1.0);
            } else {
                gl_FragColor = vec4(0.2,0.1,1,1)*vec4(c1,c2,c3,1.0)*v_orColor;
            }
        } else {
            gl_FragColor = vec4(0.2,0.1,1,1)*vec4(c1,c2,c3,1.0)*v_orColor;
        }
    } else {
        gl_FragColor = vec4(0.2,0.1,1,1)*vec4(c1,c2,c3,1.0)*v_orColor;
    }
}