import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static values = {
    index: String
  }

  connect() {
    const searchClient = algoliasearch('JD2V2YE8DN', 'cce8dc90dda32cc8c4e45fa319caa120');

    const search = instantsearch({
      indexName: this.indexValue,
      searchClient,
    });

    search.addWidgets([
      instantsearch.widgets.searchBox({
        container: '#searchbox',
        placeholder: "Find ski equipment to rent!"
      }),

      instantsearch.widgets.refinementList({
        container: '#filter-list',
        attribute: 'category',
      }),

      instantsearch.widgets.hits({
        container: '#hits',
        templates: {
          empty(results, { html }) {
            return html`No results for <q>${results.query}</q>`;
          },
          item: (hit, { html, components }) => html`
            <a class="hit-link" href="/products/${hit.id}">
              <div class="hit-image">
                <img height="200" src=${hit.image_url}/>
              </div>
              <h3 class="hit-name">${components.Highlight({ hit, attribute: 'name' })}</h3>
              <div class="hit-data">
                <p class="category-tag">${hit.category}</p>
                <p class="price-tag">€${hit.price_per_day}/day</p>
              </div>
            </a>`
        },
        escapeHTML: true
      })
    ]);

    search.start();
  }
}
