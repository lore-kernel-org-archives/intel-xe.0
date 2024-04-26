Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C175C04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 09:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1057F10F1D5;
	Fri, 26 Apr 2024 09:58:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEB910F1D5;
 Fri, 26 Apr 2024 09:58:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5044741123109603561=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Refactor_default_device_atomic_s?=
 =?utf-8?q?ettings_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Apr 2024 09:58:49 -0000
Message-ID: <171412552997.1685485.6221582934194070298@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240425222346.13026-1-nirmoy.das@intel.com>
In-Reply-To: <20240425222346.13026-1-nirmoy.das@intel.com>
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

--===============5044741123109603561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refactor default device atomic settings (rev2)
URL   : https://patchwork.freedesktop.org/series/132930/
State : failure

== Summary ==

CI Bug Log - changes from xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f_BAT -> xe-pw-132930v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132930v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132930v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132930v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2] +15 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory.html

  
Known issues
------------

  Here are the changes found in xe-pw-132930v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] ([Intel XE#1136])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] ([i915#2575]) +50 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [PASS][7] -> [SKIP][8] ([Intel XE#1134])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][9] -> [SKIP][10] ([Intel XE#1130]) +155 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [PASS][11] -> [SKIP][12] ([Intel XE#1575])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [PASS][13] -> [SKIP][14] ([Intel XE#455]) +5 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][15] -> [FAIL][16] ([Intel XE#1574])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][17] ([Intel XE#623]) -> [SKIP][18] ([i915#2575])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][19] ([Intel XE#455]) -> [SKIP][20] ([Intel XE#1134])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][21] ([i915#5274]) -> [SKIP][22] ([i915#2575])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#929]) -> [SKIP][24] ([Intel XE#1134]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       [SKIP][25] ([Intel XE#288]) -> [SKIP][26] ([Intel XE#1130]) +32 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#255]) -> [SKIP][28] ([Intel XE#1130])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#977]) -> [SKIP][30] ([Intel XE#1130])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][31] ([Intel XE#979]) -> [SKIP][32] ([Intel XE#1130]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136
  [Intel XE#1574]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1574
  [Intel XE#1575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1575
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7824 -> IGT_7825
  * Linux: xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f -> xe-pw-132930v2

  IGT_7824: 7824
  IGT_7825: 28b2a1b0be86e33a2fc04a022e04f07bd25b66d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f: f39ba481e5873b7617afc2e8cf618ac9dc85123f
  xe-pw-132930v2: 132930v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/index.html

--===============5044741123109603561==
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
<tr><td><b>Series:</b></td><td>Refactor default device atomic settings (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132930/">https://patchwork.freedesktop.org/series/132930/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f_BAT -&gt; xe-pw-132930v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132930v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132930v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132930v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132930v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136">Intel XE#1136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +155 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1575">Intel XE#1575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1574">Intel XE#1574</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v2/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7824 -&gt; IGT_7825</li>
<li>Linux: xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f -&gt; xe-pw-132930v2</li>
</ul>
<p>IGT_7824: 7824<br />
  IGT_7825: 28b2a1b0be86e33a2fc04a022e04f07bd25b66d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f: f39ba481e5873b7617afc2e8cf618ac9dc85123f<br />
  xe-pw-132930v2: 132930v2</p>

</body>
</html>

--===============5044741123109603561==--
