defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    percent = discount / 100
    discount = before_discount * percent
    before_discount - discount
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate = daily_rate(hourly_rate)
    daily_rate_discounted = apply_discount(daily_rate, discount)
    ceil(daily_rate_discounted * 22)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate = daily_rate(hourly_rate)
    total = apply_discount(daily_rate, discount)
    Float.floor(budget / total, 1)
  end
end
