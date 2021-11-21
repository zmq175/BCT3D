# Objective Aesthetic Assessment for Breast Conservative Treatment (BCT) Using 3D Surface Imaging

## Abstract

Breast Conservative Treatment (BCT) has become the preferred option for early breast cancer treatment as it could preserve most part of breast. However, a considerable number of patients are dissatisfied with the outcome of their surgery. There exists  a mismatch between patients and surgeons on the surgical outcome assessment. Therefore, the objective assessment of BCT aesthetic outcomes plays an important role in solving the disagreement and bridging the  communication gap between patients and physicians. Unfortunately, the assessment of the aesthetic results of conservative breast surgery still relies heavily on subjective assessments, which leads to biased results from different physicians. Objective assessment criteria can be used to standardise surgical planning in order to achieve optimal patient outcome, thereby the success rate of conservative breast surgery and improving patient satisfaction. Picture-based assessment methods are introduced to develop its accuracy and convenience. However, the lack of three-dimensional information greatly affects the accuracy. In addition, the use of three-dimensional data for evaluation greatly improves the accuracy of data measurement such as breast volume, local reduction, symmetry, etc., and makes the evaluation process more intuitive. The project has developed an automated technique to measure the volume, shape and surface area of breasts based on 3D scanning data, and provides a practical objective assessment pipeline for the surgical outcome after BCT using machine learning techniques.

## Introduction

Breast Conservative Treatment, also known as BCT, has become an important treatment for early breast cancer. Cosmetic outcome was identified as an important indicator of surgical evaluation. However, aesthetic evaluation lacks a widely accepted standard. Recent studies have introduced several objective evaluation methods using image information, which highly improved the accuracy and convenience of BCT results evaluation. However, the lack of 3D information limited its accuracy. The project aims to develop an automated technique to measure the volume, shape and surface area of breasts based on 3D scanning data, and provides a more accurate objective assessment method for the surgical outcome after BCT using machine learning techniques.

### Background

Breast cancer is a very common tumor disease among women. The incidence of cancer in women is increasing year by year and there is a trend of rejuvenation. Most breast cancer patients have been shown to be curable at an early stage. 

In the past few decades, the vast majority of breast cancer patients have undergone mastectomy and successfully removed the tumor.However, mastectomy removes the entire breast of a woman, which greatly hurts women's confidence.

Breast Conservative Treatment (BCT) is one of the most important treatment for early breast cancer. Conservative surgery and mastectomy for breast cancer are considered to have the same survival rate, while retaining more breasts and having better aesthetic results.

The aesthetic evaluation classification of BCT depends on the complex interaction of multiple factors and is mainly evaluated subjectively by observers and visual inspection. That is, the aesthetic evaluation is primarily based on the experience of observers. As the evaluation progress is considered to be subjective, the results of aesthetic evaluation is lack of credibility. Researches includes pointed out that this type of evaluation has proven to be non-repeatable.

Objective evaluation techniques have become a way to solve the repeatable issue. By now, some objective methods has been introduced by applying expert systems, soft computing and machine learning.

### Exist Assessment Method

#### Subjective Methods

Harris et al. (1979) firstly introduced the standard evaluation classification of BCT surgery results, that is, excellent (breast after surgery has nearly no
identity to untreated one), fair (only slightly different to untreated breast) and poor. It mainly evaluate breast and retraction, fibrosis and changes in breast skin. This standard has been widely used in clinical practice.

#### Objective Methods

In 1985, Pezner et al. (1985a) pointed out an objective evaluation method
is emerged to be introduced. After that, Pezner et al. (1985b) discussed
the first objective evaluation method for cosmetic results - Breast Retraction
Assessment (BRA). BRA evaluates the postoperative cosmetic effect by comparing the amount of breast contraction between the healthy side and the
affected side of the postoperative patient, and calculates the distance difference between the length of the affected nipple to the clavicle and the length
of the contralateral nipple to the clavicle. It is generally considered that if
BRA < 3.1cm, the cosmetic evaluation is good; 3.1cm ≤ BRA ≤ 6.5cm,
the beauty evaluation is general; and BRA > 6.5cm, the beauty evaluation is poor.Fitzal et al. (2007) invented another objective aesthetic evaluation method which uses single parameter as well. They claimed that their
method would be reproducible and able to separate different type of cosmetic
results easily. They conducted a subjective analysis by comparing the breast
symmetry index from patients, experts and non-experts, to determine the
effectiveness of breast symmetry index prospective randomized trial. Breast
symmetry index (BSI) has been applied as the principal of their method.
That is, BSI laterally describes the size and shape features of a breast (Fitzal
et al., 2007). The method was realised by designed a software called breast
analysing tool (BAT). Experts’ voting of evaluation results was considered as
a disturbances. BSI was proved to be repeatable and can be used by experts
and non-experts with the same results. However, BSI may not provide a
further classification of excellent, good, fair and poor. They also described
the idea that using a 3D version of BSI may improve its performance.

Al-Ghazal et al. (1999) correlated a six-person group’s subjective assessment with the patients’ self-evaluation to get overall assessments. The subjective and objective combination evaluation methods include both subjective
evaluation indicators and objective evaluation indicators. His study also considered the objective measurement of breast retraction and nipple deviation,
which was also covered in Noguchi et al. (1991). In the year of 1991, Noguchi
et al. (1991) applied Moire topography camera to measure the breasts’ subjective asymmetry. However, breast atrophy, skin change, and surgical scar
were still objectively evaluated by observers. The final score of evaluation
is a sum of objective and subjective assessments. This study has provided
the general idea of overall objective evaluation (Cardoso and Cardoso, 2007).
Among them, breast atrophy, skin changes and scars are based on subjective
”invisible, slightly visible, obviously visible” scores, while in actual evaluation
it is difficult to clearly distinguish between ”slightly visible” and ”obviously
visible”.

Cardoso et al. (2005b) proposed a semi-objective method to classify the
aesthetic effects of conservative breast cancer treatment. Breast Retraction Assessment (BRA), Lower Breast Contour (LBC), and Upward Nipple
Retraction (UNR) measures have been used. Their study convinced an algorithm with an acceptable low error rate can be constructed. They also
suggested the SVM ordinal model obtained the best error rate and generalisation ability. However, their method showed its drawback when facing
with skin colour changes. Inspired by Cardoso et al. (2005b), Cardoso et al.
(2005a) then compared several different SVM algorithms.
Cardoso and Cardoso (2007) introduced a new method for assisting aesthetic evaluation of BCT surgery, quantified based on optimisation of an
objective score. His evaluation method combines medical expert systems,
soft computing and machine learning. This method provided four standard
categories (which is excellent, good, fair and poor). Firstly, the method
obtained a concise representation of the BCT image based on its asymmetry, color, and scar visibility features. Then applying a pattern classifier to
perform the classification. The correct classification rate of about 70% was
obtained for a collection of unlabelled images, which was comparable to that
obtained by the best panelists in 113 patients (Cardoso and Cardoso, 2007).
They developed a software named Breast Cancer Conservative Treatment.
Cosmetic results (BCCT.core) to evaluate aesthetic cosmetic outcome from
both given measurements and other paraments from patients’ photograph.
Considering 3D information may increases the accuracy of assessment,
Cardoso et al. (2018) applied additional 3D information with the traditional
2D image evaluation methods using BCCT.core. They suggested the additional 3D information did not make a significant improvement in the quality
aspects. That is, they only considered the influence of the volume information in the three-dimensional data on the evaluation results, but did not
compare influences of local reduction and symmetry features on the evaluation results in the three-dimensional data. A significant different conclusion
may be drawn if multiple features have been discussed.

### Aim

Considering the lack of 3D information would significantly affect the accuracy and performance of automatic objective assessment of BCT surgery, this
study aims to propose an automated technique to objectively measure the
volume, shape and surface area of breasts from 3D laser scanning data, and
develop a tool to provide an objective score (classification) for the quantification of the aesthetic results after BCT by using machine learning techniques.

### Summary

In Introduction section, the background, exist assessment methods and aim
have been brief introduced. Alter that, the method of data collection has been
detailed in Data Collection section. Volume reconstruction, two-dimensional
features extraction methods, indexes extraction methods, and machine learning methods are described in detail in the Methods section. Finally, this
dissertation presents and discusses the results obtained in this study, and
proposes further research directions.

##  Data Collection

### 3D Laser Scanning Data

The study included a total of 107 patients, including 55 preoperative patient
data and 52 postoperative patient data, 17 of the patients received both
preoperative and postoperative data.The patient’s age ranged from 20 to 67
years, with an average age of 45.58 years and a median of 45 years; the body
weight ranged from 43 to 82 Kg; and the height range ranged from 153 to
170 cm.

This study used the Creaform Go! SCAN50 3D shape hand-hold laser
scanner and VXelements 4.0 software to capture 3D laser scan data. VXelements software is an integrated 3D data acquisition platform that supports
the entire 3D scanning and measurement technology. Patients were in a
straight position, breathing calmly, keeping their hands on their hips to fully
reveal the sides of the breasts, keeping their shoulders relaxed and at the
same level, with their hands on their hips and thumbs in the back.
First step: connect the 3D laser scanner with the computer. Then open
the VXelements software to set the scanning settings. The settings for this
study has been set as: shutter 2.0ms, standard scan resolution 2.0mm, texture detail resolution 150 DPI.
Second step: Marking points are markers whose surface is covered with
a special reflective material.In the field of motion information acquisition
(such as 3D motion capture, 3D gait analysis, etc.), a marker point is usually
pasted on the capture object, the marker point can reflect the light emitted
by the scanner, reflected data is received by the instrument, and then the
system receives the signal.In this way, the acquisition of object or human
body information can be achieved. Four marking points have been put on
patients’ breast: The point on the sternum is A. The point B is 25 cm from
the front mid-line. Point C and point D are located at the farthest point
of the outer contour of the breast. Marking points in other area can be
increased according to actual conditions.

Third step: Press and hold the trigger to complete the collection of 3D
data of the chest. The scanning time is about 2 to 5 minutes.In order to
ensure that some of the nipples and reductions of armpits are not lost, the
scanning process must be supplemented and repeated scanning several times
in different directions. Scanning is stopped after checking that the scanning
file is complete.

Fourth step: After scanning the breast, original data is required to be
edited. That is, use the Edit menu to remove extra meshes, remove isolated
patches, auto-fill holes, and ensure that the required chest area data is complete and eventually exported as an .obj file for easy viewing and further
processing.

###  Experts’ Assessment Results

In this study, the difference in volume between breasts, the difference in shape
of breasts, the difference in horizontal distance between low breasts, the local
reduction of the breast, the horizontal distance of the nipple (the difference
in the height of the bilateral nipples), the loss of the nipple, the area of skin
pigmentation, and the area of the scar were evaluation indicators.
According to Vrieling et al. (1999), different people would have different
evaluations of cosmetic outcome results BCT. At present, the evaluation results in scientific research are often based on the evaluation of expert groups.
The differences between the expert groups are small, the correlation is high,
and the stability in evaluation is high (Cardoso et al., 2007). This study
is based on the subjective evaluation results of the expert group with high
stability in evaluation.
The study invited seven top-level hospital breast specialists or orthopaedic
surgeons to independently perform an aesthetic evaluation of 107 patients according to Harris standard (Harris et al., 1979). The 107 patients included 55
preoperative patients and 52 postoperative patients. The basic information
of the 7 experts is as follows. The expert group consists of 2 chief physicians,
2 deputy chief physicians, and 3 attending physicians. The years of breast
professionalism range from 5 to 32 years, with an average of 13.63 years and
a median of 11.5 years. There are 4 male experts and 3 female experts.
There are 4 postgraduate degrees and the rest are undergraduate degrees. In
this study, the same evaluation results achieved by at least 4 experts constitute the final unified evaluation results. If the unified results cannot be
determined according to this standard, seven experts are invited again to
re-evaluate or add one expert. Because the experts will give more accurate
subjective results after more comprehensive observation of the breast in the
2D combined 3D viewing mode, this study will use the subjective evaluation
results obtained from the 2D combined 3D observation mode as the final
unified aesthetic evaluation standard. Table 1 demonstrates uniform subjective evaluation results distribution of study subjects under different viewing
modes.

| Result    | All Patients | Preoperative Patients | Postoperative Patients |
|-----------|--------------|-----------------------|------------------------|
| Excellent | 38           | 30                    | 8                      |
| Good      | 47           | 24                    | 23                     |
| Fair      | 16           | 1                     | 15                     |
| Poor      | 6            | 0                     | 5                      |
| Total     | 107          | 55                    | 52                     |

## More

Due to GitHub limitations, LaTeX formulas would not be displayed properly in this Markdown file, please check <https://drive.google.com/file/d/1Zz5_zf_C2eOxaAZG3JWb1EnTJmFkMYWv/view?usp=sharing>