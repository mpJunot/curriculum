# CV

Source unique de mon CV. Le PDF est compilé automatiquement à chaque push
et publié à une URL stable.

**→ [Dernière version du CV](https://TONPSEUDO.github.io/cv/cv.pdf)**

---

## Mise en route

### 1. Créer le repo

```bash
cd cv
git init -b main
git add .
git commit -m "chore: initialisation du CV"
gh repo create cv --public --source=. --push
```

Sans la CLI GitHub : crée le repo depuis l'interface web, puis

```bash
git remote add origin git@github.com:TONPSEUDO/cv.git
git push -u origin main
```

### 2. Activer GitHub Pages

`Settings` → `Pages` → **Source : GitHub Actions**.

Le premier push déclenche le build. Le CV est ensuite disponible à
`https://TONPSEUDO.github.io/cv/cv.pdf` — c'est cette URL que tu mets sur
LinkedIn et dans ta signature mail. Elle ne change jamais.

> Pages n'est gratuit que sur les repos publics. Sur un repo privé, supprime le
> job `deploy` du workflow : le PDF reste téléchargeable depuis l'onglet
> **Actions**, en pièce jointe de chaque run.

### 3. Compiler en local

```bash
brew install typst   # macOS
make cv              # → build/cv.pdf
make watch           # recompile à chaque sauvegarde
```

`make install-hook` ajoute un hook qui refuse un commit si le CV ne compile pas.

---

## Structure

```
cv.typ                      la source, tout est là
assets/                     photo, logos éventuels
Makefile                    make cv | watch | clean | install-hook
CHANGELOG.md                journal des modifications
.github/workflows/build.yml compilation + publication
```

Le PDF n'est jamais commité — il est dans le `.gitignore`. La source fait foi.

---

## Au quotidien

**Modifier le contenu.** Tout se passe dans `cv.typ`. Les variables du haut
(nom, email, liens) sont regroupées pour être changées d'un coup. Les fonctions
`entree()`, `section()` et `skill()` gèrent la mise en forme — tu ne touches
qu'au texte.

**Tracer ce que tu envoies.** Avant une candidature :

```bash
git tag candidature-nomboite && git push --tags
```

Six mois plus tard, tu retrouves exactement la version reçue par le recruteur.

**Gérer des variantes.** Une branche par profil (`mobile`, `backend`), où tu
changes l'accroche et l'ordre des expériences. Le tronc commun reste sur `main`,
que tu fusionnes dans les variantes quand tu ajoutes une expérience.

**Version anglaise.** Duplique en `cv-en.typ` et ajoute une ligne au workflow :

```yaml
typst compile cv-en.typ public/cv-en.pdf
```

---

## Personnalisation

| Quoi | Où |
|---|---|
| Police | `#set text(font: (...))` — la première disponible gagne |
| Couleurs | variables `accent`, `muted`, `rule` en haut du fichier |
| Marges | `#set page(margin: ...)` |
| Taille du texte | `#set text(size: ...)` — descends à 9.3pt pour tenir sur une page |

La police par défaut est Inter si elle est installée, sinon New Computer Modern
Sans, livrée avec Typst. Le rendu CI est donc garanti même sans Inter.

---

## Notes

- Si le build échoue sur `setup-typst`, vérifie la dernière version publiée de
  l'action et ajuste le tag.
- Sur un repo public, ton email et tes liens sont publics. Le téléphone et
  l'adresse postale n'ont pas leur place ici : garde-les pour une variante
  générée en local.
