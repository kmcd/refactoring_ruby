# Original
if !((score > 700) ||
  ((income >= 40000) && (income <= 100000) &&
  authorized && (score > 500)) ||
  (income > 100000))
  reject
else
  accept
end


acceptable_income? ? accept : reject

def acceptable_income?
   authorised_income_with_good_score? || high_earner?
end

def authorised_income_with_good_score?
  high_score? || income_within_range? && authorized && above_score_threshold?
end

def high_score?
  score > 700
end

def above_score_threshold?
  score > 500
end

def income_within_range?
  income >= 40000 && income <= 100000
end

def high_earner?
  income > 100000
end

def acceptable(score, income, authorized)
  return true if score > 700 || income > 100000
  return false if score <= 500 || income < 40000
  return authorized
end

acceptable(income, score, authorized) ? accept : reject

