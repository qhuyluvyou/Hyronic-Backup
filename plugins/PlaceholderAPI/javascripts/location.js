var world = "player_world"
var worldName = PlaceholderAPI.static.setPlaceholders(BukkitPlayer, "%" + world + "%")
var region = "worldguard_region_name"
var regionName = PlaceholderAPI.static.setPlaceholders(BukkitPlayer, "%" + region + "%");

function hasKit(){

  if (worldName == "spawn") {
    if (regionName == "shop") {
      return "&f௎ &6Abigail's Shop"
    }
  }

  if (worldName == "spawn") {
    if (regionName == "blacksmith") {
      return "&fオ &#AA4A44Blacksmith's House"
    }
  }

  if (worldName == "spawn") {
    if (regionName == "prize_corner") {
      return "&f௑ &ePrize Corner"
    }
  }

  if (worldName == "spawn") {
    if (regionName == "dungeon_portal") {
      return "&f௓ &dDungeon Portal"
    }
  }

  if (worldName == "spawn") {
    if (regionName == "ah") {
      return "&fௐ &6Auction House"
    }
  }

  if (worldName == "spawn") {
    if (regionName == "library") {
      return "&f௒ &#5885AFLibrary"
    }
  }

  if (worldName == "spawn") {
    if (regionName == "hall_of_fame") {
      return "&f௏ &6Hall of Fame"
    }
  }

  if (worldName == "spawn") {
    if (regionName == "jeweler") {
      return "&f఺ &#89CFF0Jeweler's House"
    }
  }

  if (worldName == "spawn") {
    if (regionName == "alchemy_room") {
      return "&f౎ &#ffb2aeAlchemy Room"
    }
  }

  if (worldName == "spawn") {
    return "&f௉ &#89CFF0Draford"
  }

  if (worldName == "world_nether") {
    return "&fோ &#EE4B2BNether"
  }

  if (worldName == "world") {
    return "&fொ &#50C878Overworld"
  }

  if (worldName == "world_the_end") {
    return "&fௌ &#753a97The End"
  }

  if (worldName.startsWith("coven_")) {
    return "&f் &#753a97The Veil"
  }

  return "&8 Locating...";
}

hasKit();