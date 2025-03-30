varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main()
{
    float t = CC_Time[1];
    vec2 uv = v_texCoord;
    float wave = 0.04;
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord);
    
    vec4 r = texture2D(CC_Texture0, uv - vec2(wave*sin(1.0*t + uv.y*2.0), 0.0));
    vec4 g = texture2D(CC_Texture0, uv - vec2(wave*sin(1.3*t + uv.y*2.0), 0.0));
    vec4 gg = texture2D(CC_Texture0, uv - vec2(wave*cos(1.0*t - uv.y*2.0), 0.0));
    vec4 b = texture2D(CC_Texture0, uv - vec2(wave*sin(1.6*t + uv.y*2.0), 0.0));
    
    if (uv.x < 0.5) {
        if (uv.y > 0.5) {
            gl_FragColor = 1.2*vec4(r.r, r.r, r.r, (r.a + b.a + g.a)/3.0);
        } else {
            gl_FragColor = 1.2*vec4(gg.g, gg.g, gg.g, (r.a + b.a + g.a)/3.0);
        }
    } else {
        if (uv.y > 0.5) {
            gl_FragColor = 1.2*vec4(1.0-uv.y,0,0,1)*vec4(gg.g, gg.g, gg.g, (r.a + b.a + g.a)/3.0);
        } else {
            gl_FragColor = 1.2*vec4(r.r, r.r, r.r, (r.a + b.a + g.a)/3.0);
        }
    }
}				
