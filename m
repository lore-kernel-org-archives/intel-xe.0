Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4465C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 20:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E8510E51B;
	Thu, 15 Aug 2024 20:40:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3872910E51B;
 Thu, 15 Aug 2024 20:40:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2720538538422773059=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe=3A_Add_debugfs_to_dump_GuC=27s_hwconfig?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Aug 2024 20:40:36 -0000
Message-ID: <172375443622.634935.289729150229928985@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240815172602.2729146-3-matthew.d.roper@intel.com>
In-Reply-To: <20240815172602.2729146-3-matthew.d.roper@intel.com>
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

--===============2720538538422773059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Add debugfs to dump GuC's hwconfig
URL   : https://patchwork.freedesktop.org/series/137350/
State : success

== Summary ==

CI Bug Log - changes from xe-1772-154a177a994af4eb2c38eb592d959d98066b0329_BAT -> xe-pw-137350v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-137350v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [SKIP][1] ([Intel XE#1885]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@nullptr:
    - bat-dg2-oem2:       [SKIP][3] ([Intel XE#2134]) -> [PASS][4] +4 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@fbdev@nullptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#2423] / [i915#2575]) -> [PASS][6] +50 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#2351]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          [FAIL][9] ([Intel XE#1069]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-dg2-oem2:       [SKIP][11] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [SKIP][13] ([Intel XE#2229]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][15] ([Intel XE#2136]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_module_load@load.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [SKIP][17] ([Intel XE#1130]) -> [PASS][18] +155 other tests pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][19] ([Intel XE#2423] / [i915#2575]) -> [SKIP][20] ([Intel XE#623])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#2351]) -> [SKIP][22] ([Intel XE#455])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#2423] / [i915#2575]) -> [SKIP][24] ([i915#5274])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][25] ([Intel XE#324]) -> [DMESG-WARN][26] ([Intel XE#324])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#2351]) -> [SKIP][28] ([Intel XE#929]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#2423] / [i915#2575]) -> [SKIP][30] ([Intel XE#1091]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       [SKIP][31] ([Intel XE#1130]) -> [SKIP][32] ([Intel XE#288]) +32 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][33] ([Intel XE#1130]) -> [SKIP][34] ([Intel XE#255])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][35] ([Intel XE#1130]) -> [SKIP][36] ([Intel XE#977])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][37] ([Intel XE#1130]) -> [SKIP][38] ([Intel XE#979]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
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
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7970 -> IGT_7971
  * Linux: xe-1772-154a177a994af4eb2c38eb592d959d98066b0329 -> xe-pw-137350v1

  IGT_7970: 496e86347f8607d032ed59cdad5eb018e5be6933 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7971: 54f99657bd69295e49e1ab376fde82d3135bba7a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1772-154a177a994af4eb2c38eb592d959d98066b0329: 154a177a994af4eb2c38eb592d959d98066b0329
  xe-pw-137350v1: 137350v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/index.html

--===============2720538538422773059==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Add debugfs to dump GuC&#x27;s hwconfig</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137350/">https://patchwork.freedesktop.org/series/137350/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1772-154a177a994af4eb2c38eb592d959d98066b0329_BAT -&gt; xe-pw-137350v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137350v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@fbdev@nullptr.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> +50 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> +155 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1772-154a177a994af4eb2c38eb592d959d98066b0329/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137350v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7970 -&gt; IGT_7971</li>
<li>Linux: xe-1772-154a177a994af4eb2c38eb592d959d98066b0329 -&gt; xe-pw-137350v1</li>
</ul>
<p>IGT_7970: 496e86347f8607d032ed59cdad5eb018e5be6933 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7971: 54f99657bd69295e49e1ab376fde82d3135bba7a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1772-154a177a994af4eb2c38eb592d959d98066b0329: 154a177a994af4eb2c38eb592d959d98066b0329<br />
  xe-pw-137350v1: 137350v1</p>

</body>
</html>

--===============2720538538422773059==--
