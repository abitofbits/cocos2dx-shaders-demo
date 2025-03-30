varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main()
{
    float t = CC_Time[0];
    vec2 uv = v_texCoord;
    float wave = 0.02;
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord);
    
    vec4 r = texture2D(CC_Texture0, uv - vec2(wave*sin(20.0*t + uv.y*2.0), 0.0));
    vec4 g = texture2D(CC_Texture0, uv - vec2(wave*sin(20.0*t + uv.y*2.0), 0.0));
    vec4 b = texture2D(CC_Texture0, uv - vec2(wave*sin(20.0*t + uv.y*2.0), 0.0));
    
    if (uv.x < 0.5) {
        if (uv.x < 0.3) {
            if (uv.y < 0.5) {
                gl_FragColor = 1.5*vec4(r.r, g.g, b.b, (r.a + b.a + g.a)/3.0);
            } else {
                gl_FragColor = vec4(1,0,0,1)*vec4(r.r, g.g, sin(b.b), (r.a + b.a + g.a)/3.0);
            }
        } else {
            if (uv.y < 0.3) {
                gl_FragColor = 1.5*vec4(r.r, g.g, b.b, (r.a + b.a + g.a)/3.0);
            } else {
                if (uv.y > 0.7) {
                    gl_FragColor = vec4(1,0,0,1)*vec4(r.r, g.g, sin(b.b), (r.a + b.a + g.a)/3.0);
                } else {
                    if (uv.y > 0.5) {
                        gl_FragColor = 1.2*vec4(r.r + sin(r.r*t), g.g + sin(g.g*t), b.b + sin(b.b*t), (r.a + b.a + g.a)/3.0);
                    } else {
                        gl_FragColor = vec4(sin(r.r*t), sin(r.r*t), sin(r.r*t), (r.a + b.a + g.a)/3.0);
                    }
                }
            }
        }
    } else {
        if (uv.x > 0.7) {
            if (uv.y < 0.5) {
                gl_FragColor = vec4(0,0,1,1)*vec4(r.r, g.g, sin(b.b), (r.a + b.a + g.a)/3.0);
            } else {
                gl_FragColor = vec4(0,1,0,1)*vec4(r.r, g.g, sin(b.b), (r.a + b.a + g.a)/3.0);
            }
        } else {
            if (uv.y < 0.3) {
                gl_FragColor = vec4(0,0,1,1)*vec4(r.r, g.g, sin(b.b), (r.a + b.a + g.a)/3.0);
            } else {
                if (uv.y > 0.7) {
                    gl_FragColor = vec4(0,1,0,1)*vec4(r.r, g.g, sin(b.b), (r.a + b.a + g.a)/3.0);
                } else {
                    if (uv.y > 0.5) {
                        gl_FragColor = vec4(sin(r.r*t), sin(r.r*t), sin(r.r*t), (r.a + b.a + g.a)/3.0);
                    } else {
                        gl_FragColor = vec4(r.r, g.g, b.b, (r.a + b.a + g.a)/3.0);
                    }
                }
            }
        }
    }
}				
