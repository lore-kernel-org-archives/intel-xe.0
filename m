Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DCDC3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 11:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8090510E682;
	Tue, 16 Jul 2024 11:55:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC6910E682;
 Tue, 16 Jul 2024 11:55:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2163301532649949434=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/xe2=3A_Use_XE=5FWA=28=29?=
 =?utf-8?q?_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jul 2024 11:55:53 -0000
Message-ID: <172113095330.234722.13644891494769389797@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240716094635.3427833-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240716094635.3427833-1-tejas.upadhyay@intel.com>
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

--===============2163301532649949434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Use XE_WA() check
URL   : https://patchwork.freedesktop.org/series/136138/
State : failure

== Summary ==

CI Bug Log - changes from xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9_full -> xe-pw-136138v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136138v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136138v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136138v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-adlp:         NOTRUN -> ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-8/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner@aborted.html
    - shard-dg2-set2:     NOTRUN -> ([FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25], [FAIL][26], [FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-435/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-463/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-463/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-464/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-434/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-466/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-435/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-464/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-433/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-433/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-436/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-435/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-466/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-436/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-433/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-434/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-434/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-464/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-436/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-464/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-466/igt@runner@aborted.html

  


Build changes
-------------

  * IGT: IGT_7926 -> IGT_7927
  * Linux: xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9 -> xe-pw-136138v1

  IGT_7926: 9c28c27d4d48cecf8b7692a2975bde1cc1632096 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7927: a2ab0ec12ef447c96c67dc539813462b6b39f857 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9: b6af83ceb593bc4e0d79acda73684462b13a15b9
  xe-pw-136138v1: 136138v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/index.html

--===============2163301532649949434==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Use XE_WA() check</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/136138/">https://patchwork.freedesktop.org/series/136138/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-136138v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-136138v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1613-b6af83ceb593bc4e0d79acda73684462b=
13a15b9_full -&gt; xe-pw-136138v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136138v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-136138v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1361=
38v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/sha=
rd-adlp-9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13613=
8v1/shard-adlp-9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-136138v1/shard-adlp-9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-136138v1/shard-adlp-8/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-adlp-9/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-136138v1/shard-adlp-9/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-a=
dlp-9/igt@runner@aborted.html">FAIL</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-136138v1/shard-dg2-435/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/sh=
ard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-463/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
6138v1/shard-dg2-464/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-434/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-136138v1/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-435/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-136138v1/shard-dg2-464/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg=
2-433/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-433/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1=
/shard-dg2-436/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-435/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-136138v1/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-436/igt@runne=
r@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-136138v1/shard-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-434/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-136138v1/shard-dg2-434/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard=
-dg2-464/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-436/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13613=
8v1/shard-dg2-464/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-136138v1/shard-dg2-466/igt@runner@abor=
ted.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7926 -&gt; IGT_7927</li>
<li>Linux: xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9 -&gt; xe-pw-136=
138v1</li>
</ul>
<p>IGT_7926: 9c28c27d4d48cecf8b7692a2975bde1cc1632096 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_7927: a2ab0ec12ef447c96c67dc539813462b6b39f857 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9: b6af83ceb593bc4e0d79acd=
a73684462b13a15b9<br />
  xe-pw-136138v1: 136138v1</p>

</body>
</html>

--===============2163301532649949434==--
