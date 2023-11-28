Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA682C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 17:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5105510E186;
	Tue, 28 Nov 2023 17:14:54 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2EB2F10E16B;
 Tue, 28 Nov 2023 17:14:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 26547AA3D8;
 Tue, 28 Nov 2023 17:14:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4900273739922343844=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Tue, 28 Nov 2023 17:14:51 -0000
Message-ID: <170119169112.8219.12111005490431101154@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231128151507.1015-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231128151507.1015-1-michal.wajdeczko@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Introduce?=
 =?utf-8?q?_Local_Memory_Translation_Table?=
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

--===============4900273739922343844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce Local Memory Translation Table
URL   : https://patchwork.freedesktop.org/series/126993/
State : success

== Summary ==

CI Bug Log - changes from xe-525-417251e59231e74f32b995403a66588e6960da2b_BAT -> xe-pw-126993v1_BAT
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

  Here are the changes found in xe-pw-126993v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][1] ([Intel XE#400] / [Intel XE#616]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - bat-dg2-oem2:       [SKIP][2] ([i915#2575]) -> [PASS][3] +49 other tests pass
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * {igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:
    - bat-dg2-oem2:       [SKIP][4] ([Intel XE#941]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * {igt@xe_evict_ccs@evict-overcommit-simple}:
    - bat-dg2-oem2:       [SKIP][6] -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [SKIP][8] ([Intel XE#852]) -> [PASS][9] +140 other tests pass
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][10] ([Intel XE#859]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][12] ([i915#2575]) -> [SKIP][13] ([Intel XE#623])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][14] ([i915#2575]) -> [SKIP][15] ([Intel XE#388]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][16] ([Intel XE#852]) -> [SKIP][17] ([Intel XE#423])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][18] ([i915#2575]) -> [SKIP][19] ([i915#5274])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [SKIP][20] ([Intel XE#852]) -> [FAIL][21] ([Intel XE#608])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [SKIP][22] ([i915#2575]) -> [FAIL][23] ([Intel XE#400] / [Intel XE#616])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_compute@compute-square:
    - bat-dg2-oem2:       [SKIP][24] ([Intel XE#852]) -> [SKIP][25] ([Intel XE#672])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@xe_compute@compute-square.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@xe_compute@compute-square.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       [SKIP][26] ([Intel XE#852]) -> [SKIP][27] ([Intel XE#288]) +17 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][28] ([Intel XE#852]) -> [SKIP][29] ([Intel XE#255])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/388
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#852]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/852
  [Intel XE#859]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/859
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/941
  [Intel XE#942]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/942
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * IGT: IGT_7605 -> IGT_7607
  * Linux: xe-525-417251e59231e74f32b995403a66588e6960da2b -> xe-pw-126993v1

  IGT_7605: 7605
  IGT_7607: 9d641455f852c10c124b3a68e415847dd50b99ca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-525-417251e59231e74f32b995403a66588e6960da2b: 417251e59231e74f32b995403a66588e6960da2b
  xe-pw-126993v1: 126993v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/index.html

--===============4900273739922343844==
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
<tr><td><b>Series:</b></td><td>Introduce Local Memory Translation Table</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126993/">https://patchwork.freedesktop.org/series/126993/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-525-417251e59231e74f32b995403a66588e6960da2b_BAT -&gt; xe-pw-126993v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126993v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> +49 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/941">Intel XE#941</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-overcommit-simple}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> +140 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/859">Intel XE#859</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-525-417251e59231e74f32b995403a66588e6960da2b/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126993v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7605 -&gt; IGT_7607</li>
<li>Linux: xe-525-417251e59231e74f32b995403a66588e6960da2b -&gt; xe-pw-126993v1</li>
</ul>
<p>IGT_7605: 7605<br />
  IGT_7607: 9d641455f852c10c124b3a68e415847dd50b99ca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-525-417251e59231e74f32b995403a66588e6960da2b: 417251e59231e74f32b995403a66588e6960da2b<br />
  xe-pw-126993v1: 126993v1</p>

</body>
</html>

--===============4900273739922343844==--
