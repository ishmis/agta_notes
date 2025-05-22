#import "@preview/ctheorems:1.1.3": *
#import "@preview/lovelace:0.3.0": *
// maybe:
// #import "@preview/game-theoryst:0.1.0": *

#show: thmrules.with(qed-symbol: $qed$)

// custom function to add numbering to a specific line in math mode
#let neqn(num, vspace, content) = {
  v(vspace)
  math.equation(
    block: true, 
    numbering: num, 
    content
  )
}

#let theorem = thmbox("theorem", "Theorem",
                     fill: rgb("#eeffee"),
                      inset: 0.3em,
                      padding: (top: 0em, bottom: 0em), 
                      radius: 0em, 
                      separator: [#h(0em):#h(0em)]).with(numbering: none)

#let lemma = thmbox("lemma", "Lemma",
                     fill: rgb("#eeffee"),
                      inset: 0.3em,
                      padding: (top: 0em, bottom: 0em), 
                      radius: 0em, 
                      separator: [#h(0em):#h(0em)]).with(numbering: none)


#let proposition = thmbox(
                    "proposition", 
                    "Proposition",
                     fill: rgb("#FFDBBB"),
                     padding: (top: -0.5em, bottom: -0.5em),
                     radius: 0.3em,
                     inset: 0.4em,
                     separator: [#h(0em):#h(0em)]).with(numbering: none)
                      
#let corollary = thmbox(
    "corollary",
    "Corollary",
    // base: "theorem",
    titlefmt: strong,
    namefmt: name => emph([(#name)]),
    inset: (top: 0em, left: 0em, right: 0em),
    padding: (top: -0.5em, bottom: 0em)).with(numbering: none)

#let notation = thmbox(
    "notation",
    "Notation",
    titlefmt: strong,
    namefmt: name => emph([(#name)]),
    inset: (top: 0em, left: 0em, right: 0em),
    padding: (top: -0.5em, bottom: 0em)).with(numbering: none)
    
#let definition = thmbox(
      "definition", "Definition", 
      inset: (x: 0em, top: -0.3em),
      padding: (top: 0em, bottom: 0em), 
      radius: 0em, 
      separator: [#h(0em):#h(0em)]).with(numbering: none)
      
#let example = thmbox(
      "example", "Example",
      namefmt: name => emph([(#name)]),
      titlefmt: emph,
      // numbering: none, 
      inset: (x: 0em, top: 0em),
      padding: (top: 0em, bottom: 0em), 
      radius: 0em, 
      separator: [#h(0em):#h(0em)]).with(numbering: none)
      
#let proof = thmproof(
            "proof",
            "Proof",
            padding: (top: 0em, bottom: 0.5em)).with(
            inset: (top: 0em, left: 0em, right: 0em),)

// custom highlighting 
#let hh(t) = {emph(text(blue)[#t])}
// #highlight does not work in math mode so workaround:
#let hl(content) = box(
  content,
  width: auto,
  height: auto,
  inset: 0.5pt,
  fill: rgb("#fffe69"),
) 

#let hl_custom(content, colour) = box(
  content,
  width: auto,
  height: auto,
  inset: 0.5pt,
  fill: rgb(colour),
) 