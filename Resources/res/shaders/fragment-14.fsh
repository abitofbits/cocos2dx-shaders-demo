varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main(){
    float t = CC_Time[0]/1.5;
    vec2 uv = v_texCoord;
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord);
    vec4 color = texture2D(CC_Texture0, v_texCoord);
    color.rgb = mix(color.rgb, color.rgb*color.a + 0.5, -1.0*color.a*abs(cos(t*10.0)));
    
    if (uv.x < 0.46) {
        gl_FragColor = vec4(1,0,0,1)*v_fragmentColor*color;
    } else if (uv.x > 0.48) {
        if (uv.x < 0.528) {
            gl_FragColor = vec4(1,0,0,1)*v_fragmentColor*color;
        } else if (uv.x > 0.57) {
            gl_FragColor = vec4(1,0,0,1)*v_fragmentColor*color;
        } else {
            if (uv.y < 0.45) {
                gl_FragColor = vec4(1,0,0,1)*v_fragmentColor*color;
            } else if (uv.y > 0.49) {
                gl_FragColor = vec4(1,0,0,1)*v_fragmentColor*color;
            } else {
                if (v_orColor.r < 0.5) {
                    if (v_orColor.g > 0.8) {
                        if (v_orColor.b > 0.8) {
                            gl_FragColor = vec4(5.*color.r,0,0,1)*v_fragmentColor*color;
                        } else {
                            gl_FragColor = vec4(1,0,0,1)*v_fragmentColor*color;
                        }
                    } else {
                        gl_FragColor = vec4(1,0,0,1)*v_fragmentColor*color;
                    }
                } else {
                    gl_FragColor = vec4(1,0,0,1)*v_fragmentColor*color;
                }
            }
        }
    } else if (uv.y < 0.45) {
        gl_FragColor = vec4(1,0,0,1)*v_fragmentColor*color;
    } else if (uv.y > 0.49) {
        gl_FragColor = vec4(1,0,0,1)*v_fragmentColor*color;
    } else {
        if (v_orColor.r < 0.5) {
            if (v_orColor.g > 0.8) {
                if (v_orColor.b > 0.8) {
                    gl_FragColor = vec4(5.*color.r,0,0,1)*v_fragmentColor*color;
                } else {
                    gl_FragColor = vec4(1,0,0,1)*v_fragmentColor*color;
                }
            } else {
                gl_FragColor = vec4(1,0,0,1)*v_fragmentColor*color;
            }
        } else {
            gl_FragColor = vec4(1,0,0,1)*v_fragmentColor*color;
        }
    }
}
