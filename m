Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38E7C27C4F
	for <intel-xe@archiver.kernel.org>; Sat, 15 Jun 2024 19:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5550710E0E4;
	Sat, 15 Jun 2024 19:40:18 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E2810E0F9;
 Sat, 15 Jun 2024 19:40:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1714700559781662290=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Apply_Wa=5F22019338487?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 15 Jun 2024 19:40:13 -0000
Message-ID: <171848041355.95883.4583245311457161151@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614224032.2965600-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240614224032.2965600-1-vinay.belgaumkar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============1714700559781662290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Apply Wa_22019338487
URL   : https://patchwork.freedesktop.org/series/134921/
State : failure

== Summary ==

CI Bug Log - changes from xe-1475-e60c2c92798375b80da09295f5d3cc7db476a9c5_full -> xe-pw-134921v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-134921v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-134921v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134921v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-adlp:         NOTRUN -> ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-2/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-2/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-4/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-2/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-8/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-9/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-1/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-9/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-4/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-9/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-1/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-9/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-1/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-1/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-8/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-2/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-8/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-9/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-8/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-8/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-4/igt@runner@aborted.html
    - shard-dg2-set2:     NOTRUN -> ([FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25], [FAIL][26], [FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35], [FAIL][36], [FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-433/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-464/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-466/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-434/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-434/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-433/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-466/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-464/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-464/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-434/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-464/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-434/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-466/igt@runner@aborted.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-434/igt@runner@aborted.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-464/igt@runner@aborted.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-464/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-466/igt@runner@aborted.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-433/igt@runner@aborted.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-433/igt@runner@aborted.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-466/igt@runner@aborted.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-433/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in xe-pw-134921v1_full that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - {shard-lnl}:        [DMESG-WARN][43] ([Intel XE#877]) -> [PASS][44] +1 other test pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1475-e60c2c92798375b80da09295f5d3cc7db476a9c5/shard-lnl-2/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-lnl-2/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-1475-e60c2c92798375b80da09295f5d3cc7db476a9c5 -> xe-pw-134921v1

  IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1475-e60c2c92798375b80da09295f5d3cc7db476a9c5: e60c2c92798375b80da09295f5d3cc7db476a9c5
  xe-pw-134921v1: 134921v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/index.html

--===============1714700559781662290==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Apply Wa_22019338487</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/134921/">https://patchwork.freedesktop.org/series/134921/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-134921v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-134921v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1475-e60c2c92798375b80da09295f5d3cc7db=
476a9c5_full -&gt; xe-pw-134921v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-134921v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-134921v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1349=
21v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-134921v1/shard-adlp-2/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/sha=
rd-adlp-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-4/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13492=
1v1/shard-adlp-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-8/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-134921v1/shard-adlp-9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-1/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-134921v1/shard-adlp-9/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-4/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-134921v1/shard-adlp-9/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-a=
dlp-1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-9/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/=
shard-adlp-1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-1/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
4921v1/shard-adlp-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-2/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-134921v1/shard-adlp-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-9/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-134921v1/shard-adlp-8/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-adlp-8/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-134921v1/shard-adlp-4/igt@runner@aborted.html">FAIL</a>)=
</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-134921v1/shard-dg2-433/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/sh=
ard-dg2-464/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-466/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
4921v1/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-434/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-134921v1/shard-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-466/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-134921v1/shard-dg2-464/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg=
2-464/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-434/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1=
/shard-dg2-464/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-434/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-134921v1/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-434/igt@runne=
r@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-134921v1/shard-dg2-464/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-464/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-134921v1/shard-dg2-466/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard=
-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-433/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13492=
1v1/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-dg2-433/igt@runner@abor=
ted.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134921v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@torture-bo@pipe-a:<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1475-e60c2c92798375b80da09295f5d3cc7db476a9c5/shard-lnl-2/igt@kms_curs=
or_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134921v1/shard-lnl-2/ig=
t@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1475-e60c2c92798375b80da09295f5d3cc7db476a9c5 -&gt; xe-pw-134=
921v1</li>
</ul>
<p>IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-1475-e60c2c92798375b80da09295f5d3cc7db476a9c5: e60c2c92798375b80da0929=
5f5d3cc7db476a9c5<br />
  xe-pw-134921v1: 134921v1</p>

</body>
</html>

--===============1714700559781662290==--
