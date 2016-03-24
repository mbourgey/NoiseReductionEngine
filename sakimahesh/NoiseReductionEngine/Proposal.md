Project Info
---------------
*Project title:*  Develop a noise reduction engine for SCoNEs
*Project short title:*  Noise Reduction Engine
*URL of Project Idea Page: *
https://bitbucket.org/mugqic/gsoc2016#markdown-header-develop-a-noise-reduction-engine-for-scones

 Biographical Information
-----------------------------------
I am Saket Maheshwary, 2nd year MS by Research CSE student at IIIT,Hyderabad. I am pursuing my Masters specializing in Data Mining and Machine Learning with the aim of pursuing my career as a Data Scientist. I am pursuing my Research in the area of Machine Learning and Data Mining under the guidance of Dr. Vikram Pudi. I have done more than 5 projects involving Data Mining, Machine learning and Statistics. I am working as a Research Assistant on a project http://metabolomics.iiit.ac.in/ where i have written R and Python scripts for statistical analysis and visualization of metabolomics data.
I have written more than 15K lines of code in Python and more than 5K lines of code in R and is well versed with their inbuilt libraries used for Machine Learning. I find "Develop a noise reduction engine for SCoNEs" project idea to be interesting and quite aligned with my research areas.
**Publications**
**User Authentication via Keystroke Timing Pattern** (under review)
*Principles and Practice of Knowledge Discovery (PKDD), Italy 2016*
**Mining Deceptive Reviewers on Web Forums** (under review) 
*European Conference on Artificial Intelligence (ECAI), Holland 2016*

Contact Information
---------------------------
*Student name:* Saket Maheshwary
*Melange Link_id:*
*Student postal address:* 71 Green Avenue, Amritsar, Punjab,India (143001)
*Telephone(s):* +91 8978889210, +91 9779399846
*Email(s):* saketm.1991@gmail.com, saket_1991@yahoo.in
*Other communications channels:* Skype (user id: sakimahesh)

Student Affiliation
-------------------------
*Institution:* International Institute of Information Technology, Hyderabad
*Program:* MS by Research in CSE
*Stage of completion:* Second Year
*Contact to verify:* Irshad Bhat (bhatirshad127@gmail.com)

Schedule Conflicts
-------------------------
There are no commitments from my side regarding other work during summers apart from GSoC. I assure that there would be no clash of exams or other university obligations during the GSoC ‘16 period.

Mentors
-----------
*Mentor names:* Mathieu Bourgey and Toby Hocking
*Mentor emails:* mathieu.bourgey@computationalgenomics.ca and toby.hocking@mail.mcgill.ca
*Mentor link_ids:*

I have exchanged multiple emails with my mentors where besides discussing my approach on selection test we also discussed the possible optimizations that can be incorporated, nature of dataset i will be working on during GSoC, discussed on manually labeling some corpus of data set and then generating the label for rest of the unlabeled data using the manually labeled data.

Synopsis 
------------
SCoNEs is a development tools in R language which aims to call Copy Number Variation in paired cancer data using a Read Depth (RD) approach. The specificity of SCoNEs is to incorporate the individual (biological) variations of the RD signal in order to adjust the set of parameter used by the calling algorithm. This approach can suffers from the presence of a technical noise in the signal that could in a certain case lead to overfitting of the RD signal. In this application i propose two machine learning models Consensus Clustering and Semi Supervised Ensemble respectively that would prevent overfitting, detect and remove noisy data in an efficient manner.

Benefits to Community 
------------------------------
My work will involve techniques of Machine Learning and Data Mining in order to remove the presences of technical noise from Cancer Data. Hence with reduced noise the biologists working on cancer data will be able to make predictions with improved accuracy which may lead to some new insights in the domain dealing with Cancer Data. So i can say that these insights may lead to new discoveries hence affecting the lives of many people. I will produced reusable and scalable code that may help other open source organizations and researchers working in different domains to enhance their prediction and analysis.
A detailed report with both raw data and graphical visualizations will be made at the end that will show what improvements are made before and after the techniques are implemented as a part of developing a noise reduction engine for SCoNEs.

Coding Plan & Methods
--------------------------------
Model A:  Consensus Clustering (Ensemble for Unsupervised Learning)
-------------------------------------------------------------
Consensus clustering, also called aggregation of clustering (partitioning), refers to the situation in which a number of different (input) clusterings have been obtained for a particular dataset and it is desired to find a single (consensus) clustering which is a better fit than the existing clusterings. It formalizes the idea that combining different clusterings into a single representative, or consensus, would emphasize the common organization in the different data sets and reveal the significant differences between them. Consensus clustering is thus the problem of reconciling clustering information about the same data set coming from different sources or from different runs of the same algorithm. It has been shown that consensus clustering is able to claim apparent stability than what is achieved by individual clusters.
**Concerns in individual algorithms**
(i) How to determine the number of clusters (number of Gaussians)
(ii) How to assign confidence to the selected number of clusters, as well as to the induced cluster assignments. This issue is particularly important in gene expression data analysis, where the problem of a relatively small sample size is compounded by the very high dimensionality of the data available, making the clustering results especially sensitive to outliers and susceptible to overfitting 
(iii) Sensitivity to Noise and Outliers
Keeping in mind the above mentioned concerns i have chosen such algorithms which is resilient for at least two of the above concerns such that resilient to noise and outliers is shown by all the three algorithms. All these algorithms compliments each other's strengths and tackle the weakness of either of any.
Thus to get the optimal results for consensus i will be using 
**DBSCAN, BIRCH** and **Manifold Learning**

**Why use consensus clustering ?**

 - It overcomes limitations of a single hypothesis
 - It yields a stable and robust final clustering(number of gaussians) that is in agreement with multiple clusterings.
 - It improves generalization performance leading to optimized results
 
 
 ![Consensus Clustering](https://github.com/sakimahesh/NoiseReductionEngine/blob/master/Screenshot%20from%202016-03-22%2006:32:10.png?raw=true)

            Figure1: Demonstrates Consensus Clustering
            
**DBSCAN**
DBSCAN is a density based clustering algorithm[1] where given a set of points in some space, it groups together points that are closely packed together (points with many nearby neighbors) thus marking as outliers points that lie alone in low-density regions (points whose nearest neighbors are too far away).
Visualization of DBSCAN for different distributions of data:  

The algorithm has three parameters:
**ɛ(eps):** The radius of our neighborhoods around a data point (p or q). It is fundamental to DBSCAN to approximate local density.
**minPts:** The minimum number of data points we want in a neighborhood to define a cluster.
**Distance Function:** Euclidean distance metric is set by default but it can be customized for different datasets to get best possible results.

Using these three parameters, DBSCAN categories the data points into three categories:
**Core Points:** A data point p is a core point if Nbhd(p,ɛ) [ɛ-neighborhood of p] contains at least minPts ; |Nbhd(p,ɛ)| >= minPts.
**Border Points:** A data point q is a border point if Nbhd(q, ɛ) contains less than minPts data points, but q is reachable from some core point p.
**Outlier:** A data point o is an outlier if it is neither a core point nor a border point.

**Why Use DBSCAN ?**

 - DBSCAN does not require one to specify the number of clusters in the data a priori, as opposed to k-means. Rather it infers the number of clusters based on the data, and it can discover clusters of arbitrary shape.
 - DBSCAN has a notion of noise, and is robust to outliers
 - DBSCAN is a flexible algorithm, in the sense that it is dynamic with respect to the data. DBSCAN can find arbitrarily shaped clusters.
 - The parameters needed to run the algorithm can be obtained from the data itself, using k-distance graph.
 -  It gives a more intuitive clustering, since it is density based and leaves out points that belong nowhere
 
**Scenarios where DBSCAN might not give optimal results**
The border points that are reachable from more than one cluster can be part of either cluster, depending on the order the data is processed hence there can be some data points that are labelled as noisy but actually belongs to a valid cluster and vice versa.
Dataset is of High Dimensionality

**Optimization step to deal with above scenarios**
Consensus Clustering would handle these DBSCAN concerns very well since BIRCH and Manifold Learning both are resilient to noisy data hence the final consensus cluster formed will prevent unwanted clustering of noisy points to non noisy ones. Manifold Learning works the best with higher dimensional data hence during consensus this drawback is also resolved.

**Balanced Iterative Reducing and Clustering using Hierarchies (BIRCH)**
It is an unsupervised algorithm used to perform hierarchical clustering over particularly large data-sets. Every new sample is inserted into the root of the Clustering Feature(CF) Tree. It is then clubbed together with the subcluster that has the centroid closest to the new sample. This is done recursively till it ends up at the subcluster of the leaf of the tree has the closest centroid. BIRCH Algorithm finds better accuracy results for finding noise than the other clustering algorithms for very large datasets.
CF tree has two parameters
**Branching Factor:** max number of children
**Threshold:** max diameter of sub-clusters stored at the leaf nodes
BIRCH consists of four phases  (1)  Loading,  (2) Optional  Condensing,  (3)  Global Clustering  and  (4)  Optional  Refining. 

**Why Use BIRCH ?**

 - CF-tree  tries  to  reflect  the  clustering information  of  the  dataset  in  as  much  detail  as  possible subject  to  the  memory  limits. With  crowded  data  points grouped into sub clusters, and sparse data points removed as outliers or noise, this  phase  creates  an  in-memory  summary  of  the data.
 - Resilient to noise and outliers
 -  It exploits the observation that data space is not usually uniformly occupied and not every data point is equally important. It makes full use of available memory to derive the finest possible sub-clusters while minimizing I/O costs. It is also an incremental method that does not require the whole data set in advance.

**Scenario where BIRCH might not give optimal results**
BIRCH algorithm lacks in producing optimal results  when we have high dimensional data thus becoming sensitive to outliers. 

**Optimization Step**
In order to deal with it Manifold Learning will be helpful thus in Consensus clustering the final cluster will be able to deal with high dimensional data. 

**Manifold Learning**
It is an unsupervised learning approach for dimensionality reduction. High-dimensional datasets can be very difficult to visualize. While data in two or three dimensions can be plotted to show the inherent structure of the data, equivalent high-dimensional plots are much less intuitive. To aid visualization of the structure of a dataset, the dimension must be reduced in some way. Isomap [9] and Locally Linear Embedding (LLE) [9] algorithms are used for Manifold Learning.
The simplest way to accomplish this dimensionality reduction is by taking a random projection of the data. Though this allows some degree of visualization of the data structure, the randomness of the choice leaves much to be desired. In a random projection, it is likely that the more interesting structure within the data will be lost.
Manifold Learning can be thought of as an attempt to generalize linear frameworks like PCA to be sensitive to nonlinear structure in data. Though supervised variants exist, the typical manifold learning problem is unsupervised: it learns the high-dimensional structure of the data from the data itself, without the use of predetermined classifications.

DBSCAN and BIRCH lacks in giving optimized results for noise detection when it comes to data set with high dimensionality. Hence this when Manifold learning will come in handy in consensus clustering. Manifold Learning is an effective outlier detection algorithm for high-dimensional data.The algorithm is also applicable to both linear and nonlinear models of data.

**Evaluation Criteria** 
An extremely important issue in cluster analysis is the validation of the clustering results, that is, how to gain confidence about the significance of the clusters provided by the clustering technique (cluster numbers and cluster assignments). Lacking an external objective criterion (the equivalent of a known class label in supervised analysis), this validation becomes somewhat elusive.
Recently, a number of studies have attempted to compare and validate cluster method consistency. Cluster validation can be split into two main procedures: internal validation, involving the use of information contained within the given dataset to assess the validity of the clusters; or external validation, based on assessing cluster results relative to another data source, for example, gene function annotation. Internal validation methods include comparing a number of clustering algorithms based upon a figure of merit (FOM) metric, which rates the predictive power of a clustering arrangement using a leave-one-out technique [4]. This and other metrics for assessing agreement between two data partitions [5, 6] readily show the different levels of cluster method disagreement. 
In addition, when the FOM metric was used with an external cluster validity measure, similar inconsistencies are observed [7]. In addition to evaluate a clustering based on how well it combines multiple clusterings in the ensemble, there are also two additional clustering criteria to measure how well a clustering partitions the data into its natural groupings. As suggested by Nam Nguyen Rich Caruana [8]  to evaluate the clusters i will be using Compactness and Accuracy as formulated below.

![enter image description here](https://github.com/sakimahesh/NoiseReductionEngine/blob/master/Screenshot%20from%202016-03-23%2003:09:50.png?raw=true)

Model B: Semi-Supervised Ensemble Learning
--------------------------------------------------------------

Ensemble learning has been widely used in machine learning, data mining and pattern recognition. However, when the number of labeled data samples is very small (we can generate small labelled dataset manually), it is difficult to train a base classifier for ensemble learning, therefore, it is necessary to utilize an abundance of unlabeled data effectively.  However, the low accuracy of the label prediction of unlabeled data limits the ability to obtain improved ensemble members. Below i explain an effective ensemble learning methods for semi-supervised classification that combine label propagation and ensemble learning. It shows that accurate ensemble members can be constructed using class labels predicted by a label propagation method, and unlabeled data samples are fully utilized for diverse ensemble member construction.

The approach is divided into following two steps 

**Step 1 : Label Propagation**
It assumes that each data point can be linearly constructed from its neighborhood. It can propagate the labels from the labeled points to the whole dataset using linear neighborhoods with sufficient smoothness. Thus as shown in figure 2 in step 1 the labeled data and unlabeled data are passed through label propagation algorithm and gives us a labeled dataset.

![enter image description here](https://github.com/sakimahesh/NoiseReductionEngine/blob/master/Unsupervised.png?raw=true)
                                 
          Figure 2: Label Propagation (Step 1)

**Step 2: Ensemble Learning**
Ensembling is a general term for combining many classifiers by averaging or voting. It is a form of meta learning which focuses on how to merge results of arbitrary underlying classifiers. Generally, ensembles of classifiers perform better than single classifiers, and the averaging process allows for more granularity of choice in the bias-variance tradeoff.
Names of ensemble techniques include bagging, boosting, model averaging, and weak learner theory. I will be experimenting during the Community Bonding period as to which technique works the best.The step 2 is demonstrated in figure 3 shown below. 

![enter image description here](https://github.com/sakimahesh/NoiseReductionEngine/blob/master/Screenshot%20from%202016-03-23%2004:49:11.png?raw=true)
                                       
    Figure 3:Ensemble Learning on Labeled data (Step-2)

**Choice of Classifiers**
An obvious strategy is thus to implement as many different classifiers as possible and ensemble them all together, a sort of "More Models are Better" approach. However, reports suggest that this is not always the case. Sometimes adding more solvers results in no improvement at all, and can even make things worse. Thus choosing the best combination of classifiers will require experimentation and i will be performing during the community bonding period.Though some of the classifiers i am planning to experiment with are *k-nearest neighbor, Naive Bayes, Perceptron, SVM, Decision Trees are Neural Networks.*

**Evaluation Criteria**
After either of bagging, boosting, model averaging, and weak learner theory, we will get the predicted label. In order to evaluate the model it  will be divided into training, testing and validation (80/10/10 rule) and k-fold cross validation will be performed in order to prevent overfitting. There are many metrics that can be used to measure the performance of a classifier or predictor different fields have different preferences for specific metrics due to different goals. I will be measuring the performance in terms of precision, recall and f1-score. Confusion Matrix and ROC curve are other popular techniques to assess the performance that could be used.

Timeline
------------
**Expected Deliverables**
Consensus Clustering (Model A): **26 June**
Semi supervised Learning (Model B): **31 July**

**Community Bonding Period** 
Within this period i will keep myself in constant touch with my mentors. This will involve discussing some aspects regarding the project, optimization techniques etc. so as to get a better hold over the project as well as strengthen acquaintance  among myself and the mentors. During this period the pros and cons of the both the proposed models will also be discussed. The timeline below is designed such that that implementation of both the models can take place.

[Phases written below marked with asterisk(*) are part of the deliverables]
Week Phase      |            TASK
----------------|--------------------------------------
23 May - 30 May |Model A: Implementation using Algorithm 1 (DBSCAN), evaluating/testing its behavior on the dataset and parameter tuning to get best set of parameters
31 May - 5 June  | Model A: Implementation using Algorithm 1 (BIRCH), evaluating/testing its behavior on the dataset and parameter tuning to get best set of parameters 
6 June - 12 June |Model A: Implementation using Algorithm 1 (Manifold Learning), evaluating/testing its behavior on the dataset and parameter tuning to get best set of parameters 
13 June - 19 June |Combining all the 3 algorithms thus achieving Consensus Clustering(Model A), parameter tuning to get best set of parameters
20 June - 26 June * |Evaluating/Testing Model A based on the evaluation criteria discussed for this model. Thus by this time Model A should be implemented with majority of testing being done
21 June - 28 June |Mid Term Evaluation 
27 June - 3 July |Model B: Implementation using Label Propagation, parameter tuning 
4 July - 10 July |Model B: Implementation using the best set of classifiers (as decided during community bonding)
11 July - 17 July |Module B evaluation and testing, evaluating and analyzing how each classifier behaves independently and in combination and what is the effect on accuracy/precision
18 July - 24 July |Comparing performance of Model A and Model B
25 July - 31 July * |Buffer Week for required optimization and improvements in Model A and Model B
1 August - 15 August |Refactor: Improve Code quality, Documentation and Modularizing
16-24 August |Submission for Final Evaluation
30 August |  Results Announced

It will be observed that all the code is written concerning modularity, naming convention and other coding standards. Also, code will be produced with consideration of reusability and scalability since the solution on successful completion will prove useful for other research works as well.

*What is your contingency plan for things not going to schedule?*
I will try to keep a sufficient time period between the mid term evaluation and final evaluation such that if any unforeseen situation comes into picture i am able to handle it. Besides this i will make use of Community bonding period in order discuss with my mentor about such scenarios and will keep myself flexible enough to deal with such scenarios.

Management of Coding Project
------------------------------------------
How do you propose to ensure code is submitted / tested?
Regarding track of implementation of project, i am planning to use bitbucket which would consist of weekly progress, updates regarding implementation, feature requests, bug reports and other project management tasks. Also i am open to any other alternatives from the mentor.

*How often do you plan to commit? What changes in commit behavior would indicate a problem?*
I am planning to commit weekly. Multiple editings on the already pushed commits or no commit in more than two weeks may be a sign of problem.I will try communicating with the mentor twice a week to make sure that i am progressing in the right direction. Preferred mode of communication is via Skype or Google Hangouts apart from Mailing List and emails. Having said that i believe providing support for a module is as important as developing it. I will be in touch with the community and the mentors post GSoC period too. Suggestions, feedbacks, bug reporting would be most welcome and would be accounted for necessary changes by me.

Test
------
I used DBSCAN in order to build a basic function in R language for noise detection engine as a part of selection test.

Details about approach used: 
https://docs.google.com/document/d/1Xqv_UuDJZcHPEKF6OC8bM3iQDE-IjfEeLGCrqEQMHG4/edit

Link to selection test solution: 
https://github.com/sakimahesh/NoiseReductionEngine
The above link contains the source code, data plots, output file and brief description about the results achieved.

References
---------------
[1] Martin Ester, Hans-Peter Kriegel, Joerg Sander, Xiaowei Xu (1996). A Density-Based Algorithm for Discovering Clusters in Large Spatial Databases with Noise. Institute for Computer Science, University of Munich. Proceedings of 2nd International Conference on Knowledge Discovery and Data Mining (KDD-96).

[2] Campello, R. J. G. B.; Moulavi, D.; Sander, J. (2013). Density-Based Clustering Based on Hierarchical Density Estimates. Proceedings of the 17th Pacific-Asia Conference on Knowledge Discovery in Databases, PAKDD 2013, Lecture Notes in Computer Science 7819, p. 160.

[3] Zhang, T.; Ramakrishnan, R.; Livny, M. (1996). "BIRCH: an efficient data clustering method for very large databases". Proceedings of the 1996 ACM SIGMOD international conference on Management of data - SIGMOD '96. pp. 103––114.

[4] Yeung KY, Haynor DR, Ruzzo WL: Validating clustering for gene expression data. Bioinformatics 2001, 17:309–318.

[5] Datta S: Comparisons and validation of statistical clustering techniques for microarray gene expression data. Bioinformatics 2003, 19:459–466.

[6] Yeung KY, Medvedovic M, Bumgarner RE: Clustering gene-expression data with repeated measurements. Genome Biol 2003, 4:R34.

[7] Gibbons FD, Roth FP: Judging the quality of gene expression-based clustering methods using gene annotation. Genome Res 2002, 12:1574–1581.

[8] Nam Nguyen Rich Caruana ICDM '07 Proceedings of the 2007 Seventh IEEE International Conference on Data Mining Pages 607-612 IEEE Computer Society Washington, DC, USA.  

[9] Bengio, Yoshua et al. “Out-of-Sample Extensions for LLE, Isomap, MDS, Eigenmaps, and Spectral Clustering.” NIPS (2003).














