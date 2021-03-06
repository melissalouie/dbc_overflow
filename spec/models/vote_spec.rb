require 'spec_helper'

describe Vote do
  let(:vote) { Vote.create }
  describe "all votes regardless of voteable type" do

    it "has a user" do
      vote.create_user
      expect(vote.user).to be_an_instance_of(User)
    end
  end

  describe "a vote with a question type" do
    let(:question) { Question.create(title: "question title", body: "question body", user_id: 1) }

    it "has a question" do
      question.votes << vote
      expect(vote.voteable).to be_an_instance_of(Question)
    end
  end

  describe "a vote with an answer type" do
    let(:answer) { Answer.create(body: "answer body", question_id: 1, user_id: 1) }

    it "has an answer" do
      answer.votes << vote
      expect(vote.voteable).to be_an_instance_of(Answer)
    end
  end

end
