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
    return {data: []};
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

    console.log(this.props.data);

    return (
      <div className="PlayerList">
        I'm the Player List {this.props.data}
        <Player author="The Mini John" />
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
      <CurrentGame data="/example.json" />,
      document.getElementById('currentGameBox')
    );
  }
})
