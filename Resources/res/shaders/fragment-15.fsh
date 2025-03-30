varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main(){
    float t = CC_Time[1];
    vec4 color = texture2D(CC_Texture0, v_texCoord);
    color.rgb = mix(color.rgb, color.rgb*color.a*sin(t*100.0) + 1.0, color.a);
    gl_FragColor = v_fragmentColor*color;
}
