Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8A8E82CA1
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 15:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAC210E06C;
	Wed, 27 Sep 2023 15:07:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 62FC610E06C;
 Wed, 27 Sep 2023 15:07:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5CB2FA00CC;
 Wed, 27 Sep 2023 15:07:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5864712108387029343=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Wed, 27 Sep 2023 15:07:42 -0000
Message-ID: <169582726234.20757.1540870312981034035@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230927142919.272895-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230927142919.272895-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A?=
 =?utf-8?q?_Count_and_report_low_level_driver_errors_=28rev5=29?=
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

--===============5864712108387029343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Count and report low level driver errors (rev5)
URL   : https://patchwork.freedesktop.org/series/124026/
State : failure

== Summary ==

CI Bug Log - changes from xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b_BAT -> xe-pw-124026v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-124026v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-124026v5_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 4)
------------------------------

  Additional (1): bat-pvc-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-124026v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b/bat-atsm-2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/bat-atsm-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-124026v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-pvc-2:          NOTRUN -> [SKIP][3] ([Intel XE#678]) +209 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@bo:
    - bat-pvc-2:          NOTRUN -> [SKIP][4] ([Intel XE#725]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/bat-pvc-2/igt@xe_live_ktest@bo.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][5] -> [INCOMPLETE][6] ([Intel XE#597] / [Intel XE#714])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b/bat-dg2-oem2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-pvc-2:          NOTRUN -> [SKIP][7] ([Intel XE#378])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/bat-pvc-2/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][8] -> [INCOMPLETE][9] ([Intel XE#597])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b/bat-adlp-7/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/bat-adlp-7/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/597
  [Intel XE#678]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/678
  [Intel XE#714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/714
  [Intel XE#725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/725


Build changes
-------------

  * Linux: xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b -> xe-pw-124026v5

  IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b: bce60b0ff2937cb2ea51841a479bc1a2da65052b
  xe-pw-124026v5: 124026v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/index.html

--===============5864712108387029343==
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
<tr><td><b>Series:</b></td><td>drm/xe: Count and report low level driver errors (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124026/">https://patchwork.freedesktop.org/series/124026/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b_BAT -&gt; xe-pw-124026v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-124026v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-124026v5_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 4)</h2>
<p>Additional (1): bat-pvc-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-124026v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/bat-atsm-2/igt@xe_module_load@load.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124026v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) +209 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/bat-pvc-2/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/725">Intel XE#725</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/bat-dg2-oem2/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/597">Intel XE#597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/714">Intel XE#714</a>)</p>
</li>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/bat-pvc-2/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v5/bat-adlp-7/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/597">Intel XE#597</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b -&gt; xe-pw-124026v5</li>
</ul>
<p>IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b: bce60b0ff2937cb2ea51841a479bc1a2da65052b<br />
  xe-pw-124026v5: 124026v5</p>

</body>
</html>

--===============5864712108387029343==--
