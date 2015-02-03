/** @jsx React.DOM */

// Component Structure
// - CurrentGame
//   - PlayerList
//     - Player

var CurrentGame = React.createClass({
  render: function() {
    return (
      <div className="CurrentGame">
        <h1> Current Game Information</h1>
        <PlayerList />
      </div>
    );
  }
});

var PlayerList = React.createClass({
  render: function() {
    return (
      <div className="PlayerList">
        I'm the Player List
        <Player />
      </div>
    );
  }
});

var Player = React.createClass({
  render: function() {
    return(
      <div className="Player">
        I'm a individual Player
      </div>
    )
  }
});

// Render
$(document).on("page:change", function() {
  var $content = $("#currentGameBox");
  if ($content.length > 0) {
    React.render(
      <CurrentGame />,
      document.getElementById('currentGameBox')
    );
  }
})
