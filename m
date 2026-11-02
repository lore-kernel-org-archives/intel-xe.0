Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B749606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 06:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B3B10E572;
	Mon,  2 Nov 2026 06:34:02 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8791310E572;
 Mon,  2 Nov 2026 06:34:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5931788798759333186=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_gpu/buddy=3A_Fix_quadratic?=
 =?utf-8?q?_cost_of_range-biased_allocation_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 06:34:01 -0000
Message-ID: <179360124154.100339.15638171495127517621@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102051633.2035348-3-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20261102051633.2035348-3-sanjay.kumar.yadav@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5931788798759333186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu/buddy: Fix quadratic cost of range-biased allocation (rev5)
URL   : https://patchwork.freedesktop.org/series/175945/
State : failure

== Summary ==

CI Bug Log - changes from xe-6038-e381c39629d83fbe9de2c94a98a2bbb0b875cf28_FULL -> xe-pw-175945v5_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-175945v5_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-175945v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-175945v5_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-bmg:          NOTRUN -> ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-2/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-2/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-7/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-6/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-6/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-6/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-10/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-5/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-3/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-5/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-3/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-5/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-3/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-7/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-9/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-1/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-7/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-9/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-8/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-4/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-8/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-1/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-9/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-4/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-10/igt@runner@aborted.html
    - shard-lnl:          NOTRUN -> ([FAIL][26], [FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35], [FAIL][36], [FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42], [FAIL][43], [FAIL][44], [FAIL][45], [FAIL][46], [FAIL][47], [FAIL][48], [FAIL][49], [FAIL][50])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-4/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-2/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-5/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-5/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-4/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-8/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-7/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-7/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-8/igt@runner@aborted.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-7/igt@runner@aborted.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-8/igt@runner@aborted.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-7/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-3/igt@runner@aborted.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-5/igt@runner@aborted.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-3/igt@runner@aborted.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-5/igt@runner@aborted.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-8/igt@runner@aborted.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-3/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-4/igt@runner@aborted.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-3/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-2/igt@runner@aborted.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-2/igt@runner@aborted.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-4/igt@runner@aborted.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-5/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-2/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in xe-pw-175945v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - shard-ptl:          NOTRUN -> ([FAIL][51], [FAIL][52], [FAIL][53], [FAIL][54], [FAIL][55], [FAIL][56], [FAIL][57], [FAIL][58], [FAIL][59], [FAIL][60], [FAIL][61], [FAIL][62], [FAIL][63], [FAIL][64], [FAIL][65], [FAIL][66], [FAIL][67], [FAIL][68], [FAIL][69], [FAIL][70], [FAIL][71], [FAIL][72], [FAIL][73], [FAIL][74], [FAIL][75]) ([Intel XE#9694])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-2/igt@runner@aborted.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-2/igt@runner@aborted.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-5/igt@runner@aborted.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-2/igt@runner@aborted.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-6/igt@runner@aborted.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-5/igt@runner@aborted.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-4/igt@runner@aborted.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-3/igt@runner@aborted.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-4/igt@runner@aborted.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-3/igt@runner@aborted.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-4/igt@runner@aborted.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-3/igt@runner@aborted.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-4/igt@runner@aborted.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-6/igt@runner@aborted.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-5/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-7/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-7/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-7/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-8/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-8/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-8/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-1/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-1/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-6/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-1/igt@runner@aborted.html

  
  [Intel XE#9694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9694


Build changes
-------------

  * Linux: xe-6038-e381c39629d83fbe9de2c94a98a2bbb0b875cf28 -> xe-pw-175945v5

  IGT_9173: 9173
  xe-6038-e381c39629d83fbe9de2c94a98a2bbb0b875cf28: e381c39629d83fbe9de2c94a98a2bbb0b875cf28
  xe-pw-175945v5: 175945v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/index.html

--===============5931788798759333186==
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
<tr><td><b>Series:</b></td><td>gpu/buddy: Fix quadratic cost of range-biase=
d allocation (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/175945/">https://patchwork.freedesktop.org/series/175945/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-175945v5/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-175945v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6038-e381c39629d83fbe9de2c94a98a2bbb0b=
875cf28_FULL -&gt; xe-pw-175945v5_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-175945v5_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-175945v5_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1759=
45v5_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-175945v5/shard-bmg-2/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shar=
d-bmg-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-7/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5=
/shard-bmg-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175=
945v5/shard-bmg-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-10/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-175945v5/shard-bmg-5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-3/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-175945v5/shard-bmg-5/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-3/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-175945v5/shard-bmg-5/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-3/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-175945v5/shard-bmg-7/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bm=
g-9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-175945v5/shard-bmg-1/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/sha=
rd-bmg-7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-9/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v=
5/shard-bmg-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-4/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
5945v5/shard-bmg-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-1/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-175945v5/shard-bmg-9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-bmg-4/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-175945v5/shard-bmg-10/igt@runner@aborted.html">FAIL</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-175945v5/shard-lnl-4/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shar=
d-lnl-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-5/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5=
/shard-lnl-5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175=
945v5/shard-lnl-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-7/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-175945v5/shard-lnl-7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-8/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-175945v5/shard-lnl-7/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-8/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-175945v5/shard-lnl-7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-3/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-175945v5/shard-lnl-5/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl=
-3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-175945v5/shard-lnl-5/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shar=
d-lnl-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-3/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5=
/shard-lnl-4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-3/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175=
945v5/shard-lnl-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-2/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-175945v5/shard-lnl-4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-lnl-5/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-175945v5/shard-lnl-2/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175945v5_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-ptl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-175945v5/shard-ptl-2/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shar=
d-ptl-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-5/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5=
/shard-ptl-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175=
945v5/shard-ptl-5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-4/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-175945v5/shard-ptl-3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-4/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-175945v5/shard-ptl-3/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-4/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-175945v5/shard-ptl-3/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-4/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-175945v5/shard-ptl-6/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl=
-5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-175945v5/shard-ptl-7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shar=
d-ptl-7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-7/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5=
/shard-ptl-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-8/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175=
945v5/shard-ptl-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-1/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-175945v5/shard-ptl-1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/shard-ptl-6/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-175945v5/shard-ptl-1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9694">Intel XE#9694</a>=
)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6038-e381c39629d83fbe9de2c94a98a2bbb0b875cf28 -&gt; xe-pw-175=
945v5</li>
</ul>
<p>IGT_9173: 9173<br />
  xe-6038-e381c39629d83fbe9de2c94a98a2bbb0b875cf28: e381c39629d83fbe9de2c94=
a98a2bbb0b875cf28<br />
  xe-pw-175945v5: 175945v5</p>

</body>
</html>

--===============5931788798759333186==--
