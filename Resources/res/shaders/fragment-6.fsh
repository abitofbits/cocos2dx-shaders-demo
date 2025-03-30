//varying vec4 v_fragmentColor;
//varying vec2 v_texCoord;
//
//void main(void) {
//    float t = CC_Time[1];
//    vec2 uv = v_texCoord;
//    
//    vec2 p = abs(sin(uv * 5.0 + uv.x * t * sin(uv.y)));
//    vec2 distortionOffset = vec2(cos(0.2*t + t), sin(p * 0.2));
////                            vec2(sin(0.2 * CC_Time[1] + sin(p * 0.5) * CC_Time[1] / cos(50.0)) * 10.0,0.3+0.5 * abs(sin(CC_Time[1] * tan(5.0))));
//    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord + distortionOffset * 0.5);
//    gl_FragColor.xyz = v_orColor.xyz;
//    gl_FragColor.rgb = v_orColor.rgb;
//    gl_FragColor.w = 1.0;
//}

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main(void) {
    float t = CC_Time[1];
    vec2 uv = v_texCoord;
    
    vec2 p = abs(uv * 2.0 + uv.x * t * sin(uv.y));
    vec2 distortionOffset = vec2(cos(0.2*t + t), sin(p*0.25)*cos(uv.x*1.5));
    
    vec4 r = v_fragmentColor * texture2D(CC_Texture0, v_texCoord + distortionOffset * 0.2);
    vec4 g = v_fragmentColor * texture2D(CC_Texture0, v_texCoord + distortionOffset * 0.3);
    vec4 b = v_fragmentColor * texture2D(CC_Texture0, v_texCoord + distortionOffset * 0.4);
    
//    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord + distortionOffset * 0.2);
//    gl_FragColor.xyz = v_orColor.xyz;
//    gl_FragColor.rgb = vec3(1,1,0)*v_orColor.rgb;
//    gl_FragColor.w = 1.0;
    gl_FragColor.xyz = r.xyz * g.xyz * b.xyz;
    gl_FragColor.rgb = vec3(r.r, g.g, b.b);
    gl_FragColor.w = 1.0;
}
