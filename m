Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760E1E77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 06:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404D110E273;
	Wed,  8 Jan 2025 06:49:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3B810E273;
 Wed,  8 Jan 2025 06:49:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6056594021351968826=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Expose_modifiers/formats_su?=
 =?utf-8?q?pported_by_async_flips_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Jan 2025 06:49:53 -0000
Message-ID: <173631899351.1214143.3390473637488793631@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
In-Reply-To: <20250108-asyn-v3-0-f4399635eec9@intel.com>
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

--===============6056594021351968826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Expose modifiers/formats supported by async flips (rev2)
URL   : https://patchwork.freedesktop.org/series/140934/
State : failure

== Summary ==

CI Bug Log - changes from xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5_BAT -> xe-pw-140934v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140934v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140934v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140934v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-bmg-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-bmg-2/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-lnl-2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@runner@aborted:
    - bat-pvc-2:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-pvc-2/igt@runner@aborted.html
    - bat-atsm-2:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-atsm-2/igt@runner@aborted.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-dg2-oem2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-adlp-vf:        [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-adlp-vf/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-adlp-vf/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-lnl-1/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-lnl-1/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][13] -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-bmg-2/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-bmg-1/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-bmg-1/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][17] -> [DMESG-WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-lnl-2/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-lnl-2/igt@xe_module_load@load.html

  


Build changes
-------------

  * Linux: xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5 -> xe-pw-140934v2

  IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5: 8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5
  xe-pw-140934v2: 140934v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/index.html

--===============6056594021351968826==
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
<tr><td><b>Series:</b></td><td>Expose modifiers/formats supported by async flips (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140934/">https://patchwork.freedesktop.org/series/140934/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5_BAT -&gt; xe-pw-140934v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140934v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140934v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140934v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-bmg-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-bmg-2/igt@kms_addfb_basic@addfb25-4-tiled.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-pvc-2/igt@runner@aborted.html">FAIL</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-atsm-2/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-adlp-vf/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-adlp-vf/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v2/bat-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5 -&gt; xe-pw-140934v2</li>
</ul>
<p>IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5: 8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5<br />
  xe-pw-140934v2: 140934v2</p>

</body>
</html>

--===============6056594021351968826==--
