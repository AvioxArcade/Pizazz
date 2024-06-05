/// @description
draw_set_halign(fa_right)
draw_text(1270,920,"PIZAZZ DEMO")

draw_set_halign(fa_center)
draw_text(640,900,string("PAGE {0}/{1}\n(Change pages with arrow keys.)",page+1,pages));
draw_text(640,10,string("PAGE {0}: {1}",page+1,page_text[page]));

draw_sprite(sprite_code_examples,page,10,940);