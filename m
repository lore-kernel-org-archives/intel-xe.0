Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91D7C52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 18:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8378E10E416;
	Wed, 21 Aug 2024 18:23:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B60610E416;
 Wed, 21 Aug 2024 18:23:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0866887659198275571=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_fixup_xe=5Falloc=5Fpf?=
 =?utf-8?q?=5Fqueue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Aug 2024 18:23:51 -0000
Message-ID: <172426463103.722511.6527830475706911255@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240821171917.417386-2-matthew.auld@intel.com>
In-Reply-To: <20240821171917.417386-2-matthew.auld@intel.com>
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

--===============0866887659198275571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: fixup xe_alloc_pf_queue
URL   : https://patchwork.freedesktop.org/series/137584/
State : success

== Summary ==

CI Bug Log - changes from xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7_BAT -> xe-pw-137584v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-137584v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [SKIP][1] ([Intel XE#1885]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@nullptr:
    - bat-dg2-oem2:       [SKIP][3] ([Intel XE#2134]) -> [PASS][4] +4 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@fbdev@nullptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#2423] / [i915#2575]) -> [PASS][6] +50 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#2351]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-dg2-oem2:       [SKIP][9] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [SKIP][11] ([Intel XE#2229]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][13] ([Intel XE#2136]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_module_load@load.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [SKIP][15] ([Intel XE#1130]) -> [PASS][16] +155 other tests pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][17] ([Intel XE#2423] / [i915#2575]) -> [SKIP][18] ([Intel XE#623])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][19] ([Intel XE#2351]) -> [SKIP][20] ([Intel XE#455])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#2423] / [i915#2575]) -> [SKIP][22] ([i915#5274])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#2351]) -> [SKIP][24] ([Intel XE#929]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       [SKIP][25] ([Intel XE#2423] / [i915#2575]) -> [SKIP][26] ([Intel XE#1091]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#1130]) -> [SKIP][28] ([Intel XE#288]) +32 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#1130]) -> [SKIP][30] ([Intel XE#255])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][31] ([Intel XE#1130]) -> [SKIP][32] ([Intel XE#977])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][33] ([Intel XE#1130]) -> [SKIP][34] ([Intel XE#979]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
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

  * Linux: xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7 -> xe-pw-137584v1

  IGT_7982: 76ebe4ecfa1757f21e3f1d3be5993088a92cd274 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7: b2b3766fbd467d72347b4a02fd52fd50898a52f7
  xe-pw-137584v1: 137584v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/index.html

--===============0866887659198275571==
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
<tr><td><b>Series:</b></td><td>drm/xe: fixup xe_alloc_pf_queue</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137584/">https://patchwork.freedesktop.org/series/137584/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7_BAT -&gt; xe-pw-137584v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137584v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@fbdev@nullptr.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> +50 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> +155 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137584v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7 -&gt; xe-pw-137584v1</li>
</ul>
<p>IGT_7982: 76ebe4ecfa1757f21e3f1d3be5993088a92cd274 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1806-b2b3766fbd467d72347b4a02fd52fd50898a52f7: b2b3766fbd467d72347b4a02fd52fd50898a52f7<br />
  xe-pw-137584v1: 137584v1</p>

</body>
</html>

--===============0866887659198275571==--
