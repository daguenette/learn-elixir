defmodule HighScore do
  def new() do
    %{}
  end

  def add_player(scores, name, score \\ 0) do
    Map.put_new(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    if Map.get(scores, name) do
      Map.replace(scores, name, 0)
    else
      Map.put_new(scores, name, 0)
    end
  end

  def update_score(scores, name, score) do
    if Map.get(scores, name) do
      Map.update!(scores, name, fn current_value -> current_value + score end)
    else
      Map.put_new(scores, name, score)
    end
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
