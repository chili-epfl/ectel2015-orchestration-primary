ISL2014BASELINE - An eyetracking dataset from facilitating secondary geometry lessons
=======================================================

This dataset contains eye-tracking data from a single subject (a researcher), facilitating two geometry lessons in a secondary school classroom, with 11-12 year old students using laptops and a projector. These sessions were recorded in the frame of the [MIOCTI project](http://chili.epfl.ch/miocti).

This dataset has been used in several scientific works, such as the [ECTEL 2015](http://ectel2015.httc.de/) conference paper "Studying Teacher Orchestration Load in Technology-Enhanced Classrooms: A Mixed-method Approach and Case Study", by Luis P. Prieto, Kshitij Sharma, Yun Wen & Pierre Dillenbourg (the analysis and usage of this dataset is available publicly at https://github.com/chili-epfl/ectel2015-orchestration-school)

# Overall structure

Aside from this README.md file, the dataset is composed of three zip archives:

* ISL2014BASELINE-EyetrackingData.zip : Contains the raw datasets from the mobile eyetracker that the teacher was wearing, including eye measures time series, fixation and saccade details (as extracted using SMI's BeGaze 3.4 software).
* ISL2014BASELINE-CodingData.zip : Contains the codes from the manual video coding, by a single researcher, of the 10-second episodes in which the "load index" calculated from eyetracking metrics (see the [ECTEL2015 paper report](https://github.com/chili-epfl/ectel2015-orchestration-school)) had extreme low/high values.
* ISL2014BASELINE-QuestionnaireData.zip : Contains the quantitative and qualitative data from questionnaires: subjective ratings of session workload performed just after the sessions, and "stimulated recall" rating (including semi-transcription and coding of the think-aloud protocol followed) of workload of selected episodes from the sessions. See the method section below for further details.

# Data gathering context and method

The data were gathered in the context of usual technology-enhanced practice in a Swiss International school, in two maths lessons where students used their laptops and Geometer's Sketchpad software to perform exercises on geometry and tessellations, with the teacher orchestrating the lesson (using her own computer and a projector for public display). **Two sessions** of around 80 minutes, with the same teacher and similar activity structures but different cohorts of students were recorded.

The teacher wore a mobile eyetracker (SMI ETG 30Hz), from which eye movement and pupil dilation data were recorded. After each session, the teacher filled in a [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) and another custom questionnaire about the mental workload of the lesson.

Later on, the data from the eye-tracker was exported (using SMI's BeGaze software v3.4), and a "load index" was calculated for each 10-second episode of the three sessions (see the [ECTEL2015 paper report](https://github.com/chili-epfl/ectel2015-orchestration-school) for further details). From this set of 10-second episodes we selected those that had minimum (0) or maximum (4) cognitive load index, and performed a qualitative video coding of them, to assess the main trends/patterns in orchestration properties of high/low load episodes, regarding: the activity or intervention the teacher was performing, the social plane at which the activity was intended and the main focus of the teacher’s gaze during the episode. More details about the context and method used can be found in [Prieto et al. (2014)](http://dl.acm.org/citation.cfm?id=2669543).

From these "extreme load episodes", a subset of 20 episodes was selected (from spans of sustained high- or low-load), and a post-hoc stimulated recall interview was conducted with the teacher. In the interview, the teacher rated these selected episodes in a subjective 1-9 scale for mental effort, using a think-aloud protocol to explain the rationale of her subjective ratings. The audio from this think-aloud protocol was semi-transcribed (only the spans of interesting information were transcribed) and open coded by a single researcher.

_Note : Neither the subjective video feed recorded during the lesson, or the audio file from the think-aloud protocol are provided within this dataset, for anonymity reasons._

# Detailed data structure

Below we describe briefly the format of the data files composing the dataset:

## ISL2014BASELINE-SessionX-eyetracking-eventexport.txt (in ISL2014BASELINE-EyetrackingData.zip)

Comma-separated value file (separator=",", comments="#", with headers). This is the raw eye measures time series as exported using BeGaze software. It has the following fields:

* Time : timestamp of the sample, in microseconds (number)
* Type : protocol used to detect the fixations ( SMP )
* Trial : trial of the eyetracking recording (number, 1)
* L Dia X [px] : left-eye pupil diameter X axis in pixels (number)
* L Dia Y [px] : left-eye pupil diameter Y axis in pixels (number)
* L Pupil Diameter [mm] : left-eye pupil diameter in mm (number)
* R Dia X [px] : right-eye pupil diameter X axis in pixels (number)
* R Dia Y [px] : right-eye pupil diameter Y axis in pixels (number)
* R Pupil Diameter [mm] : right-eye pupil diameter in mm (number)
* B POR X [px] : binocular point-of regard in the X axis, in pixels (number)
* B POR Y [px] : binocular point-of regard in the Y axis, in pixels (number) 
* L POR X [px] : left eye point-of regard in the X axis, in pixels (number)
* L POR Y [px] : left eye point-of regard in the Y axis, in pixels (number)
* R POR X [px] : right eye point-of regard in the X axis, in pixels (number)
* R POR Y [px] : right eye point-of regard in the Y axis, in pixels (number)
* L EPOS X : left pupil position from the perspective of the subjective camera, in the X axis, in pixels (number)
* L EPOS Y : left pupil position from the perspective of the subjective camera, in the Y axis, in pixels (number) 
* L EPOS Z : left pupil position from the perspective of the subjective camera, in the Z axis, in pixels (number)
* R EPOS X : right pupil position from the perspective of the subjective camera, in the X axis, in pixels (number)
* R EPOS Y : right pupil position from the perspective of the subjective camera, in the X axis, in pixels (number)
* R EPOS Z : right pupil position from the perspective of the subjective camera, in the X axis, in pixels (number)
* L GVEC X : left eye gaze vector, from the perspective of the left eye camera, X axis component (number)
* L GVEC Y : left eye gaze vector, from the perspective of the left eye camera, Y axis component (number) 
* L GVEC Z : left eye gaze vector, from the perspective of the left eye camera, Z axis component (number) 
* R GVEC X : right eye gaze vector, from the perspective of the left eye camera, X axis component (number)
* R GVEC Y : right eye gaze vector, from the perspective of the left eye camera, Y axis component (number)
* R GVEC Z : right eye gaze vector, from the perspective of the left eye camera, Z axis component (number)
* Frame : timestamp of the sample, in video feed hh:mm:ss:frame format (hh:mm:ss:frame)
* Aux1 : empty field
* B Event Info: type of event ( - | Saccade | Fixation | Blink )

## ISL2014BASELINE-SessionX-eyetracking-fixationDetails.txt (in ISL2014BASELINE-EyetrackingData.zip)

Comma-separated value file (separator=",", with headers). This is the export of the main fixation statistics, taken from the "Fixation details" section of BeGaze's Event Statistics (each row is a detected fixation). It has the following fields:

* Trial : trial of the eyetracking recording (e.g., "Trial001")
* Subject : identifier of the participant recorded (e.g., "Participant 11-2-unified")
* Color : color coding of the participant (e.g., "Coral")
* Name : Participant name (e.g., "Participant 11")
* Stimulus : video file to be matched with the gaze dat (i.e., the subjective video feed of the eye-tracker; e.g., "participant 11-2-recording.avi")
* Start Time [ms] : starting timestamp of the experiment, in milliseconds (number)
* End Time [ms] : end timestamp of the experiment, in milliseconds (number)
* Fixation Start [ms] : starting time of the fixation, in milliseconds (number)
* Fixation Duration [ms] : duration of the fixation, in milliseconds (number)
* Fixation End [ms] :  end time of the fixation, in milliseconds (number)
* Position X : position of the fixation, on the X axis, in pixels (number)
* Position Y : position of the fixation, on the Y axis, in pixels (number)
* Average Pupil Size [px] X : average pupil size in the X axis during the fixation, in pixels (number)
* Average Pupil Size [px] Y : average pupil size in the Y axis during the fixation, in pixels (number)
* Average Pupil Diameter [mm] : average pupil diameter during the fixation, in mm (number)
* Dispersion X : gaze dispersion during the fixation, on the X axis (number)
* Dispersion Y : gaze dispersion during the fixation, on the Y axis (number)
* Eye : what eye was the fixation captured on (normally, "Binocular")
* Number : fixation number (number, from 1 to the number of fixations in the session)


## ISL2014BASELINE-SessionX-eyetracking-saccadeDetails.txt (in ISL2014BASELINE-EyetrackingData.zip)

Comma-separated value file (separator=",", with headers). This is the export of the main saccade statistics, taken from the "Saccade details" section of BeGaze's Event Statistics (each row is a detected saccade). It has the following fields:


* Trial : trial of the eyetracking recording (e.g., "Trial001")
* Subject : identifier of the participant recorded (e.g., "Participant 11-2-unified")
* Color : color coding of the participant (e.g., "Coral")
* Name : Participant name (e.g., "Participant 11")
* Stimulus : video file to be matched with the gaze dat (i.e., the subjective video feed of the eye-tracker; e.g., "participant 11-2-recording.avi")
* Start Time [ms] : starting timestamp of the experiment, in milliseconds (number)
* End Time [ms] : end timestamp of the experiment, in milliseconds (number)
* Saccade Start [ms] : starting time of the saccade, in milliseconds (number)
* Saccade Duration [ms] : duration of the saccade, in milliseconds (number)
* Saccade End [ms] :  end time of the saccade, in milliseconds (number)
* StartPosition X : starting position of the saccade, on the X axis, in pixels (number)
* StartPosition Y : starting position of the saccade, on the Y axis, in pixels (number)
* EndPosition X : end position of the saccade, on the X axis, in pixels (number)
* EndPosition Y : end position of the saccade, on the Y axis, in pixels (number)
* Amplitude [°] : amplitude of the saccade, in degrees (number)
* Acceleration  Average [°/s²] : average acceleration of the saccade, in degrees per square-second (number) (empty field)
* Acceleration  Peak [°/s²] : maximum acceleration of the saccade, in degrees per square-second (number) (empty field)
* Deceleration  Peak [°/s²] : maximum deceleration of the saccade, in degrees per square-second (number) (empty field)
* Velocity  Average [°/s] : average saccade speed, in degrees per second (number) (empty field)
* Velocity  Peak [°/s] : peak velocity of the saccade, in degrees per second (number) (empty field)
* Peak Velocity at [%] : when in the saccade is the peak velocity located, in % from start to finish (number) (empty field)
* Eye : what eye was the fixation captured on (normally, "Binocular")
* Number : fixation number (number, from 1 to the number of fixations in the session)


## ISL2014BASELINE-videocoding.csv (in ISL2014BASELINE-CodingData.zip)

Comma-separated value file (separator=",", with headers), with the video codes assigned to different 10-second episodes by a single researcher/coder, along three main dimensions (only one code from each dimensions is assigned to an episode):

Orchestration dimension | Teacher activity | Social plane | Main gaze focus
------------------------|------------------|--------------|----------------
Example codes | Explanation/Lecturing (EXP), Monitoring (MON), Task distribution or transition (TDT), Technical or conceptual repairs, i.e., solving student questions (REP), Questioning students (QUE), Disciplinary remarks (DISC) | Individual (IND), Small group (GRP), Class-wide (CLS) | Students’ faces (FAC), Students' laptops (LAP), Student paper worksheets (PAP), Teacher's computer (TCOMP)

The file has the following fields:

* time : timestamp marking the middle-point of the 10-second window of the episode (number)
* Time.min : timestamp, in minutes/seconds, marking the middle-point of the episode (e.g., "2m50s")
* Session : session identifier ( ISL2014BASELINE-Session1-eyetracking | ISL2014BASELINE-Session2-eyetracking )
* Short.description : short qualitative description of what is going on during the episode (character)
* Activity : code along the teacher activity dimension ( EXP | MON | TDT | REP | QUE | DISC )
* Social : code along the social plane of interaction dimension ( IND | CLS | GRP )
* Focus : code along the main focus of gaze dimension ( FAC | LAP | PAP | TCOMP )

## ISL2014BASELINE-stimulatedrecall-snippetselection.csv (in ISL2014BASELINE-CodingData.zip)

Comma-separated value file (separator=",", with headers), with the selection of 10-second episodes to be later rated subjectively by the teacher (by looking at a snippet of the subjective video feed from the lesson's recording), in terms of mental effort. These episodes were manually selected from sustained streaks of high- and low-load (as determined by eyetracking measures). 

The file has the following fields:

* Session : session identifier ( ISL2014BASELINE-Session1-eyetracking | ISL2014BASELINE-Session2-eyetracking )
* Window.Center : Point in time (in milliseconds) at the center of the concerned 10-second episode, taken from the subjective teacher video feed of the lesson (number)
* Load : Cognitive load index of the teacher during the concerned episode (calculated from eyetracking measures) (number, 0 - 4)
* Snippet : sequence number of this episode, which will be part of the snippet video filename (number)

## ISL2014BASELINE-stimulatedrecall-audiocoding.csv (in ISL2014BASELINE-CodingData.zip)

Comma-separated value file (separator=";", with headers), with the semi-transcription of the think-aloud process by the teacher (i.e., transcription of only the relevant parts of the audio that relate to the subjective rating) when assessing subjectively the mental effort taken in a selection of 10-second episodes (by looking at a snippet of the subjective video feed from the lesson's recording). This file also includes the qualitative open coding done by a single researcher, on the basis of such transcription, and the subjective and eye-tracking load for each such episodes. 

The file has the following fields:

* Snippet : sequence number of the snippet (see above) (number)
* Subj.Load: subjective rating of the episode provided by the teacher in terms of mental effort (number, 1-9)
* Interview.Time : Point in time, within the interview audio recording, where the remarks regarding this episode were made (character, XmYYs)
* Semi-transcript : Semi-transcription of the rationale of the subjective mental effort rating (character)
* Codes : Open coding of the semi-transcription of the rationale of the subjective mental effort rating (character, comma-separated)
* Eyetrack.Load : Load index of the episode, as calculated from eye-tracking measures (number, 0 - 4)
* Eyetrack.Time : Point in time (in milliseconds) at the center of the concerned 10-second episode, taken from the subjective teacher video feed of the lesson (number)
* Session : session identifier ( ISL2014BASELINE-Session1-eyetracking | ISL2014BASELINE-Session2-eyetracking )

## ISL2014BASELINE-stimulatedrecall-ratings.csv (in ISL2014BASELINE-QuestionnaireData.zip)

Comma-separated value file (separator=",", with headers), with the subjective rating of mental effort provided by the teacher during the stimulated recall interview, of a selection of 10-second episodes (by looking at a snippet of the subjective video feed from the lesson's recording). 

The file has the following fields:

* Session : session identifier ( ISL2014BASELINE-Session1-eyetracking | ISL2014BASELINE-Session2-eyetracking )
* Snippet : sequence number of the snippet (see above) (number)
* Subjective.Value: subjective rating of the episode provided by the teacher in terms of mental effort (number, 1-9)

## ISL2014BASELINE-sessionratings.csv (in ISL2014BASELINE-QuestionnaireData.zip)

Comma-separated value file (separator=";", with headers), with the session-level subjective ratings for mental effort provided by the teacher just after each session. It includes both the responses to the [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) instrument, as well as an additional custom questionnaire with open and closed questions about the mental effort of the session.

The file has the following fields:

* Session : session identifier ( ISL2014BASELINE-Session1-eyetracking | ISL2014BASELINE-Session2-eyetracking )
* Value.Mental.Demand : value of mental demand workload, as per the [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) questionnaire (number, 0 - 100)
* Value.Physical.Demand : value of physical demand workload, as per the [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) questionnaire (number, 0 - 100)
* Value.Temporal.Demand : value of temporal demand workload, as per the [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) questionnaire (number, 0 - 100)
* Value.Performance : value of performance workload, as per the [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) questionnaire (number, 0 - 100)
* Value.Effort : value of effort workload, as per the [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) questionnaire (number, 0 - 100)
* Value.Frustration : value of frustration workload, as per the [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) questionnaire (number, 0 - 100)
* Importance.Mental.Demand : importance of mental demand workload, as per the [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) questionnaire (number, 0 - 5)
* Importance.Physical.Demand : importance of physical demand workload, as per the [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) questionnaire (number, 0 - 5)
* Importance.Temporal.Demand : importance of temporal demand workload, as per the [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) questionnaire (number, 0 - 5)
* Importance.Performance : importance of performance workload, as per the [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) questionnaire (number, 0 - 5)
* Importance.Effort : importance of effort workload, as per the [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) questionnaire (number, 0 - 5)
* Importance.Frustration : importance of frustration workload, as per the [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) questionnaire (number, 0 - 5)
* TLX.Total : Overall workload score, as per the [NASA TLX](http://humansystems.arc.nasa.gov/groups/tlx/) questionnaire (number, 0 - 100)
* Subj.Mental.Effort : subjective rating of overall mental effort of the session (number, 1 - 9)
* Subj.Difficulty : subjective rating of overall difficulty of the session (number, 1 - 9)
* Especially.Difficult : response to the open question, 'Do you recall any specific episodes during the lesson which you found especially difficult or requiring more effort than the rest? Please describe them and why you found them difficult.' (character)
* Especially.Easy : response to the open question, 'Do you recall any specific episodes during the lesson which you found especially easy or requiring less effort than the rest? Please describe them and why you found them easy' (character)