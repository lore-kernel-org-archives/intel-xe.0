Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6FFD2C567
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 14:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF1E10E0AD;
	Tue, 22 Oct 2024 14:55:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA5D10E0AD;
 Tue, 22 Oct 2024 14:55:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7731306022611366700=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/xe=5Fguc=5Fads=3A_save/re?=
 =?utf-8?q?store_OA_registers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Oct 2024 14:55:04 -0000
Message-ID: <172960890437.1309763.14057396526255219453@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241022141054.5311-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241022141054.5311-1-jonathan.cavitt@intel.com>
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

--===============7731306022611366700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_guc_ads: save/restore OA registers (rev2)
URL   : https://patchwork.freedesktop.org/series/140281/
State : failure

== Summary ==

CI Bug Log - changes from xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52_BAT -> xe-pw-140281v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140281v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140281v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140281v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          [PASS][3] -> [SKIP][4] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@load:
    - bat-atsm-2:         [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-atsm-2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-atsm-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-140281v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [PASS][7] -> [SKIP][8] ([Intel XE#1885])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@nullptr:
    - bat-dg2-oem2:       [PASS][9] -> [SKIP][10] ([Intel XE#2134]) +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@fbdev@nullptr.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [PASS][11] -> [SKIP][12] ([Intel XE#2423] / [i915#2575]) +50 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [PASS][13] -> [SKIP][14] ([Intel XE#2351])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [PASS][15] -> [SKIP][16] ([Intel XE#2229]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-atsm-2:         [PASS][17] -> [SKIP][18] ([Intel XE#1192]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][19] -> [FAIL][20] ([Intel XE#2136])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_module_load@load.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [PASS][21] -> [SKIP][22] ([Intel XE#1130]) +157 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-2:          [FAIL][23] ([Intel XE#2754]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][25] ([Intel XE#623]) -> [SKIP][26] ([Intel XE#2423] / [i915#2575])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#455]) -> [SKIP][28] ([Intel XE#2351])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][29] ([i915#5274]) -> [SKIP][30] ([Intel XE#2423] / [i915#2575])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][31] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][32] ([Intel XE#2351]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       [SKIP][33] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][34] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       [SKIP][35] ([Intel XE#288]) -> [SKIP][36] ([Intel XE#1130]) +32 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][37] ([Intel XE#255]) -> [SKIP][38] ([Intel XE#1130])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][39] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][40] ([Intel XE#1130])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][41] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][42] ([Intel XE#1130])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-dg2-oem2:       [SKIP][43] ([Intel XE#979]) -> [SKIP][44] ([Intel XE#1130])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
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

  * IGT: IGT_8081 -> IGT_8082
  * Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -> xe-pw-140281v2

  IGT_8081: 9b8c0f6da8898f760bfaa2113455eb84b68a69f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
  xe-pw-140281v2: 140281v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/index.html

--===============7731306022611366700==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_guc_ads: save/restore OA registers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140281/">https://patchwork.freedesktop.org/series/140281/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52_BAT -&gt; xe-pw-140281v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140281v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140281v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140281v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-atsm-2/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140281v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +157 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v2/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8081 -&gt; IGT_8082</li>
<li>Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -&gt; xe-pw-140281v2</li>
</ul>
<p>IGT_8081: 9b8c0f6da8898f760bfaa2113455eb84b68a69f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52<br />
  xe-pw-140281v2: 140281v2</p>

</body>
</html>

--===============7731306022611366700==--
