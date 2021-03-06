function [percent] = Percentile_Parse()
    % init
    x=Parse_Data('example.txt');
    y=x{1};
    nf=y.nf
    numfs=y.numfs;
    n=size(numfs);
    n=n(2);
    sum=0;
    for i=1:n
        a=eval_sentence(numfs{i});
        if(a==-1)
            nf=nf-1;
        else
            sum=sum+a;
        end
    end   
    function [yes] = eval_sentence(temp)
        checkA=strfind(temp,'mutual');
        emptyvec=[0,0];         
        if size(checkA)~=emptyvec % if 'mutual' detected ignore data
                yes=-1;
        else
            digit_pat1='\d';
            check=regexp(temp,digit_pat1,'match');
            sizecheck=size(check);
            numfriends='';
            for j=1:sizecheck(2);
                numfriends=[numfriends check{j}];
            end
            numfriends=str2num(numfriends)
            if numfriends<nf
                yes=1
            else
                yes=0
            end
        end
    end
    percent=sum/nf*100;
end
    
