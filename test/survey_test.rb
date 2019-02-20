# frozen_string_literal: true

require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  test 'should pass if all the users has the same score' do
    user_a = create_user
    user_b = create_user
    survey = create_survey_with_sections(2)

    create_attempt_for(user_a, survey, all: :right).save!
    create_attempt_for(user_b, survey, all: :right).save!

    assert_equal participant_score(user_a, survey),
                 participant_score(user_b, survey)
  end
end
