import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  connect() {
    const searchClient = algoliasearch('JD2V2YE8DN', 'cce8dc90dda32cc8c4e45fa319caa120');

    const search = instantsearch({
      indexName: '20240206_ski_products_test',
      searchClient,
    });
    search.addWidgets([
      instantsearch.widgets.searchBox({
        container: '#searchbox',
      }),

      instantsearch.widgets.hits({
        container: '#hits',
        templates: {
          item: (hit, { html, components }) => html`
            <a href="/products/${hit.id}">
              <div class="card">
                <h1>${components.Highlight({ hit, attribute: 'name' })}</h1>
                <p>${components.Highlight({ hit, attribute: 'details' })}</p>
              </div>
            </a>
          `,
        },

      })
    ]);

    search.start();
  }
}
