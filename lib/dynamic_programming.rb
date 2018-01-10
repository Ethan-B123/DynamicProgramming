class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @hops_cache = {}
    @knapsack_cache = { 0 => 0 }
  end

  def blair_nums(n)
    return @blair_cache[n] if !@blair_cache[n].nil?
    @blair_cache[n] = blair_nums(n - 1) + blair_nums(n - 2) + (2 * n - 1)
  end

  def frog_hops_bottom_up(n, k = 3)
    return @hops_cache[n] if @hops_cache[n]
    p @hops_cache
    ret_arr = []
    (1..k).each do |hop_size|
      if n - hop_size > 0
        ret_arr += frog_hops_bottom_up(n - hop_size, k)
          .map { |hops| hops + [hop_size] }
      elsif n - hop_size == 0
        ret_arr << [hop_size]
      end
    end
    @hops_cache[n] = ret_arr
  end

  def frog_cache_builder(n)
    frog_hops_bottom_up(n)
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    frog_hops_top_down_helper(n - 1) if n > 1
    frog_cache_builder(n)
  end

  def super_frog_hops(n, k)
    @hops_cache = {}
    frog_hops_bottom_up(n, k)
  end

  def knapsack(weights, values, capacity)
    
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
