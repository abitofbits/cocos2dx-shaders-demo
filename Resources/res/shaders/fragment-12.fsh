#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main(void)
{
    float t = CC_Time[1];
    vec2 uv = v_texCoord;
    
    vec2 p = abs(uv * 2.0 + uv.x * t * sin(uv.y));
    vec2 distortionOffset = vec2(0, cos(0.2*t*10.0 + t));//-sin(p*0.25)*cos(uv.x*1.5));
    vec4 c = texture2D(CC_Texture0, v_texCoord);
    vec2 norm = v_texCoord.st;
    float theta1 = atan(0.03, -norm.y + 0.5);
    vec4 final = c;
    final.r = (c.r * cos(theta1*t*5.0)) + (c.g * 0.5) + (c.b * 0.275);
    final.g = (c.r) + (c.g * cos(theta1*t*5.0)) + (c.b * 0.275);
    final.b = (c.r) + (c.g * 0.5) + (c.b * cos(theta1*t*5.0));
    
    if (uv.y < 0.5) {
        final = vec4(0, 0.4 + uv.y/2.0, 0.4 + uv.y/2.0, 1)*final;
    } else {
        final = vec4(0, 1.1 - uv.y/2.0, 0, 1)*final;
    }
    gl_FragColor = final;
}