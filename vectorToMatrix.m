function m=vectorToMatrix(p,columns)
    n=numel(p);
    if(mod(n,columns)~=0)
        x='ERROR: vectorToMatrix'
    end
    rows=floor(n/columns);
    m=zeros(rows,columns);
    for row=1:rows
        for column=1:columns
            j=(row-1)*columns+column;
            m(row,column)=p(j);       
        end
    end
end