require 'rails_helper'

describe UserPolicy do
  subject { UserPolicy.new(current_user, user) }

  let(:user) { FactoryGirl.create(:salesman) }

  context "for user on himself" do
    let(:current_user) { user } #let(:current_user) { nil }

    it { should permit(:show)    }
    it { should forbid(:create)  }
    it { should forbid(:new)     }
    it { should permit(:update)  }
    it { should permit(:edit)    }
    it { should forbid(:destroy) }
  end

  context "for user on other users" do
    let(:current_user) { FactoryGirl.create(:user) } #let(:current_user) { nil }

    it { should forbid(:show)    }
    it { should forbid(:create)  }
    it { should forbid(:new)     }
    it { should forbid(:update)  }
    it { should forbid(:edit)    }
    it { should forbid(:destroy) }
  end

  context "for an admin on not an Admin user" do
    let(:current_user) { FactoryGirl.create(:admin) }

    it { should permit(:show)    }
    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:edit)    }
    it { should permit(:destroy) }
  end

  context "for an admin on an Admin user" do
    let(:current_user) { FactoryGirl.create(:admin) }
    let(:user) { current_user }

    it { should permit(:show)    }
    it { should forbid(:create)  }
    it { should permit(:new)     }
    it { should forbid(:update)  }
    it { should permit(:edit)    }
    it { should permit(:destroy) }
  end

  context "for an owner on any not Owner user" do
    let(:current_user) { FactoryGirl.create(:owner) }
    let(:user) { FactoryGirl.create(:admin) }

    it { should permit(:show)    }
    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:edit)    }
    it { should permit(:destroy) }
  end

  context "for an owner on Owner user" do
    let(:current_user) { FactoryGirl.create(:owner) }
    let(:user) { current_user }

    it { should permit(:show)    }
    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:edit)    }
    it { should forbid(:destroy) }
  end
end

# describe UserPolicy do
#   describe "test" do
#     it "tests user admin policy" do
#       current_user = create(:admin)
#       user = create(:owner)
#       expect(UserPolicy.new(current_user, user)).not_to permit(:update)
#     end
#   end
# end