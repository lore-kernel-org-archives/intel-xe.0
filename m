Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E65C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 23:01:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9047F10F56F;
	Thu, 23 May 2024 23:01:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633E410F56F;
 Thu, 23 May 2024 23:01:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1346867509462654436=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/display=3A_Expand_runti?=
 =?utf-8?q?me=5Fpm_protection_to_atomic_commit_work?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 May 2024 23:01:07 -0000
Message-ID: <171650526740.2171858.12487316019517688829@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240523220318.25446-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240523220318.25446-1-rodrigo.vivi@intel.com>
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

--===============1346867509462654436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Expand runtime_pm protection to atomic commit work
URL   : https://patchwork.freedesktop.org/series/133992/
State : success

== Summary ==

CI Bug Log - changes from xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09_BAT -> xe-pw-133992v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-133992v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] ([Intel XE#1885])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] ([i915#2575]) +50 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] ([Intel XE#1134])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          NOTRUN -> [FAIL][7] ([Intel XE#1000]) +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][8] ([Intel XE#482]) +3 other tests dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_gt_freq@freq_range_idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][9] ([Intel XE#1021]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          NOTRUN -> [SKIP][10] ([Intel XE#255])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
    - bat-atsm-2:         NOTRUN -> [SKIP][11] ([Intel XE#255])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][12] -> [SKIP][13] ([Intel XE#1130]) +155 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][14] ([Intel XE#532])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][15] -> [FAIL][16] ([Intel XE#1132])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@xe_module_load@load.html

  * igt@xe_pat@pat-index-xe2:
    - bat-pvc-2:          NOTRUN -> [SKIP][17] ([Intel XE#977]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][18] ([Intel XE#976])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-pvc-2:          NOTRUN -> [SKIP][19] ([Intel XE#979])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][20] ([Intel XE#531])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#623]) -> [SKIP][22] ([i915#2575])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#455]) -> [SKIP][24] ([Intel XE#1134])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][25] ([i915#5274]) -> [SKIP][26] ([i915#2575])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#929]) -> [SKIP][28] ([Intel XE#1134]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#288]) -> [SKIP][30] ([Intel XE#1130]) +32 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][31] ([Intel XE#255]) -> [SKIP][32] ([Intel XE#1130])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][33] ([Intel XE#977]) -> [SKIP][34] ([Intel XE#1130])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][35] ([Intel XE#979]) -> [SKIP][36] ([Intel XE#1130]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09 -> xe-pw-133992v1

  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09: 1385623a20ad940dab90bfaa4bc01fe599506e09
  xe-pw-133992v1: 133992v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/index.html

--===============1346867509462654436==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Expand runtime_pm protection to atomic commit work</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133992/">https://patchwork.freedesktop.org/series/133992/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09_BAT -&gt; xe-pw-133992v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133992v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021">Intel XE#1021</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +155 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132">Intel XE#1132</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/976">Intel XE#976</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133992v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09 -&gt; xe-pw-133992v1</li>
</ul>
<p>IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09: 1385623a20ad940dab90bfaa4bc01fe599506e09<br />
  xe-pw-133992v1: 133992v1</p>

</body>
</html>

--===============1346867509462654436==--
