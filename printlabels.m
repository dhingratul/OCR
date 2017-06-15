%% Prints Character Labels 
% Input: test label vector
% Output: Character text
% Note: Run from BoundingBox.m
function [outtext] =printlabels(labelte)

if(labelte==1)
    outtext='a';
    
    
elseif(labelte==2)
    outtext='d';
    
elseif(labelte==3)
    outtext='f';
    
    
elseif(labelte==4)
    outtext='h';
    
    
elseif(labelte==5)
    outtext='k';
    
    
elseif(labelte==6)
    outtext='m';
    
    
elseif(labelte==7)
    outtext='n';
    
    
elseif(labelte==8)
    outtext='o';
    
    
elseif(labelte==9)
    outtext='p';
    
    
elseif(labelte==10)
    outtext='q';
    
    
elseif(labelte==11)
    outtext='r';
    
    
elseif(labelte==12)
    outtext='s';
    
elseif(labelte==13)
    outtext='u';
    
elseif(labelte==14)
    outtext='w';
    
elseif(labelte==15)
    outtext='x';
    
elseif(labelte==16)
    outtext='z';
else
    outtext='NR';
end

end