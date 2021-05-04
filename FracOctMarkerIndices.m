function [ind]=FracOctMarkerIndices(xfc,flims,width)
%Preferred band center frequency list
% This list obtained from http://www.cross-spectrum.com/audio/articles/center_frequencies.html
fcsub = [1:.03:1.18, 1.22, 1.25, 1.28, 1.32, 1.36, 1.40:.05:2,2.06:.06:2.36,...
    2.43,2.5,2.58,2.65,2.72,2.8,2.9,3,3.07,3.15:.1:3.75,3.87,4,4.12,4.25,...
    4.37,4.5,4.62,4.75,4.87,5:.15:5.6,5.8,6,6.15,6.3:.2:7.5,7.75:.25:9.75];
fc = [fcsub*1e-2,fcsub*1e-1,fcsub,fcsub*1e1,fcsub*1e2,fcsub*1e3,fcsub*1e4,fcsub*1e5,1e6];

n = 1:length(fcsub);

% Truncate fc array
ind = find(fc>=flims(1) & fc<=flims(2));
fc = fc(ind);

% Index array according to width  (also use to check for valid width
% parameter)
step = 24/width;  % this should be an integer - 24,8,4,2, or 1, depending on width.

fc = fc(1:step:end);

ind = [];
for i = 1:length(xfc)
    for j = 1:length(fc)
        if xfc(i) == fc(j)
            ind = [ind i];
        end
    end
end