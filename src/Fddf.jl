module Fddf

using FunctionalData, DataFrames

export fd, df

function Base.fd(a::DataFrame)
    ks = @p names a
    @p map (1:size(a,1)) (i->begin
        @p map ks (k->Pair(k, a[i, k])) | Dict
    end)
end

function df(a::Array)
    r = DataFrame()
    @p fst a | ckeys | work k->begin
        setproperty!(r, k, extract(a,k))
    end
    r
end


end
