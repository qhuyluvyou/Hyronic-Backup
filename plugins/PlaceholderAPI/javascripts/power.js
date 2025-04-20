var skill = PlaceholderAPI.static.setPlaceholders(BukkitPlayer,"%aureliumskills_power%");

function hasKit(){

  var power = skill / 9;

  return power.toFixed(1);

}

hasKit();