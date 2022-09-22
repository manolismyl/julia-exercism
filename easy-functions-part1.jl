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
    dictionary = Dict{Char, Int}('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    for nucleotide in strand
        if nucleotide =='A'
            dictionary['A'] += 1
        elseif nucleotide =='C'
            dictionary['C'] += 1
        elseif nucleotide =='G'
            dictionary['G'] += 1
        elseif nucleotide =='T'
            dictionary['T'] += 1
        else
            throw(DomainError(nucleotide))
        end    
    end
    return dictionary
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