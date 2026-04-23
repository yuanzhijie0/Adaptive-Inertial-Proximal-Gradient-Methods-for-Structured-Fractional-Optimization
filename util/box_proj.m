function x = box_proj(x,lb,ub)
x = max(x,lb);
x = min(x,ub);
