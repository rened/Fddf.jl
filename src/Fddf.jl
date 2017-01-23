module Fddf

using FunctionalData, DataFrames

export fd, df

import Base.fd
fd(a::DataFrame) = @p Array a | transpose | mapvec x->@p map2 names(a) vec(x) Pair | Dict

import DataFrames.df
function df(a::Array)
    r = DataFrame()
    @p fst a | ckeys | work x->r[x] = extract(a,x)
    r
end


end
