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
          empty(results, { html }) {
            return html`No results for <q>${results.query}</q>`;
          },
          item: (hit, { html, components }) => html`
            <a href="/products/${hit.id}">
              <div class="hit-image">
                <img height="200" src=${hit.image_url}/>
              </div>
              <div class="hit-text" style="text-decoration:none">
                <h3 class="hit-name">${components.Highlight({ hit, attribute: 'name' })}</h1>
                <p class="category-tag">€${hit.price_per_day}/day</p>
                <p class="hit-desc">${components.Highlight({ hit, attribute: 'details' })}</p>
              </div>
            </a>`
        },
        escapeHTML: true
      })
    ]);

    search.start();
  }
}
