"""
    is_leap_year(year)

Return `true` if `year` is a leap year in the gregorian calendar.

"""
function is_leap_year(year::Int)
    if mod(year, 4) == 0 && (mod(year,100) !=0 || mod(year,400) == 0)
        return true
    else
        return false
    end
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
"""

function rotational_cipher()
    
end