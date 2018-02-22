def get_fishes(amount)
  fishes = []

  (0...amount).each do |i|
    fish = "f"
    (0..i).each { |unused| fish << "i" }
    fish << "sh"
    fishes << fish
  end

  fishes
end

def simulate_o_n_time(n)
  fishes = get_fishes(n)

  start_time = Time.now
  fishes.each { |fish| fish.length == fish.length }
  end_time = Time.now
  
  c = 2
  c * (end_time - start_time)
end

def linear_runtime_with_sample?(n, &prc)
  linear_run_time = simulate_o_n_time(n)
  proc_run_time = runtime_with_n_fishes(n, &prc)
  proc_run_time < linear_run_time
end

def simulate_o_n_log_n_time(n)
  fishes = get_fishes(n)

  start_time = Time.now
  fishes.sort
  end_time = Time.now
  
  c = 2
  c * (end_time - start_time)
end

def n_log_n_runtime_with_sample?(n, &prc)
  n_log_n_run_time = simulate_o_n_log_n_time(n)
  proc_run_time = runtime_with_n_fishes(n, &prc)
  proc_run_time < n_log_n_run_time
end

def simulate_o_n_n_time(n)
  fishes = get_fishes(n)

  start_time = Time.now
  fishes.each do |fish|
    fishes.each do |other_fish|
      fish.length == other_fish.length
    end
  end
  end_time = Time.now
  
  c = 2
  c * (end_time - start_time)
end

def n_n_runtime_with_sample?(n, &prc)
  n_n_run_time = simulate_o_n_n_time(n)
  proc_run_time = runtime_with_n_fishes(n, &prc)
  proc_run_time < n_n_run_time
end

def runtime_with_n_fishes(n, &prc)
  fishes = get_fishes(n)

  start_time = Time.now
  prc.call(fishes)
  end_time = Time.now
  
  end_time - start_time
end
