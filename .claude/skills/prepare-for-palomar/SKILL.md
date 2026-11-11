---
name: prepare-for-palomar
description: Prepare a Lean repository for a Palomar Registry submission, including its Challenge/Solution surface, Comparator configuration, metadata, and policy-aware validation.
---

# Prepare For Palomar

Prepare a repository for Palomar without changing the underlying formalization unless the user explicitly asks for that. Do not commit, push, or submit on the user's behalf unless separately authorized.

## Establish the current contract

Read the current [How to submit](https://palomar-registry.org/how-to-submit), the linked Palomar submission policy, and the current `formalization.yaml` standard before choosing files or validation commands. The policy and checker evolve, so do not rely on remembered schemas, accepted Lean versions, or verifier pins.

Inspect the repository before editing: its public remote and Git state, Lakefile and manifest, toolchain, root licence, dependencies, existing theorem statements, README/provenance, and any existing Comparator configuration. Treat uncommitted user changes as belonging to the user.

## Choose the statement surface

### Require human-written sources and copy them strictly

Before assembling `Challenge.lean`, identify the human-written files containing every target theorem statement and every project-local definition or other declaration needed to pose the challenge, including transitive statement dependencies. Establish their human-written provenance from repository evidence or the user's identification; do not assume that a file is human-written merely because it is outside `Auto/`. If any target theorem or required dependent definition is absent from human-written files, or its provenance is unclear, block Challenge preparation and ask the user for clarification. Do not silently use agent-generated declarations, invent replacements, or recast the result. This requirement does not require human-written solution proofs or copies of declarations already available through permitted library imports.

Include only the selected final, advertised theorems and the human-written code indispensable to posing them. Copy that code strictly from the human-written sources, including exact docstrings, comments, declaration names, binders, hypotheses, types, attributes, notation, and complete definition or structure bodies. Preserve wording, punctuation, whitespace, namespace, and relevant surrounding Lean context. Do not paraphrase, reformat, replace code by definitionally equivalent formulations, add helper content, or write new comments or docstrings. If a declaration has no docstring, leave it without one. Omit implementation notes (including sections titled "Implementation note(s)" or paragraphs beginning `**Implementation note:**`, and their separating blank line); preserve the rest verbatim and do not relocate or rewrite those notes in Challenge.

Modify copied material only as strictly necessary to assemble a valid standalone Lean Challenge: select permitted imports, arrange the copied declarations and their required namespace/section context, and replace target theorem proof bodies with deliberate `sorry` placeholders. Preserve theorem statements through `:=` verbatim. Do not change mathematical content or add agent-authored declarations. If assembly would require a substantive change, block and ask for clarification. Record any necessary assembly adjustments outside Challenge, in the preparation report.

The only prescribed non-source text is the copyright-header assembly notice and the fixed module heading below. After imports, the module docstring must be exactly:

```lean
/-!
# Challenge file for Comparator
-/
```

No references, context, explanations, qualifications, or other prose may be added to that module docstring or elsewhere in Challenge. Put necessary reporting or source references in README, metadata, or the preparation report instead. These restrictions override all general documentation, generation-notice, and typography guidance for Challenge, in both substantive repositories and thin wrappers.

Compare each copied declaration, its docstring, and its required context directly against the human-written source before finishing. Verify that differences are limited to omitted implementation notes and necessary Lean assembly adjustments, that every copied source is listed in the header, and that no agent-authored content has been introduced. A successful build or definitional-equality check alone does not establish strict copying.

Confirm which mathematical results the user wants registered. Comparator and Challenge should contain only those final, advertised declarations and their indispensable statement dependencies -- not supporting lemmas, pointwise estimates, finite special cases, or definitions merely because they occur in the proof. If a supporting result is itself a principal result of the source, flag that selection decision rather than silently hiding it.

Challenge's transitive imports must satisfy Palomar's current allowlist: no project-specific source may appear in that closure. Prefer Mathlib. Preserve the canonical fully-qualified theorem names and namespaces from the human-written sources; do not introduce a wrapper-specific namespace.

Prefer an import-only Solution when importing the substantive module makes the canonical theorem available to Comparator. Otherwise, use the same canonical namespace and declaration name in Solution and prove a faithful bridge without axioms, `sorry`, or definition holes. If exact statement fidelity cannot be achieved, report it as a blocker. Do not expose intermediate theorems through the Comparator configuration.

## Thin-wrapper mode: explicit request only

Do not create a separate wrapper repository merely because a formalization is large, nor when the user is only asking about the idea. Enter this mode only when the user explicitly asks to create a wrapper or thin wrapper (for example, "create a wrapper," "make a Palomar wrapper repo," or an equivalent direct instruction).

For an explicitly requested wrapper, create a small standalone Lean repository around a pinned immutable revision of the substantive formalization. Confirm or discover the source repository and full commit SHA, exact fully qualified theorem names to expose, wrapper repository location/name, source bibliography, and the user's authority to create or initialize that repository. Preserve the substantive repository unchanged.

Create a root `lakefile.toml` for every wrapper. It must explicitly set `name = "<wrapper-repository-name>"` and `defaultTargets = [...]`, using the wrapper's actual target modules. Require the pinned substantive repository. Do not add a direct `[[require]] mathlib` in thin-wrapper mode: Mathlib is available transitively through the substantive dependency. Add another direct requirement only when it is genuinely needed and not transitively available.

For current Palomar compatibility, ensure every direct `[[require]].name` is a local name that does not need Lean quotation; prefer ASCII letters, digits, and underscores. In particular, do not use `-`: Lake serializes a hyphenated dependency name in `lake-manifest.json` as `«name-with-dashes»`, which Palomar's materializer rejects. A `[[require]].name` may use a safe local alias; this does not rename its GitHub repository, change its `git` URL, or change Lean module imports. After changing a dependency alias, run `lake update` and confirm that no `name` inside the manifest's `packages` array contains `«` or `»`. This rule does not require renaming the wrapper repository or its own Lake package.

Add a repository-local GitHub Actions workflow for every thin wrapper (for example, `.github/workflows/lean.yml`). It must run on `push`, check out the repository, use the Lean toolchain declared in `lean-toolchain`, and build the wrapper's default targets with `lake build` from the repository root. Use `leanprover/lean-action` or an equivalent maintained setup, and preserve an existing equivalent workflow rather than adding a duplicate. This is CI build evidence only and does not replace Palomar's official Comparator, NanoDa, export/replay, or sandbox checks.

The wrapper should expose only the requested advertised theorem(s):

- Its Challenge must remain independently auditable and within Palomar's allowed import closure, normally using Mathlib plus strictly copied human-written statement dependencies under the rules above.
- Its Solution should import the pinned substantive repository and use the canonical declarations directly when possible; otherwise make only the smallest faithful bridge needed for Comparator.
- Pin the substantive dependency in the manifest, record the immutable source revision and the fact that this is a thin wrapper using the current metadata schema, and identify the substantive module or file in Solution and README documentation.
- Keep Comparator configuration limited to the selected final results, not the broader repository's supporting theory.

Validate the wrapper against both environments: the copied Challenge vocabulary must exactly match the substantive declaration vocabulary, and the Solution must use no non-permitted axioms. Report any obstacle that prevents a public, pinned, independently auditable wrapper instead of silently widening its scope.

## Add submission files minimally

Use the conventional root layout when it fits: `Challenge.lean`, `Solution.lean`, `comparator.json`, and `formalization.yaml`. Update Lake configuration only as needed for source discovery and builds.

Give both Lean wrapper files the repository's applicable copyright and licence header. For `Challenge.lean`, replace the author line with exactly these two lines (without an `Authors:` prefix):

```text
This file was assembled by Claude from the human-written files `Defs.lean`, `Theorems.lean`.
No comments were added by Claude.
```

Substitute the actual human-written source filenames, in backticks, for the example filenames; use project-relative paths where needed to distinguish them. Keep the wording, including `Claude`, exactly as shown. Place these lines immediately after the copyright and licence lines, with no intervening blank line, then close the header. Do not add a machine-generated notice to Challenge. For `Solution.lean`, omit an `Authors` line unless the user specifically asks for one. Add a concise module docstring to `Solution.lean`, after its imports, that explains it is the Palomar solution surface and identifies the precise project-relative module or file containing the actual formalization. This is required even for an import-only Solution.

Make `comparator.json` contain only the current accepted keys, with distinct Challenge and Solution modules, a nonempty theorem list, and only Palomar-permitted axioms. Avoid optional entries unless they convey a real need.

Write `formalization.yaml` from repository evidence, not guesses. Include all currently required project identity, authorship, maintainer, licence, classification, source/provenance, automation, and review fields. Classify the mathematics rather than Lean or AI. For a published or otherwise pre-existing theorem, put only the publication reference in `sources[].id`: journal or other publication venue, volume, issue and pages or article number where available, year, and DOI or other stable link; retain a versioned arXiv reference when relevant. Do not repeat the title or authors in `id`; they belong in the separate `title` and `authors` fields. Verify available publication details rather than relying only on the arXiv record. Use `sources[].note` for additional source context, cite the theorem location, and use an accurate source-based relationship such as `formalizes`, `adapts`, or `independently-proves`; reserve `original-proof` for a result first presented by the formalization. Put the full reference in README as well; Challenge module documentation is restricted to its fixed heading. Omit a thin-wrapper section unless the repository is genuinely only a wrapper. Be candid about AI involvement, human review, known divergences, scope, unresolved holes, and axioms. Use optional fields when they are needed to make those facts clear, but do not invent costs, endorsements, ORCIDs, prior formalizations, or novel-result claims.

Set `project.name` in `formalization.yaml` to the human-readable title of the formalization, ending in exactly `in Lean` (for example, `Power weight inequalities for spherical maximal functions in Lean`). Use the source paper title when it accurately describes the submitted scope; do not use a repository slug as the title or change `sources[].title`.

Use the same mathematical `project.description` rule for substantive repositories and thin wrappers. Describe the mathematics and its source directly: in thin-wrapper mode, do not call the repository a wrapper, thin wrapper, or Comparator wrapper, and do not discuss its wrapper implementation there. Begin with `This is a Lean 4 formalization of ...`. Then mildly paraphrase the source paper abstract for the context of the current formalization; do not quote it verbatim. Preserve its mathematical meaning, but describe the results actually formalized and their scope rather than implying that every result in the paper has been formalized. Use plain prose without LaTeX or formulas, and replace first-person "we" phrasing with passive voice. When the submission formalizes the main result(s) of one paper, use this compact shape, filling the placeholders with repository evidence and omitting the brackets:

> This is a Lean 4 formalization of [main theorem(s) formalized] from the paper "[title]" by [authors].
>
> [Mild plain-prose paraphrase of the abstract, adapted to the formalized results and scope.]
>
> Reference: [journal reference, if applicable], [arXiv link].

In every `authors` field (including `project.authors` and `sources[].authors`), write out first names fully wherever verified names are available; do not guess expansions of initials. In the prose `project.description`, source authors may use first-name initials followed by surnames. If there is no journal publication, end the reference with the arXiv link alone; do not describe it as published. When several papers, non-main results, or another source arrangement are involved, preserve the same concise source-first prose while adapting the structure to accurately describe what is formalized.

### Thin-wrapper README

For a thin wrapper, write `README.md` in this order:

1. Start with the H1 title `# Formalization of <subject>`.
2. Follow it with the same mathematical description used as `project.description` in `formalization.yaml`. Adapt only the references for Markdown: use readable linked paper titles, journal or DOI links, and arXiv links rather than YAML-style or bare references.
3. Add a `## Main theorems` section. For every advertised theorem, state its canonical fully qualified Lean name in backticks and reproduce its `Challenge.lean` theorem docstring beneath it, preserving Markdown and LaTeX delimiters so it renders on GitHub.
4. At the bottom, state plainly that the repository is a wrapper around the substantive project and link to that main repository. Also include the sentence `This wrapper was generated predominantly by Claude.`

Do not describe the repository as a wrapper in the main description; wrapper provenance belongs only in this bottom README section and the applicable metadata fields.

If the preparation agent generates `Solution.lean` or `formalization.yaml`, place a short top-level comment in each saying exactly `This file was machine generated by Claude.` Do not append, substitute, or infer a model name, version, or other identity. In generated `Solution.lean`, omit an ordinary `Authors:` line and keep the applicable header in this order: copyright statement, licence statement, then the machine-generated notice, with no intervening blank line. In `formalization.yaml`, keep the YAML language-server schema directive as the first line, followed immediately by the machine-generated disclaimer as a YAML comment. Do not add copyright or licence comments to `formalization.yaml`. Record the models that generated the substantive proof separately and accurately under `automation` in `formalization.yaml`.

Use ASCII punctuation in generated prose, metadata, and documentation: use straight quotation marks and apostrophes, hyphens or double hyphens instead of typographic dashes, and ASCII punctuation generally. Retain non-ASCII characters only when they are genuine diacritics in names or words. This typography rule does not require altering Lean syntax, source theorem names, mathematical notation, or declaration docstrings copied verbatim from the source.

## Add a quick local comparator when useful

When the actual Comparator cannot run locally, use this skill's `assets/QuickComparator.lean` as a fast fallback. Keep that helper in the global skill rather than adding it to the submission repository. From the repository root, first run `lake build`, then execute `lake env lean <path-to-this-skill>/assets/QuickComparator.lean`. It is advisory evidence only and never replaces the official Comparator, NanoDa, export/replay, or sandbox checks.

Implement it with `import Lean`, rather than statically importing both wrapper modules: matching Challenge and Solution declarations can otherwise collide. Read `comparator.json`, dynamically import the Challenge and Solution modules into separate `Lean.Environment`s, and check each configured theorem (and optional configured definition) as follows:

- Require compatible declaration kinds and exact `ConstantVal` signatures, then run `Meta.isDefEq` on the signatures.
- Recursively compare the full `ConstantInfo` of declarations reachable from the advertised statement types. Exclude the configured target declarations themselves so their intentionally different proof bodies are not compared. This matters because a cross-environment defeq alone can miss divergent same-named statement definitions.
- Collect axioms for each Solution theorem and reject any outside both `comparator.json`'s `permitted_axioms` and Palomar's current permitted allowlist. Deliberate Challenge `sorry`s must not be checked as Solution axioms.

The helper uses `#eval! main` so it executes even when Challenge deliberately contains a `sorry`. Its dynamic imports are intentionally outside the target repository's Lake graph; building the wrappers first is required. Validate the fallback with the two commands above and mention its limits explicitly in the final report.

The reusable full-Comparator helper is likewise `scripts/run-comparator.sh` in this skill. On a suitable local Linux host, invoke it from the target repository as `bash <path-to-this-skill>/scripts/run-comparator.sh "$PWD"`. A repository's manual GitHub Action must keep its equivalent command inline (or otherwise make it available to the runner), because a hosted runner does not have the user's global skill directory.

## Current verifier integration

As checked on 2026-10-10, Palomar uses the selected Lean toolchain's bundled
`lake comparator`, `leanexport`, `leanchecker`, `nanoda_bin`, and `con-ron`,
with Linux Bubblewrap (`bwrap`). The current minimum is Lean v4.35.0-rc2.
Recheck the official [starter helper](https://github.com/PalomarRegistry/PalomarTemplate/blob/main/scripts/verify-comparator.sh)
and [submission workflow](https://github.com/PalomarRegistry/PalomarSubmission/blob/main/.github/workflows/submission.yml)
when these details change; do not use the obsolete separately pinned Comparator,
lean4export, NanoDa, or Landrun builds. Some policy prose may lag the executable workflow.

Keep `external_kernels` out of submitted `comparator.json`: the verification helper
adds toolchain-bundled kernels to a temporary protected configuration. A Windows
build or quick comparator is not Linux sandbox verification; do not bypass the
sandbox and report the result as official verification.

Validate both the upstream YAML schema and Palomar's stricter metadata contract.
The current profile permits 1-8 arXiv classifications and 0-8 MSC2020 codes;
project authors and responsible maintainers identify humans, while models belong
under automation. Challenge imports must use the current official allowlist
(Lean core and permitted canonical library closures, currently Mathlib, TauCeti,
and CSLib), never project-specific proof modules. Recheck these evolving rules.

## Validate and report honestly

Run the normal Lean build for the new modules, inspect the selected proof declarations' axioms, validate metadata against the current schema, and run Comparator. Also perform current Palomar structural checks where the official verifier makes them available: licence detection, manifest pins, allowed Challenge import closure, Challenge size, no artifacts/submodules/LFS, and configuration shape.

Run Palomar's actual mechanical verifier or its current official workflow whenever the environment and a public immutable commit make that possible. If a local environment lacks the required Linux sandbox, pinned tools, public commit, or server dispatch, say exactly which official steps were run and which could not be run. A plain `lake build` is useful evidence but is not the authoritative Palomar verification.

Finally, perform a policy-based editorial dry run. Assess statement-to-source alignment, definition fidelity, metadata/provenance, literature support, and whether the result has a credible research audience. Report likely outcome, concrete remaining risks, and an evidence-based likelihood of mechanical and editorial success. Remind the user that final submission requires a public pushed commit and their own authorization declaration.
