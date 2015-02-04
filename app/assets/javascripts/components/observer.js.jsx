/** @jsx React.DOM */

// Component Structure
// - CurrentGame
//   - PlayerList
//     - Player

var CurrentGame = React.createClass({

  // get game info
  loadGameData: function() {
    $.ajax({
      url: '/example.json',
      dataType: 'json',
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error('#GET Error', status, err.toString());
      }.bind(this)
    });
  },

  getInitialState: function(){
    return {data: 
      {
        gameMode: '',
        gameType: '',
        platformId: '',
        bannedChampions: [],
        participants: []
      }
    };
  },

  componentDidMount: function() {
    this.loadGameData();
  },

  render: function() {
    return (
      <div className="CurrentGame">
        <h1> Current Game Information</h1>
        <PlayerList data={this.state.data}/>
      </div>
    );
  }
});



var PlayerList = React.createClass({

  // here we access with 'this.props' 
  // the data from parent Component

  render: function() {
    var gameParticipants = this.props.data.participants.map(function(player) {
      return (
        <Player player={player} />
      )
    })

    return (
      <table className="playerList table">
        <thead>
          <th>
            Champion
          </th>
          <th>
            Summoner Name
          </th>
        </thead>
        <tbody>
          {gameParticipants}
        </tbody>
      </table>
    )
  }

});



var Player = React.createClass({
  render: function() {
    return(
      <tr className="Player">
        <th>
          {this.props.player.championId}
        </th>
        <th>
          {this.props.player.summonerName}
        </th>
      </tr>
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
