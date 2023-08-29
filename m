Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323F1C71153
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 14:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA0B10E36D;
	Tue, 29 Aug 2023 14:55:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E85ED10E36D;
 Tue, 29 Aug 2023 14:55:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DDD00AADD8;
 Tue, 29 Aug 2023 14:55:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0430201627329266933=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Tue, 29 Aug 2023 14:55:34 -0000
Message-ID: <169332093490.16748.18332114320668213355@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230829094538.19551-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230829094538.19551-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_fixup!_dr?=
 =?utf-8?q?m/xe/pvc=3A_Use_fast_copy_engines_as_migrate_engine_on_PVC_=28r?=
 =?utf-8?q?ev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============0430201627329266933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fixup! drm/xe/pvc: Use fast copy engines as migrate engine on PVC (rev2)
URL   : https://patchwork.freedesktop.org/series/122998/
State : success

== Summary ==

CI Bug Log - changes from xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5_BAT -> xe-pw-122998v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 4)
------------------------------

  Additional (1): bat-pvc-2 

Known issues
------------

  Here are the changes found in xe-pw-122998v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([i915#6077]) +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-atsm-2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([Intel XE#623])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         NOTRUN -> [FAIL][3] ([Intel XE#609]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([Intel XE#624])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][5] ([Intel XE#609]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [PASS][6] -> [FAIL][7] ([Intel XE#480])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         NOTRUN -> [INCOMPLETE][8] ([Intel XE#632])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-oem2:       NOTRUN -> [FAIL][9] ([Intel XE#608])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
    - bat-atsm-2:         NOTRUN -> [SKIP][10] ([Intel XE#539])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [FAIL][11] ([Intel XE#480]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Warnings ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-atsm-2:         [SKIP][13] ([Intel XE#277]) -> [SKIP][14] ([Intel XE#277] / [Intel XE#540]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/252
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/277
  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/483
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/533
  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
  [Intel XE#536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/536
  [Intel XE#537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/537
  [Intel XE#538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/538
  [Intel XE#539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/539
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/632
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7451 -> IGT_7458
  * Linux: xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5 -> xe-pw-122998v2

  IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7458: 7458
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5
  xe-pw-122998v2: 122998v2



--===============0430201627329266933==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>fixup! drm/xe/pvc: Use fast copy engines as migrate engine on PVC (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122998/">https://patchwork.freedesktop.org/series/122998/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

</table>


    <h1>CI Bug Log - changes from xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5_BAT -&gt; xe-pw-122998v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 4)</h2>
<p>Additional (1): bat-pvc-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-122998v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-atsm-2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>)</p>
</li>
<li>
<p>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/539">Intel XE#539</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_force_connector_basic@force-connector-state:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/277">Intel XE#277</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122998v2/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/277">Intel XE#277</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7451 -&gt; IGT_7458</li>
<li>Linux: xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5 -&gt; xe-pw-122998v2</li>
</ul>
<p>IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7458: 7458<br />
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5<br />
  xe-pw-122998v2: 122998v2</p>

</body>
</html>

--===============0430201627329266933==--
