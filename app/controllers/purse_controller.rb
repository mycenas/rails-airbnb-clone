class ViewPurseController < ApplicationController
before_action :set_user, only: [:view_purse, :view_stats, :view_abilities]

  def view_purse
    # an adventurer can view their purse and see how many coins is inside
    @coins = @user.coins
    @current_action = "view_purse"
  end

  def view_stats
    # an adventurer can view their stats, random stats for each adventurer vai seeds
    @current_action = "view_stats"
      generate_stats if @user.str.nil? || @user.dex.nil? || @user.int.nil?
    end
  end

  def view_abilities
  end

  def character_class

  end

  def level
    # seeding random levels for each user
  end

  private

  def set_user
    @user = current_user
  end

  def generate_stats
    @user.str = rand(1..5)
    @user.dex = rand(1..5)
    @user.int = rand(1..5)
    @user.save
  end

  def generate_character
    chracter_classes = [
      {
        name: Rogue,
        description: "The rogue or thief is one of the standard playable character classes in most editions of the Dungeons & Dragons fantasy role-playing game. A rogue is a versatile character, capable of sneaky combat and nimble tricks.",
        stats: "DEX"
      },
      {
        name: Druid,
        description: "The druid is a playable character class in the Dungeons & Dragons fantasy role-playing game. Druids wield nature-themed magic. Unlike clerics, druids do not have special powers against undead and, in some editions, cannot use metal armor.",
        stats: "STR"
      },
      {
        name: Paladin,
        description: "The paladin is one of the standard playable character classes in most editions of the Dungeons & Dragons fantasy role-playing game. The paladin is a holy knight, crusading in the name of good and order, and is a divine spellcaster.",
        stats: "INT"
      }
    ]
    selected_character = character_classes.sample
    @user.characters = [selected_character]
    @user.save
  end
end
