# frozen_string_literal: true

class SurveyTest < ActiveSupport::TestCase
  test 'should create a valid inactive survey without sections' do
    survey = create_survey(active: false)
    should_be_persisted survey
  end

  test 'should not create an valid active survey without sections' do
    survey = create_survey(active: true)
    should_not_be_persisted survey
  end

  test 'should not allow a survey without sections to be marked active' do
    survey = create_survey(active: false)
    should_be_true survey.valid?
    survey.active = true
    should_be_false survey.valid?
  end

  test 'should not create a survey with active flag true and empty questions collection' do
    surveyA = create_survey(active: true)
    surveyB = create_survey_with_sections(2)
    surveyB.active = true
    surveyB.save

    should_not_be_persisted surveyA
    should_be_persisted surveyB
    should_be_true surveyB.valid?
  end

  test 'should create a survey with 3 sections' do
    num_questions = 3
    survey = create_survey_with_sections(num_questions, num_questions)
    should_be_persisted survey
    assert_equal survey.sections.size, num_questions
  end

  test 'should create a survey with 2 questions' do
    num_questions = 2
    survey = create_survey_with_sections(num_questions, 1)
    should_be_persisted survey
    assert_equal survey.sections.first.questions.size, num_questions
  end

  test 'should not create a survey with attempts_number lower than 0' do
    survey = create_survey(attempts_number: -1)
    should_not_be_persisted survey
  end

  test 'should not save survey without name' do
    survey_without_name = create_survey(name: nil)
    should_not_be_persisted survey_without_name
  end

  test 'should not save survey without description' do
    survey_without_description = create_survey(description: nil)
    should_not_be_persisted survey_without_description
  end

  test 'should have the correct associations via "has_many_surveys"' do
    lesson = create_lesson
    survey = create_survey_with_sections(2, 1)
    survey.lesson_id = lesson.id
    survey.save

    assert_equal survey, lesson.surveys.first
  end
end
