---
layout: default
title: Algebra
type: notes
---

Table of Contents:

* This will become a table of contents (this text will be scraped).
{:toc}

# Algebraic Basics

## Group Theory Basics

A *group* is a set combined with a binary operation $$G = (S, \star)$$ with the following properties:  

*	The set is *closed* under the operation, such that if $$(a \star b) = c \in S$$ such that for all$$a,b \in S$$
*	The operation is associative $$(a \star b) \star c = a \star (b \star c) \; \forall a, b, c \in S$$
*	The set $$S$$ contains a unique identity $$e$$ such that $$e \star a = a = a \star e$$
*	Inverses exist : for each $$a \in S$$ there's a unique $$b \in S$$ such that $$a \star b = e = b \star a$$.  This inverse may be written $$b = a^{-1}$$.

We may write a group as a *product group* where the operation is multiplication, or as as an *additive group*, in which case the identity may be written as $$0$$.

A group is *abelian* if it additionally satisfies the property that $$a \star b = b \star a$$ for all $$a, b \in G$$.

A *group homomorphism* is a map between two groups which maintains group structure. Given two groups $$(F, \star), (G, \bullet)$$ and a map $$a : F \rightarrow G$$ is a homomorphism if $$a(f \star g) = a(f) \bullet a(g)$$ for all $$f, g \in G$$.

The *order* of a group, sometimes written $$o(G)$$ is the number of elements in the underlying set, which may be infinite.

### Subgroups

Given a group $$(G, \star)$$ if a set $$F \subset G$$, if $$(F, \star)$$ still constitutes a group, then $$F$$ is a *subgroup* of $$G$$.

A subgroup $$H$$ of $$G$$ is *normal* if $$gH = Hg$$ for all $$g \in G$$.

The *center* of a group $$G$$ is $$H = \{h \in G : g \star h = h \star g \; \forall g \in G \}$$. This is a subgroup of $$G$$.

Given some group $$G$$, and some element $$a \in G$$, the subgroup *generated* by $$a$$ is $$H = \{a^i : i \in \mathbb{Z}\}$$. The *order of $$a$$* is the order of $$H$$.

A group is $$cyclic$$ if there's an $$a \in G$$ where $$a$$ generates $$G$$.


Properties :  

*	Every subgroup must contain the identity element $$e$$
*	If $$H_1, H_2$$ are subgroups of $$G$$, then $$H_1 \cap H_2$$ is a subset of $$G$$.
*	If $$H_1, H_2$$ are subgroups of $$G$$, and neither us a subset of the other, then $$H_1 \cup H_2$$ is *not* a subgroup of $$G$$
*	Given $$H = \{a^i : i \in \mathbb{Z}\}$$, and defining a function $$f(m) = a^m$$, the order of a $$o(H)$$ is finite iff 
    *	$$f$$ is not injective iff
    *	there exists $$i, j \in \mathbb{Z}$$ such that $$a^i = a^j, i \neq j$$
*	if $$H = \{a^i : i \in \mathbb{Z}\}$$ has finite order, then
    *	$$o(H) = n$$ where $$n$$ is the smallest integer with $$a^n = e$$ and 
    *	$$f^{-1}(e) = n\mathbb{Z}$$ (said another way, $$a^{kn} = e$$ for all $$k \in \mathbb{Z}$$)
*	if $$H$$ is a subgroup of some cyclic $$G$$, then $$H$$ is also a cyclic.

### Cosets and quotient groups

Given a group $$G$$ and a subgroup $$H$$, the left and right *cosets* of $$H$$ containing an element $$g \in G$$ are $$gH = \{g \star h, h \in H\}$$ and $$Hg = \{h \star g, h \in H\}$$.  The cosets of a subgroup form a partition; the union of all left cosets is $$G$$, and any two left cosets are either equal or disjoint, and the same is true of right cosets. In general, these are two *different* partitions, and left and right cosets are distinct.

Cosets form equivalence classes:

*	The right cosets are equivalence classes for a relation defined as $$a \sim b$$ iff $$a \ast b^{-1} \in H$$
*	$$cl(a) = \{b \in G : a \sim b\} = \{h \ast a : h \in H\} = Ha$$
*	The left cosets are equivalence classes for a relation defined as $$a \sim b$$ iff $$b^{-1}\ast a \in H$$
*	$$cl(a) = \{a \ast h : h \in H\} = aH$$
*	Defining an equivalence relation by $$a \sim b$$ iff $$a \ast b^{-1} \in H$$, we can see $$cl(a) = \{b \in G : a \sim b\} = \{h \ast b : h \in H \} = Ha$$.   In English, each coset is an equivalence class of elements which are off from $$a$$ by an element of $$H$$.

Some properties

*	All left cosets and all right cosets have the same order, namely $$o(H)$$ (since $$H$$ is itself a coset).
*	The *index* of $$H$$ is the number of left cosets of $$H$$, writen as $$[G : H]$$.
	*	*Lagrange's Theorem* states that $$[ G : H ] = \frac{\vert G\vert}{\vert H\vert}$$ where $$\vert G\vert$$ and  $$\vert H\vert$$ are the orders of $$G$$ and $$H$$ respectively. Note that the number of left cosets is always equal to the number of right cosets. For example, $$[\mathbb{Z} : n\mathbb{Z}]$$ for any $$n$$.  If $$H$$ is a normal subgroup, then $$[ G : H ] = \vert G / H\vert$$.
	*	The index of a group may be infinite, or uncountable. Any finite subgroup $$H$$ of an infinite $$G$$ contains a normal subgroup $$N$$. If $$H$$ has index $$n$$, then the index of $$N$$ is a factor of $$n!$$. As a consequence, if a subgroup $$H$$ of $$G$$ has index $$p$$ where $$p$$ is the smallest prime factor of $$o(G)$$, then $$H$$ must be normal, as the index of the subgroup $$N$$ of $$H$$ must also be $$p$$ (because there are no smaller factors). 

For a given normal subgroup $$N$$ of $$G$$, the quotient group $$G / N = \{gN, g \in G\}$$, where the group operation over cosets is $$gN \cdot hN = (g \star h)N = \{s \star t :  s \in gN,\,t \in hN \}$$ (the product of two cosets is the coset of products of elements in those cosets).


Example : given the group $$(\mathbb{Z}, +)$$, and subgroup $$(2\mathbb{Z}, +)$$ :  

*	The cosets are just the odd integers, and the even integers
*	Any two odd numbers differ by some even number, and any two even numbers differ by some even number
*	The quotient group $$\mathbb{Z}/2\mathbb{Z}$$ is a cyclic group of these two cosets.

## Monoids

The purely algebraic view of a monoid is that it's like a set without inverses.  That is, it's a set, closed under some associative binary operation, where there exists an unique identity. 

### Monoids and Category Theory

<blockquote><p>A monoid is, essentially, the same thing as a category with a single object.</p></blockquote> 

From a category theory perspective, because the restrictions on a monoid operation (associativity, identity and closure) are the same as the restrictions on morphism composition within a category, we can construct categories from monoids and monoids from categories:

Given a category $$C$$ containing object $$X$$, the set of all endomorphism on $$X$$ given as $$End(X)$$ forms a monoid under morphism composition, with the identity element of the monoid just being the identity function.

Given a monoid $$(M,\star)$$ we can construct a category which contains only one object whose morphisms are the elements of $$M$$. 

### Monoids and FP


In languages like Haskell, a monoid is a pattern where elements of a type can be aggregated or folded together. As an example, lists form a monoid with list concatenation:  

*	closure : concatenating lists always produces a list
*	associativity : parenthesizing list concatenation doesn't matter
*	identity : any list concatenated with the empty list (from the left or the right) gives back the original list.

# Category Theory

## Categories and Morphisms

A *category* $$C$$ has:  

*	a class $$\text{obj}(C)$$ whose elements are *objects*,  
*	a class $$\text{hom}(C)$$ whose elements are *morphisms*,
*	Morphisms are mappings from one object to another.
	*	Each morphism $$f$$ has a *source* and a *target* object $$a, b$$ where we write $$f : a \rightarrow b$$.
	*	We might read "in C, $$f$$ is a morphism from $$a$$ to $$b$$"
	*	We may write $$\text{hom}(a, b)$$.
*	A binary operation $$\circ$$ called *composition of morphisms* satisfying the following properties:
	*	Associativity :  if $$f : a \rightarrow b$$, $$g : b \rightarrow c$$ and $$h : c \rightarrow d$$ then $$(h \circ g) \circ f = h \circ g \circ f = h \circ (g \circ f)$$
	*	Identity :  for any object $$x$$, there exists an identity morphism $$1_x$$ such that for any $$f : a \rightarrow b$$ we have $$1_b \circ f = f = f \circ 1_a$$
 
A category $$C$$ is *small* if $$\text{obj}(C)$$ and $$\text{hom}(C)$$ both form sets rather than proper classes; otherwise they are *large*.

Morphisms come in various flavors. Given $$f : a \rightarrow b$$  :

+	$$f$$ is a *monomorphism* iff it is *left cancellative*, that is$$f \circ g_1 = f \circ g_2 \Longrightarrow g_1 = g_2$$ for all $$g_1, g_2 : z \rightarrow a$$.
	
	+	Monomorphisms are analogues of injective functions; if $$f$$ assigns each input to a distinct output then $$f \circ g_1  = f \circ g_2$$ means that all of the outputs of $$g_1$$ and $$g_2$$ are equal.  
	+	On the other hand if $$f$$ is *not* injective, then there may be some $$z \in Z$$ such that $$g_1(z)$$ and $$g_2(z)$$ are both in the inverse image of some $$y \in Y$$ (through $$f$$).

+	We call $$f$$ an *epimorphism* iff it is *right cancellative*, that is$$g_1 \circ f = g_2 \circ f \Longrightarrow g_1 = g_2$$ for all $$g_1, g_2 : b \rightarrow z$$

	+	Epimorphisms are analogues to surjective functions; if $$f$$ is surjective, then its image covers all of $$Y$$, so saying $$g_1 \circ f = g_2 \circ f$$ is the same as saying that $$g_1$$ and $$g_2$$ are equal for every value in their domain.
	+	On the other hand, if $$f$$ is *not* surjective, then it could be true that $$g_1 \circ f = g_2 \circ f$$ but that $$g_1$$ and $$g_2$$ differ for arguments in $$Y$$ which are *not* in the image of $$f$$.

+	$$f$$ is a *bimorphism* if it's both a monomorphism and an epimorphism
+	$$f$$ is a *retraction* iff it has a right inverse $$g : b \rightarrow a$$ such that $$f \circ g = I_b$$. 

	+	Every retraction is an epimorphism; if $$f \circ f^{-1}$$ then  
		$$g_1 \circ f = g_2 \circ f$$  
		$$g_2 \circ f \circ f^{-1} = g_2 \circ f \circ f^{-1}$$  
		$$g_1 = g_2$$

+	$$f$$ is a *section* iff it has a left inverse $$g : b \rightarrow a $$ such that $$g \circ f = I_a$$.

	+	Every section is a monomorphism; if $$f^{-1} \circ f = I_a$$ then  
		$$f \circ g_1 = f \circ g_2 $$  
		$$f^{-1} \circ f \circ g_1 = f^{-1} \circ f \circ g_2$$  
		$$g_1 = g_2$$

+	we call $$f$$ an *isomorphism* if(f) it has an inverse (both right and left) $$g : b \rightarrow a$$ such that $$f \circ g = I_b$$ and $$g \circ f = I_a$$
	+	When inverses exist, they are unique, and the relation is reciprocal; $$g$$ is also an isomorphism with inverse $$f$$
	+	As with sections and retractions above, every isomorphism is a bimorphism, but not all bimorphisms are isomorphisms
	+	Categories in which every bimorphism is also an isomorphism are called *balanced categories*.

+	We call $$f$$ an *endomorphism* iff $$a = b$$
+	We call $$f$$ an *automorphism* iff it's both an endomorphism and an isomorphism

## Subcategories

A *subcategory* $$S$$ of a category $$C$$ has a subcollection of the objects and morphisms in $$C$$ such that  

* for every $$X$$ in $$\text{obj}(S)$$ $$I_X$$ is in $$\text{hom}(S)$$
* for every morphism $$f : X \rightarrow Y$$ in $$\text{hom}(S)$$, both the source and target $$X$$ and $$Y$$ are in $$\text{obj}(S)$$
* for any two morphisms $$f, g$$ in $$\text{hom}(S)$$, $$f \circ g$$ is also in $$\text{hom}(S)$$.

A *full subcategory* is one in which, for any $$X$$ and $$Y$$ in $$\text{obj}(S)$$ *all* morphisms between $$X$$ and $$Y$$ in $$C$$ are also in $$S$$. For any collection of objects $$A$$ in $$C$$, there's a unique full subcategory of those objects and all morphism between them.

A subcategory $$S$$ of $$C$$ is *ismomorphism-closed* or *strictly closed* if for every $$Y \in S$$ every isomorphism $$k : X \rightarrow C \in \text{hom}(C)$$ is also in $$S$$.

A subcategory $$S$$ of $$C$$ is *wide* or *luff* if $$\text{hom}(S) = \text{hom}(C)$$. $$S$$ may only be both wide and full if $$S = C$$

## Functors
 
A *functor* is a mapping between categories. A functor can also be seen as a morphism in the category of categories. More concretely $$F: C \rightarrow D$$ : 

*	maps every $$X \in C$$ to some $$F(X) \in D$$
*	maps every morphism $$f : X \rightarrow Y \in C$$ to a morphism $$F(f) : F(X) \rightarrow F(Y) \in D$$ such that 
	*	for all $$X \in C ,\;F(1_X) = 1_{F(X)} $$
	*	for all $$f : X \rightarrow Y$$ and $$g : Y \rightarrow Z, \; F(g \circ f) = F(g) \circ F(f)$$ 


The crucial properties of a functor are that :

*	A functor $$F : C \rightarrow D$$ transforms a commutative diagram on $$C$$ to a commutative diagram on $$D$$
*	If $$f$$ is an isomorphism in $$C$$, then $$F(f)$$ is an isomorphism of $$D$$
*	Functors themselves can be composed. Given $$F : A \rightarrow B$$ and $$G : B \rightarrow C$$ we can compose them to make $$G \circ F = H : A \rightarrow C$$.
*	Functions between categories of a single object are monoid homomorphisms.



Ordinary functors may be called *covariant*. A *contravariant* functor reverses the direction of morphisms and composition.  The mapping of objects meets the same requirements, by the mapping of morphism is now constructed such that:

*	 Every morphism $$f : X \rightarrow Y$$ gets mapped to a morphism $$F(f) : F(Y) \rightarrow F(X)$$
*	 **unchanged** $$F(1_X) = 1_{F(X)}$$ for all $$X \in C$$ 
*	 for all $$f : X \rightarrow Y$$ and $$g : Y \rightarrow Z, \; F(g \circ f) = F(f) \circ) F(g)$$ 

### Full and Faithful

Considering only the mapping on morphisms of a functor $$F: C \rightarrow D$$ :   

*	$$F$$ induces a function $$F_{X,Y} : \text{hom}_C (X, Y) \rightarrow \text{hom}_D(F(X), F(Y))$$ for every pair of objects $$X$$ and $$Y$$ in $$C$$.
*	$$F$$ is *faithful* iff $$F_{X,Y}$$ is injective.
*	$$F$$ is *full* iff $$F_{X,Y}$$ is surjective.
*	$$F$$ is *fully faithful* iff $$F_{X,Y}$$ is bijective.

A category is *concrete* when it is equiped with a faithful functor to **Set** (the category of sets). Concreteness is not a property of categories but rather a construction that can be added to a category. A given category might be concretized by more than one faithful functor. A concrete category is $$(C, U)$$ where $$U$$ is a category and $$U$$ is the faithful functor. This is often a forgetful functor which allows us to think of objects of the source category as being sets with some additional structure.  As an example, it's trivial to construct a faithful functor from **Grp** (the category of groups) to **Set**.  In some contexts, we can select a *base category* $$X$$ other than **Set**

### Other flavors and properties of functors  

*	An *endofunctor* maps from a category to itself.

*	An *identify functor* $$1_C$$ is the endofunctor which maps every object to itself and every morphism to itself.

*	A *constant* or *selector* functor $$f: C \rightarrow D$$ maps every object in C to some fixed $$X$$ in $$D$$, and every morphism in C to a fixed morphism in D.

*	A *forgetful functor* is one that 'forgets' some algebraic property of its source, for example : 
	*	a functor from a category of gadgets (e.g. groups, rings, etc) to a category of sets
	*	a functor from abelian groups to groups which forgets commutativity
	*	a functor from rings to groups which forgets multiplication

*	A *bifunctor* is a functor of two arguments; it maps from some product category onto some other category.
*	A *multifunctor* generalizes the concept of a bifunctor to be a functor of some arbitrary $$n$$ arguments.

### Functors in FP

In Haskell `Functor` is a typeclass defining `fmap`. It is in a sense used to map from one category of things to another, where those categories are types distinguished only by a type parameter.  As an example, given a list of Strings, I may use `fmap` to produce a list of integers which represents the lengths of the strings.

### Named Categories

<table class="table">
  <thead>
    <tr>
      <th scope="col" class="lead">Name</th><th scope="col"> Objects</th><th scope="col">Morphisms</th><th>notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row" class="lead"><b>Set</b></th><td>sets</td><td>functions</td><td>the most commonly used category</td>
    </tr>
    <tr>
      <th scope="row" class="lead"><b>Mon</b></th><td>monoids</td><td>monoid homomorphisms</td><td>every monoid is like a category</td>
    </tr>
    <tr>
      <th scope="row" class="lead"><b>Grp</b></th><td>groups</td><td>group homomorphisms</td><td>complete and co-complete</td>
    </tr>
  </tbody>
</table>


