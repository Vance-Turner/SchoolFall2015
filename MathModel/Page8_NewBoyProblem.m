% A newsboy sells newspapers outside Grand Central Station. He has on
% average 100 customers per day. He buys papers for 50 ents each, sells
% them for 75 cents each, but cannot return unsold papers for a refund. How
% many papers should he buy?

% Routine 1.2
n = 5000;
p = 100/n;
clear E;
for m = 85:105
    pk = (1-p)^n;
    e = -0.5*m*pk;
    for k=1:m
        pk = (n-k+1)*pk*p/((1-p)*k);
        e = e+(0.75*k-0.5*m)*pk;
    end;
    for k=m+1:n
        pk = (n-k+1)*pk*p/((1-p)*k);
        e=e+0.25*m*pk;
    end;
    E(m) = e;
end;
plot(E);
grid();
xlabel('Papers Bought');
ylabel('Expected Profit $');
title('Expected Profit versus Papers Bought');
set(gca,'xtick',0:10:120);
set(gca,'ytick',0:2:25);