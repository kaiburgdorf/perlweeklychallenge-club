#Input: @list = ('ab-cde-123', '123.abc.420', '3abc-0010.xy')
#Output: ('xx-xxe-123', 'xxx.xbc.420', 'xxxx-0010.xy')
{b←(4≥+`)⊸∧'-'≠𝕩⋄'x'¨⌾(b⊸/)𝕩}¨⟨"ab-cde-123", "123.abc.420", "3abc-0010.xy"⟩
