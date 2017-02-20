require 'rails_helper'
require 'user'

RSpec.describe User, type: :model do

  context 'Validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:password_confirmation) }
  end

  context "testing password confirmation" do
    before do
      @user = User.new(
      first_name: 'Bob',
      last_name: 'Lezboub',
      email: 'blezboub@gmail.com',
      password: 'cestmoilezboub',
      password_confirmation: 'rienavoir'
      )
    end

    it "should not save user to database" do
      expect(@user.save).to eq(false)
    end
  end

  context "refusing identical email addresses"
    before do
      @user1 = User.create(
      first_name: 'Tara',
      last_name: 'Lala',
      email: 'taralala@gmail.com',
      password: 'uneautreundeux',
      password_confirmation: 'uneautreundeux'
      )

      @user2 = User.new(
      first_name: 'Copy',
      last_name: 'Cat',
      email: 'TaraLala@GMAIL.com',
      password: 'alwaysgonbelong',
      password_confirmation: 'alwaysgonbelong'
      )

    end

    it "should not accept the email address" do
      expect(@user2.save).to eq(false)
    end

  context "refusing user if password is missing"
    before do
      @user3 = User.new(
      first_name: 'Suhbro',
      last_name: 'Namuchu',
      email: 'pratprat@hotmail.fr'
      )
  end

  it "should not register user who does not have a password" do
    expect(@user3.save).to eq(false)
  end

  context "refusing user if password is too long"
    before do
      @user4 = User.new(
      first_name: 'Ble',
      last_name: 'Bleubleu',
      email: 'blebleubleu@gmail.ca',
      password: 'jaiunmotdepassebeaucouptroplongtesunoufcavajamaismarcher',
      password_confirmation: 'jaiunmotdepassebeaucouptroplongtesunoufcavajamaismarcher'
      )
    end

  it "should not register user whose password is too long" do
    expect(@user4.save).to eq(false)
  end

  context '.authenticate_with_credentials'
    before do
      @user5 = User.create(
      first_name: 'Dongyong',
      last_name: 'Doubloub',
      email: 'doubloub@gmail.com',
      password: 'Yeayeayeamdbp',
      password_confirmation: 'Yeayeayeamdbp'
      )
    end

  it "should not authenticate user if credentials are wrong" do
    expect(@user5.authenticate_with_credentials('doubloud@gmail.com', 'nopenopenope')).to eq(nil)
  end


end
