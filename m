Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928E1C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 09:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D0C10E427;
	Tue, 31 Oct 2023 09:09:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4C6F10E427;
 Tue, 31 Oct 2023 09:09:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ADA24A0169;
 Tue, 31 Oct 2023 09:09:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2296033003397286102=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 31 Oct 2023 09:09:01 -0000
Message-ID: <169874334168.27659.13936256083538020080@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231030161016.54300-5-matthew.auld@intel.com>
In-Reply-To: <20231030161016.54300-5-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Some_evic?=
 =?utf-8?q?tion_fixes_=28rev4=29?=
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

--===============2296033003397286102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Some eviction fixes (rev4)
URL   : https://patchwork.freedesktop.org/series/125591/
State : success

== Summary ==

CI Bug Log - changes from xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050_BAT -> xe-pw-125591v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  Additional (1): bat-atsm-2 
  Missing    (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in xe-pw-125591v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([i915#6077]) +33 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-atsm-2:         NOTRUN -> [SKIP][2] ([Intel XE#782]) +5 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][3] ([Intel XE#784])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-atsm-2:         NOTRUN -> [SKIP][4] ([Intel XE#541]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-atsm-2:         NOTRUN -> [SKIP][5] ([Intel XE#540]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][6] ([Intel XE#783])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][7] ([Intel XE#400] / [Intel XE#616]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-atsm-2:         NOTRUN -> [SKIP][8] ([i915#1836]) +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][9] ([Intel XE#780])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@cursor_plane_move:
    - bat-atsm-2:         NOTRUN -> [SKIP][10] ([Intel XE#535]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_psr@cursor_plane_move.html

  * igt@xe_compute@compute-square:
    - bat-atsm-2:         NOTRUN -> [SKIP][11] ([Intel XE#672])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@xe_compute@compute-square.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][12] ([Intel XE#288]) +17 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][13] ([Intel XE#288]) +17 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_huc_copy@huc_copy:
    - bat-atsm-2:         NOTRUN -> [SKIP][14] ([Intel XE#255])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [SKIP][15] ([i915#1155]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - bat-dg2-oem2:       [SKIP][17] ([i915#2575]) -> [PASS][18] +49 other tests pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [SKIP][19] ([Intel XE#852]) -> [PASS][20] +142 other tests pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_live_ktest@migrate:
    - bat-dg2-oem2:       [INCOMPLETE][21] ([i915#1155]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@xe_live_ktest@migrate.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@xe_live_ktest@migrate.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][23] ([i915#1155]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][25] ([i915#2575]) -> [SKIP][26] ([Intel XE#623])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][27] ([i915#2575]) -> [SKIP][28] ([Intel XE#624])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [SKIP][29] ([i915#2575]) -> [FAIL][30] ([Intel XE#609]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][31] ([Intel XE#852]) -> [SKIP][32] ([Intel XE#423])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][33] ([i915#2575]) -> [SKIP][34] ([i915#5274])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [SKIP][35] ([Intel XE#852]) -> [FAIL][36] ([Intel XE#608])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [SKIP][37] ([i915#2575]) -> [FAIL][38] ([Intel XE#400] / [Intel XE#616])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg2-oem2:       [SKIP][39] ([Intel XE#852]) -> [SKIP][40] ([Intel XE#535]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  * igt@xe_compute@compute-square:
    - bat-dg2-oem2:       [SKIP][41] ([Intel XE#852]) -> [SKIP][42] ([Intel XE#672])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@xe_compute@compute-square.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@xe_compute@compute-square.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][43] ([Intel XE#852]) -> [SKIP][44] ([Intel XE#255])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#852]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/852
  [Intel XE#854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/854
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * Linux: xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050 -> xe-pw-125591v4

  IGT_7566: 7566
  xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050: 1e652bcf7cc139244f4f8c0cd1fc184029240050
  xe-pw-125591v4: 125591v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/index.html

--===============2296033003397286102==
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
<tr><td><b>Series:</b></td><td>Some eviction fixes (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125591/">https://patchwork.freedesktop.org/series/125591/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050_BAT -&gt; xe-pw-125591v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>Additional (1): bat-atsm-2 <br />
  Missing    (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-125591v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/541">Intel XE#541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> +49 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> +142 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@xe_live_ktest@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@xe_live_ktest@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125591v4/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050 -&gt; xe-pw-125591v4</li>
</ul>
<p>IGT_7566: 7566<br />
  xe-457-1e652bcf7cc139244f4f8c0cd1fc184029240050: 1e652bcf7cc139244f4f8c0cd1fc184029240050<br />
  xe-pw-125591v4: 125591v4</p>

</body>
</html>

--===============2296033003397286102==--
