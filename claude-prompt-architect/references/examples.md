# Examples

## Bug fix

Input:

> Backhaul reloads when the page gains focus. Load initially and on Submit only.

Expected generated prompt behavior:

- inspect existing request flow,
- trace focus/lifecycle/state subscriptions,
- find the actual refresh owner,
- preserve initial load,
- preserve Submit-triggered load,
- remove only the unintended focus refetch,
- verify focus/blur produces no request.

## Existing implementation alignment

Input:

> Make Core Timeseries match Timeseries for zoom, reset, legends, multi KPI, axis min/max and export.

Expected behavior:

- inspect the reference Timeseries implementation,
- compare only the requested behaviors,
- reuse established shared architecture,
- verify legend visibility and axis bounds,
- avoid unrelated redesign.

## Android decoding bug

Input:

> Decoded bytes [48, 0, 57, 0] produce extra characters when decoded with UTF_8.

Expected behavior:

- inspect producer encoding and decode boundary,
- verify the real encoding,
- avoid merely stripping zero bytes,
- preserve cryptographic behavior unless evidence requires changes,
- verify output value and length.

## Correction + continuation

Input:

> Claude reports the filters are finished, but they are still behind a bottom toggle. Keep the cube icons and route move; finish the filter correction.

Expected behavior:

- verify previous report claims,
- keep correct route/icon work,
- fix only remaining filter behavior,
- verify preserved functionality,
- report retained vs corrected work separately.
