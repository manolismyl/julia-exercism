function killer_sudoku_cheats(cage_length, number_goal, restrictions = NaN)
    if cage_length == 1
        return number_goal
    else
        if restrictions == NaN
            return repeat_combinations(cage_length, number_goal, 0)
        else
            total_combinations = repeat_combinations(cage_length, number_goal, 0)
            index = []
            for i = 1:size(total_combinations,1)
                for j in restrictions
                    if length(findall(x -> x == j, total_combinations[i,:])) != 0
                        push!(index, i)
                        break
                    end
                end
            end

            return total_combinations[setdiff(1:end, index), :]
        end
    end
end

function repeat_combinations(cage_length, number_goal, given_number)
    if cage_length == 2
        return pair_combine(number_goal, given_number)
    else
        total_combinations = Matrix{Int}(undef, 0, cage_length)
        while cage_length > 2
            cage_length -= 1
            for i = 1:number_goal
                new_number_goal = number_goal - i
                combinations = repeat_combinations(cage_length, new_number_goal, i)
                combinations = hcat(i*ones(Int, size(combinations,1)), combinations)
                for j = 1:size(combinations,1)
                    combinations[j,:] = sort(combinations[j,:])
                end
                total_combinations = [total_combinations; combinations]
            end
            index = []
            for i = 1:size(total_combinations,1)
                for j = i+1:size(total_combinations,1)
                    if (total_combinations[i,:] == total_combinations[j,:])
                        push!(index, j)
                    end
                end
            end
            total_combinations = total_combinations[setdiff(1:end, index), :]
        end
        return total_combinations
    end
        
end

function pair_combine(number_goal, given_number)
    pairs = Matrix{Int}(undef, 0, 2)
    for i in 1:(ceil(Int, number_goal/2) - 1)
        if given_number != i && given_number != (number_goal - i)
            num1 = i
            num2 = number_goal - i
            pairs = [pairs; num1 num2]
        end
    end
    return pairs
end
killer_sudoku_cheats(2,10,[1,4])