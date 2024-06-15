Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C004DC27C4F
	for <intel-xe@archiver.kernel.org>; Sat, 15 Jun 2024 07:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D4A10E2CA;
	Sat, 15 Jun 2024 07:25:15 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C0810E2DE;
 Sat, 15 Jun 2024 07:25:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3126734279581878151=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Fix_missing_runtime_o?=
 =?utf-8?q?uter_protection_for_ggtt=5Fremove=5Fnode_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 15 Jun 2024 07:25:12 -0000
Message-ID: <171843631206.95883.9365875853797165770@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614183758.77736-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240614183758.77736-1-rodrigo.vivi@intel.com>
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

--===============3126734279581878151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix missing runtime outer protection for ggtt_remove_node (rev7)
URL   : https://patchwork.freedesktop.org/series/134308/
State : failure

== Summary ==

CI Bug Log - changes from xe-1472-5c623c9712af3170cc9782a10ed7360ddf8f8bb4_full -> xe-pw-134308v7_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-134308v7_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-134308v7_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134308v7_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-adlp:         NOTRUN -> ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-9/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-4/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-8/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-9/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-8/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-9/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-2/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-1/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-8/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-4/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-8/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-2/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-1/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-8/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-2/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-1/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-6/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-2/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-4/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-6/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-1/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-6/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-4/igt@runner@aborted.html
    - shard-dg2-set2:     NOTRUN -> ([FAIL][24], [FAIL][25], [FAIL][26], [FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35], [FAIL][36], [FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42], [FAIL][43], [FAIL][44], [FAIL][45], [FAIL][46], [FAIL][47])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-433/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-435/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-435/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-433/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-433/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-435/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-433/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-463/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-466/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-464/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-464/igt@runner@aborted.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-466/igt@runner@aborted.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-463/igt@runner@aborted.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-464/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-466/igt@runner@aborted.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-463/igt@runner@aborted.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-434/igt@runner@aborted.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-434/igt@runner@aborted.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-466/igt@runner@aborted.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-434/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-463/igt@runner@aborted.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-434/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-434/igt@runner@aborted.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-466/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@runner@aborted:
    - {shard-lnl}:        NOTRUN -> ([FAIL][48], [FAIL][49], [FAIL][50], [FAIL][51], [FAIL][52], [FAIL][53], [FAIL][54], [FAIL][55], [FAIL][56], [FAIL][57], [FAIL][58], [FAIL][59], [FAIL][60], [FAIL][61], [FAIL][62], [FAIL][63], [FAIL][64], [FAIL][65], [FAIL][66], [FAIL][67])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-3/igt@runner@aborted.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-2/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-4/igt@runner@aborted.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-4/igt@runner@aborted.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-4/igt@runner@aborted.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-8/igt@runner@aborted.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-6/igt@runner@aborted.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-6/igt@runner@aborted.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-7/igt@runner@aborted.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-6/igt@runner@aborted.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-1/igt@runner@aborted.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-3/igt@runner@aborted.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-6/igt@runner@aborted.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-1/igt@runner@aborted.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-3/igt@runner@aborted.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-1/igt@runner@aborted.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-7/igt@runner@aborted.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-1/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-3/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-1472-5c623c9712af3170cc9782a10ed7360ddf8f8bb4 -> xe-pw-134308v7

  IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1472-5c623c9712af3170cc9782a10ed7360ddf8f8bb4: 5c623c9712af3170cc9782a10ed7360ddf8f8bb4
  xe-pw-134308v7: 134308v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/index.html

--===============3126734279581878151==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix missing runtime outer protection=
 for ggtt_remove_node (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/134308/">https://patchwork.freedesktop.org/series/134308/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-134308v7/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-134308v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1472-5c623c9712af3170cc9782a10ed7360dd=
f8f8bb4_full -&gt; xe-pw-134308v7_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-134308v7_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-134308v7_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1343=
08v7_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-134308v7/shard-adlp-9/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/sha=
rd-adlp-4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-8/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13430=
8v7/shard-adlp-9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-8/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-134308v7/shard-adlp-9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-2/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-134308v7/shard-adlp-1/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-8/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-134308v7/shard-adlp-4/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-a=
dlp-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-2/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/=
shard-adlp-1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-8/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
4308v7/shard-adlp-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-1/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-134308v7/shard-adlp-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-2/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-134308v7/shard-adlp-4/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-6/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-134308v7/shard-adlp-1/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-=
adlp-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-134308v7/shard-adlp-4/igt@runner@aborted.html">FA=
IL</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-134308v7/shard-dg2-433/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/sh=
ard-dg2-435/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-435/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
4308v7/shard-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-433/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-134308v7/shard-dg2-435/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-433/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-134308v7/shard-dg2-463/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg=
2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-464/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7=
/shard-dg2-464/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-466/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-134308v7/shard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-464/igt@runne=
r@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-134308v7/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-463/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-134308v7/shard-dg2-434/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard=
-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-466/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13430=
8v7/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-463/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-134308v7/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-dg2-434/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-134308v7/shard-dg2-466/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@runner@aborted:<ul>
<li>{shard-lnl}:        NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-134308v7/shard-lnl-3/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shar=
d-lnl-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-4/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7=
/shard-lnl-4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134=
308v7/shard-lnl-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-6/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-134308v7/shard-lnl-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-7/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-134308v7/shard-lnl-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-1/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-134308v7/shard-lnl-3/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-6/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-134308v7/shard-lnl-1/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl=
-3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-134308v7/shard-lnl-1/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7/shar=
d-lnl-7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-1/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v7=
/shard-lnl-3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-134308v7/shard-lnl-7/igt@runner@aborted.htm=
l">FAIL</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1472-5c623c9712af3170cc9782a10ed7360ddf8f8bb4 -&gt; xe-pw-134=
308v7</li>
</ul>
<p>IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-1472-5c623c9712af3170cc9782a10ed7360ddf8f8bb4: 5c623c9712af3170cc9782a=
10ed7360ddf8f8bb4<br />
  xe-pw-134308v7: 134308v7</p>

</body>
</html>

--===============3126734279581878151==--
