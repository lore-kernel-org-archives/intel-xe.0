Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC73C54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 15:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AAA1138FA;
	Fri,  8 Mar 2024 15:30:16 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B551125D5;
 Fri,  8 Mar 2024 15:30:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1181523266600017028=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/pvc=3A_fix_CI_GuC_FW_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Mar 2024 15:30:15 -0000
Message-ID: <170991181572.629227.2573530054848035908@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240308134202.901394-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240308134202.901394-1-daniele.ceraolospurio@intel.com>
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

--===============1181523266600017028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pvc: fix CI GuC FW path
URL   : https://patchwork.freedesktop.org/series/130919/
State : success

== Summary ==

CI Bug Log - changes from xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38_BAT -> xe-pw-130919v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in xe-pw-130919v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xehpc@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][1] ([Intel XE#976])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

  
#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-pvc-2:          [SKIP][2] ([Intel XE#1130]) -> [PASS][3] +166 other tests pass
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [TIMEOUT][4] ([Intel XE#1167]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-pvc-2:          [SKIP][6] ([Intel XE#1245]) -> [PASS][7] +6 other tests pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - bat-pvc-2:          [DMESG-FAIL][8] ([Intel XE#1315]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          [SKIP][10] ([Intel XE#1314]) -> [SKIP][11] ([i915#6077]) +30 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-pvc-2:          [SKIP][12] ([Intel XE#1314]) -> [SKIP][13] ([Intel XE#1024] / [Intel XE#782]) +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-pvc-2:          [SKIP][14] ([Intel XE#1314]) -> [SKIP][15] ([Intel XE#1024] / [Intel XE#784])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_dsc@dsc-basic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-pvc-2:          [SKIP][16] ([Intel XE#1314]) -> [SKIP][17] ([Intel XE#1024] / [Intel XE#947]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          [SKIP][18] ([Intel XE#1314]) -> [SKIP][19] ([Intel XE#540]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-pvc-2:          [SKIP][20] ([Intel XE#1314]) -> [SKIP][21] ([Intel XE#1024] / [Intel XE#783])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-pvc-2:          [SKIP][22] ([Intel XE#1314]) -> [SKIP][23] ([Intel XE#829]) +6 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          [SKIP][24] ([Intel XE#1314]) -> [SKIP][25] ([Intel XE#780])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_prop_blob@basic.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-pvc-2:          [SKIP][26] ([Intel XE#1314]) -> [SKIP][27] ([Intel XE#1024]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [SKIP][28] ([Intel XE#1130]) -> [FAIL][29] ([Intel XE#1000]) +3 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [SKIP][30] ([Intel XE#1130]) -> [DMESG-FAIL][31] ([Intel XE#482]) +3 other tests dmesg-fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_gt_freq@freq_range_idle:
    - bat-pvc-2:          [SKIP][32] ([Intel XE#1130]) -> [SKIP][33] ([Intel XE#1021]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          [SKIP][34] ([Intel XE#1130]) -> [SKIP][35] ([Intel XE#255])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          [SKIP][36] ([Intel XE#1130]) -> [SKIP][37] ([Intel XE#532])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_intel_bb@render.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_pat@pat-index-xe2:
    - bat-pvc-2:          [SKIP][38] ([Intel XE#1130]) -> [SKIP][39] ([Intel XE#977]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_pat@pat-index-xe2.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-pvc-2:          [SKIP][40] ([Intel XE#1130]) -> [SKIP][41] ([Intel XE#979])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          [SKIP][42] ([Intel XE#1130]) -> [SKIP][43] ([Intel XE#531])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1167]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167
  [Intel XE#1245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1245
  [Intel XE#1314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1314
  [Intel XE#1315]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1315
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7749 -> IGT_7750
  * Linux: xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38 -> xe-pw-130919v1

  IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7750: 856773abcf75b3beba8a0ae1561b07a5f00b3337 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38: 024301d28b0b2cf492ffdb3ce688044cd9923f38
  xe-pw-130919v1: 130919v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/index.html

--===============1181523266600017028==
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
<tr><td><b>Series:</b></td><td>drm/xe/pvc: fix CI GuC FW path</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130919/">https://patchwork.freedesktop.org/series/130919/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38_BAT -&gt; xe-pw-130919v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130919v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xehpc@render:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/976">Intel XE#976</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> +166 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167">Intel XE#1167</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1245">Intel XE#1245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_module_load@load.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1315">Intel XE#1315</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1314">Intel XE#1314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1314">Intel XE#1314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1314">Intel XE#1314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1314">Intel XE#1314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1314">Intel XE#1314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1314">Intel XE#1314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1314">Intel XE#1314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1314">Intel XE#1314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1314">Intel XE#1314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021">Intel XE#1021</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130919v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7749 -&gt; IGT_7750</li>
<li>Linux: xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38 -&gt; xe-pw-130919v1</li>
</ul>
<p>IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7750: 856773abcf75b3beba8a0ae1561b07a5f00b3337 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38: 024301d28b0b2cf492ffdb3ce688044cd9923f38<br />
  xe-pw-130919v1: 130919v1</p>

</body>
</html>

--===============1181523266600017028==--
