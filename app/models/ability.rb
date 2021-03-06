class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new # guest user
      admin = Role.find_by_title('admin')
      if user.roles.include?(admin)
        can :manage, :all
      else
        can :read, :all
        can :list, :all
        can :unanswered, Question

        #workaroud for custom action via AJAX call. Permission is checked in action
        can :mark_as_deleted, :all
        can :vote_for, :all
        can :vote_against, :all
        can :unvote_for, :all
        can :unvote_against, :all
        can :update_organizations, :all
        can :update_study_programs, :all
        can :update_fields, :all
        can :autocomplete_tag_list, :all
        can :link_user_accounts, :all
        can :create, [ Activity, Answer, Friendship, User ]
        #del spamo
        # can :create, [Comment, Question]

        if user.try(:username)
          #can :create, [ActivityArea, Company, Country, ExchangeProgram, ExchangeStudy, FullStudy, Internship, Ngo, Organization, StudyProgram, StudyType, SubjectArea, University, Activity, Post, Concept, Revision]
          can :create, [Activity, Concept, Post, Revision]
        end

        if user.try(:username)
          can :create_country, [Concept]
          can :create_organization, [Concept]
          can :create_study_program, [Concept]
          can :create_exchange_program, [Concept]
          can :create_activity_area, [Concept]
        end

        if user.try(:username)
         # can :update, [ ActivityArea, Company, Country, ExchangeProgram, ExchangeStudy, FullStudy, Internship, Ngo, Organization, StudyProgram, StudyType, SubjectArea, University, Concept, Revision]
          can :update, [Concept, Post, Revision]
        end
 
        can [:update, :destroy], User do |edit_user|
          edit_user == user
        end

         can [:update, :destroy], Post do |post|
             post.try(:user) == user
         end

         can [:update, :destroy], Activity do |activity|
             activity.user == user
         end

         can [:update, :destroy], Question do |question|
             question.try(:user) == user
         end

         can :destroy, Answer do |answer|
             answer.try(:user) == user
         end

         can :destroy, Comment do |comment|
             comment.try(:user) == user || comment.try(:post).try(:user) == user
         end

         can :destroy, Friendship do |friendship|
             friendship.try(:user) == user
         end

      end
  end
end

