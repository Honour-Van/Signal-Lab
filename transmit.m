function [rc, rw] = transmit(s_, hc_)
tmp = s_;
rc = tmp .* hc_(1);
for i = 1 : 3
    tmp = [0 tmp];
    rc = [rc 0];
    rc = rc + tmp .* hc_(i+1);
end

l = size(rc);
rw = rc + rand(1, l(2));