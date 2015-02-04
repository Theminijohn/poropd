/** @jsx React.DOM */

var ItemSearch = React.createClass({

  loadItems: function() {
    $.ajax({
      url: '/items.json',
      dataType: 'json',
      success: function(data) {
        this.setState({items: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error('#GET Error', status, err.toString());
      }.bind(this)
    });
  },

  getInitialState: function(){
    return { 
      searchString: '', 
      items: []
    };
  },

  componentDidMount: function() {
    this.loadItems();
  },

  handleChange: function(e){
    // If I comment out this line, the text box will not change its value.
    // This is because in React, an input cannot change independently of the value
    // that was assigned to it. In my case this is this.state.searchString.
    this.setState({searchString:e.target.value});
  },

  render: function() {

    var items        = this.state.items,
        searchString = this.state.searchString.trim().toLowerCase();

    if(searchString.length > 0){
      // We are searching. Filter the results.
      items = items.filter(function(l){
        return l.name.toLowerCase().match( searchString );
      });
    }

    return (
      <div>
        <input type="text" className="form-control ItemSearch" value={this.state.searchString} onChange={this.handleChange} placeholder="Search Items" />

        <ul className="ItemSearchList"> 
          { 
            items.slice(0,3).map(function(item){
              return (
                <li key={item.id} >
                  <div className="media">
                    <div className="media-left">
                      <a href="#">
                        <img className="media-object" src={item.image} />
                      </a>
                    </div>
                    <div className="media-body">
                      <h4 className="media-heading">{item.name}</h4>
                      {item.description}
                    </div>
                  </div>
                </li>
              )
            }) 
          }
        </ul>
      </div>
    )

  }
});


// Render the ItemSearch component on the page
$(document).on("page:change", function() {
  var $content = $("#currentGameBox");
  if ($content.length > 0) {
    React.render(
      <ItemSearch />,
      document.getElementById('searchItem')
    );
  }
})