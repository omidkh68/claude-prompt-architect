# Examples

These examples are intentionally generic and contain no project-specific implementation details.

## Bug fix

Input:

> Clicking Save multiple times sends duplicate requests. Only one submission should be active at a time.

Expected generated prompt behavior:

- inspect the actual save/request flow,
- identify the owner of the submission state,
- trace event and async handling,
- identify the root cause,
- reuse an existing submission/loading pattern where available,
- prevent concurrent duplicate submissions,
- preserve normal success and error behavior,
- verify that a new save is possible after the previous request completes.

## Existing implementation alignment

Input:

> Make the new profile form behave like the existing account form for validation, loading, error handling, and accessibility.

Expected generated prompt behavior:

- inspect the existing reference form,
- identify the relevant established patterns,
- reuse applicable validation and state handling,
- avoid creating a parallel implementation,
- preserve unrelated behavior,
- verify the requested areas independently.

## API integration

Input:

> Integrate the new endpoint using the existing API service patterns and preserve the supplied request and response field names exactly.

Expected generated prompt behavior:

- inspect existing API integration patterns,
- preserve HTTP method, endpoint, DTO fields, and casing,
- do not invent missing fields,
- reuse the established service/error/loading architecture,
- verify request construction and response handling.

## Android decoding bug

Input:

> Decoded bytes contain unexpected null characters when converted to text.

Expected generated prompt behavior:

- inspect the producer and decoding boundary,
- determine the actual character encoding,
- avoid symptom-only cleanup such as blindly stripping bytes,
- preserve unrelated cryptographic or transport behavior,
- verify decoded value and length.

## Correction

Input:

> Claude reports that form validation is complete, but server-side errors are still not displayed next to the affected fields.

Expected generated prompt behavior:

- verify the previous implementation report,
- retain correctly completed behavior,
- identify the remaining gap,
- correct only the incomplete behavior,
- verify both the correction and preserved functionality.

## Engineering report continuation

Input:

> Here is Claude's previous engineering report. Continue only the remaining work.

Expected generated prompt behavior:

- treat report claims as reported rather than automatically verified,
- reconcile them with the current repository,
- retain verified completed work,
- correct inaccurate claims where necessary,
- continue only incomplete work,
- report fresh verification separately.
