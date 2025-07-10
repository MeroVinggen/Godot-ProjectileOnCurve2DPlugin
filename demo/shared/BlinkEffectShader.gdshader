shader_type canvas_item;

uniform vec4 flash_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float flash_value : hint_range(0.0, 1.0, 0.1) = 0.0;

void fragment() {
    COLOR = mix(COLOR, vec4(flash_color.rgb, COLOR.a), flash_value);
}