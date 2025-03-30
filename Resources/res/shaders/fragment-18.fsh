#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_NoiseTexture;
uniform sampler2D u_CausticTexture;

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main(void)
{
    float time = CC_Time[1]*5.0;
    vec2 uv = v_texCoord;
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord);
    float x = gl_FragCoord.x - (0.5 - 960.0 / 2.0);
    float y = gl_FragCoord.y - (0.5 - 640.0 / 2.0);
    float mov = cos(x / 960.0 / 0.4);
    
    vec2 norm = v_texCoord.st;
    float theta = atan(norm.y, norm.x);
    float r = length(norm);
    vec2 coord = vec2(-r * sin(theta*time*100.0), -r * cos(theta*time*100.0))/2.0 + 0.5;

    float c1 = sin(mov);
    float c2 = 0.95;
    float c3 = time;
    if (v_orColor.r < 0.05) {
        if (v_orColor.g < 0.05) {
            if (v_orColor.b < 0.05) {
                float z = sin(y/20.-time)*100.+cos(mov)+sin(x/1000.);
                if (z < 0.5) {
                    gl_FragColor = vec4(0.853*z, -0.658*z, -0.853*z, 1)*v_orColor;
                } else {
                    gl_FragColor = vec4(0.853*z, 0.458*z, -0.853*z, 1)*v_orColor;
                }
            } else {
                gl_FragColor = vec4(0.312,0.312,0.312,1)*v_orColor;
            }
        } else {
            gl_FragColor = vec4(0.312,0.312,0.312,1)*v_orColor;
        }
    } else {
        gl_FragColor = vec4(0.312,0.312,0.312,1)*v_orColor;
    }
}
