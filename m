Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD66C3DA63
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 01:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D3D10E02C;
	Thu, 25 Jul 2024 01:57:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F82410E02C;
 Thu, 25 Jul 2024 01:56:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0140556161563253528=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Move_HuC_and_GSC_FW_defs_for_LNL?=
 =?utf-8?q?_and_BMG_to_drm-xe-next?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jul 2024 01:56:59 -0000
Message-ID: <172187261957.364125.440892048517342645@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
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

--===============0140556161563253528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Move HuC and GSC FW defs for LNL and BMG to drm-xe-next
URL   : https://patchwork.freedesktop.org/series/136464/
State : success

== Summary ==

CI Bug Log - changes from xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1_BAT -> xe-pw-136464v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136464v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] ([Intel XE#1885])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@eof:
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] ([Intel XE#2134]) +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@fbdev@eof.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@fbdev@eof.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] ([i915#2575]) +50 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][7] -> [DMESG-FAIL][8] ([Intel XE#324])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-oem2:       [PASS][9] -> [SKIP][10] ([Intel XE#2135])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][11] -> [SKIP][12] ([Intel XE#1130]) +155 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_live_ktest@xe_bo:
    - bat-dg2-oem2:       [PASS][13] -> [SKIP][14] ([Intel XE#455])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-dg2-oem2:       [PASS][15] -> [SKIP][16] ([Intel XE#2229] / [Intel XE#455])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [PASS][17] -> [SKIP][18] ([Intel XE#2229])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][19] -> [FAIL][20] ([Intel XE#2136])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#623]) -> [SKIP][22] ([i915#2575])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#455]) -> [SKIP][24] ([Intel XE#2135])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][25] ([i915#5274]) -> [SKIP][26] ([i915#2575])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#929]) -> [SKIP][28] ([Intel XE#2135]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#1091]) -> [SKIP][30] ([i915#2575]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       [SKIP][31] ([Intel XE#288]) -> [SKIP][32] ([Intel XE#1130]) +32 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][33] ([Intel XE#255]) -> [SKIP][34] ([Intel XE#1130])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][35] ([Intel XE#977]) -> [SKIP][36] ([Intel XE#1130])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][37] ([Intel XE#979]) -> [SKIP][38] ([Intel XE#1130]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2135
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
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

  * Linux: xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1 -> xe-pw-136464v1

  IGT_7936: 7936
  xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1: 4a9ed276779ab36170c7ee6c5237263eb563acc1
  xe-pw-136464v1: 136464v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/index.html

--===============0140556161563253528==
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
<tr><td><b>Series:</b></td><td>Move HuC and GSC FW defs for LNL and BMG to drm-xe-next</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136464/">https://patchwork.freedesktop.org/series/136464/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1_BAT -&gt; xe-pw-136464v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136464v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2135">Intel XE#2135</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +155 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2135">Intel XE#2135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2135">Intel XE#2135</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136464v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1 -&gt; xe-pw-136464v1</li>
</ul>
<p>IGT_7936: 7936<br />
  xe-1662-4a9ed276779ab36170c7ee6c5237263eb563acc1: 4a9ed276779ab36170c7ee6c5237263eb563acc1<br />
  xe-pw-136464v1: 136464v1</p>

</body>
</html>

--===============0140556161563253528==--
