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
    small = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
    capital = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
    length_alphabet = length(small)
    index = []
    for i in input
        for j in 1:length_alphabet 
            if i == small[j] || i == capital[j]
                small[j] = '0'
                capital[j] = '0'
                push!(index, i)
            end
        end
    end
    if length(index) == length_alphabet
        return true
    else
        return false
    end
end

