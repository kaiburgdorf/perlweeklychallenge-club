# TASK 1 - represent integer
_dc←{⌽𝕗|⌊∘÷⟜𝕗⍟(↕1+·⌊𝕗⋆⁼1⌈⊢)}                             # digits in base
{∨´7=∾10 _dc ¨↕𝕩} 25
