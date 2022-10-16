"""
    is_leap_year(year)

Return `true` if `year` is a leap year in the gregorian calendar.

"""
function is_leap_year(year::Int)
    return (mod(year, 4) == 0 && (mod(year,100) !=0 || mod(year,400) == 0)) ? true : false
end

"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    utf8 = transcode(UInt8, strand)
    counts = zeros(Int, 256)
    @inbounds for byte in utf8
        counts[byte+1] += 1
    end
    result = Dict(base => counts[Int(base)+1] for base in "ACGT")
    if sum(values(result)) != length(utf8)
        throw(DomainError(strand, "only A, C, G and T are valid nucleotides"))
    end
    return result
end


"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    return issubset('a':'z', lowercase(input))
end

"""
Rotational cipher
Shamelessly stolen by xlxs4
https://github.com/xlxs4/julia-exercism/blob/main/rotational-cipher.jl
"""

function rotate(key, input::AbstractChar)
    a = isuppercase(input) ? 'A' : 'a'
    return isletter(input) ? ((input - a + key) % 26) + a : input
end
function rotate(key, input::AbstractString)
    return map(x -> rotate(key, x), input)    
end


"""
Raindrops: In exercism it doesn't accept this solution, because of the use of Primes Package. 
Noentheless, this solution achieves what was asked
"""
# using Primes

function raindrops(number)
    factor_dict = factor(number)
    s1 = (factor_dict[3] > 0) ? "Pling" : ""
    s2 = (factor_dict[5] > 0) ? "Plang" : ""
    s3 = (factor_dict[7] > 0) ? "Plong" : ""
    s = s1*s2*s3
    return (length(s)>0) ? s : string(number)
end
