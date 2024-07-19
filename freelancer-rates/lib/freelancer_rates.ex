defmodule FreelancerRates do
  @hours 8.0
  @billable_days 22.0

  def daily_rate(hourly_rate) do
    @hours * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    discount_applied_hourly = apply_discount(hourly_rate, discount)

    ceil(@billable_days * daily_rate(discount_applied_hourly))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    day_rate = daily_rate(hourly_rate)
    discounted_day_rate = apply_discount(day_rate, discount)

    Float.floor(budget / discounted_day_rate, 1)
  end
end
