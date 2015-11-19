% A campaign staffer knows from experience that only one in every there
% volunteers called will actually show up to distribute leaflets. How many
% phone calls must be made to guarantee at least 20 workers witha
% confidence of 90%.

% Routine 1.1 

p = 1/3;
for n=60:80
    pk = (1-p)^n;
    sum = pk;
    for k = 1:19
        pk = (n-k+1)*p*pk/k/(1-p);
        sum = sum + pk;
    end;
    E(n) = sum;
end;
plot(E);
xlabel('Calls Made');
ylabel('Confidence Level');
title('Confidence Level vs. Calls Made for at least 20 Workers');
set(gca,'xtick',0:3:80);
grid();
