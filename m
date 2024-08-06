Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A29C3DA64
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 14:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA9310E386;
	Tue,  6 Aug 2024 14:21:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3308410E386;
 Tue,  6 Aug 2024 14:21:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0079808330525220332=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Add_HDMI_PLL_Algorithm_for_SNPS/?=
 =?utf-8?q?C10PHY_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Aug 2024 14:21:07 -0000
Message-ID: <172295406720.543386.9573918881026103018@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806125827.2183899-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240806125827.2183899-1-ankit.k.nautiyal@intel.com>
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

--===============0079808330525220332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add HDMI PLL Algorithm for SNPS/C10PHY (rev2)
URL   : https://patchwork.freedesktop.org/series/135396/
State : success

== Summary ==

CI Bug Log - changes from xe-1719-38af90f98c71935da87b28c0552f32d175352d9f_BAT -> xe-pw-135396v2_BAT
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

  Here are the changes found in xe-pw-135396v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#886]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [SKIP][3] ([Intel XE#1885]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@nullptr:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#2134]) -> [PASS][6] +4 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@fbdev@nullptr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#2423] / [i915#2575]) -> [PASS][8] +51 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [SKIP][9] ([Intel XE#2351]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-dg2-oem2:       [SKIP][11] ([Intel XE#455]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-dg2-oem2:       [SKIP][13] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [SKIP][15] ([Intel XE#2229]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][17] ([Intel XE#2136]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_module_load@load.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [SKIP][19] ([Intel XE#1130]) -> [PASS][20] +155 other tests pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#2423] / [i915#2575]) -> [SKIP][22] ([Intel XE#623])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#2351]) -> [SKIP][24] ([Intel XE#455])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][25] ([Intel XE#2351]) -> [SKIP][26] ([Intel XE#929]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#2423] / [i915#2575]) -> [SKIP][28] ([Intel XE#1091]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#1130]) -> [SKIP][30] ([Intel XE#288]) +32 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][31] ([Intel XE#1130]) -> [SKIP][32] ([Intel XE#255])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][33] ([Intel XE#1130]) -> [SKIP][34] ([Intel XE#977])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][35] ([Intel XE#1130]) -> [SKIP][36] ([Intel XE#979]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
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
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-1719-38af90f98c71935da87b28c0552f32d175352d9f -> xe-pw-135396v2

  IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1719-38af90f98c71935da87b28c0552f32d175352d9f: 38af90f98c71935da87b28c0552f32d175352d9f
  xe-pw-135396v2: 135396v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/index.html

--===============0079808330525220332==
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
<tr><td><b>Series:</b></td><td>Add HDMI PLL Algorithm for SNPS/C10PHY (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135396/">https://patchwork.freedesktop.org/series/135396/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1719-38af90f98c71935da87b28c0552f32d175352d9f_BAT -&gt; xe-pw-135396v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135396v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@fbdev@nullptr.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> +51 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> +155 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135396v2/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1719-38af90f98c71935da87b28c0552f32d175352d9f -&gt; xe-pw-135396v2</li>
</ul>
<p>IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1719-38af90f98c71935da87b28c0552f32d175352d9f: 38af90f98c71935da87b28c0552f32d175352d9f<br />
  xe-pw-135396v2: 135396v2</p>

</body>
</html>

--===============0079808330525220332==--
