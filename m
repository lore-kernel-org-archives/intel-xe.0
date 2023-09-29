Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC09E743FE
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 09:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423C910E0F6;
	Fri, 29 Sep 2023 09:16:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1684810E0F4;
 Fri, 29 Sep 2023 09:16:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 11B16A00E6;
 Fri, 29 Sep 2023 09:16:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2268096270663459585=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Fri, 29 Sep 2023 09:16:42 -0000
Message-ID: <169597900206.19497.10215986972432546636@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230929062420.394375-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230929062420.394375-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A?=
 =?utf-8?q?_Count_and_report_low_level_driver_errors_=28rev6=29?=
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

--===============2268096270663459585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Count and report low level driver errors (rev6)
URL   : https://patchwork.freedesktop.org/series/124026/
State : failure

== Summary ==

CI Bug Log - changes from xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64_BAT -> xe-pw-124026v6_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-124026v6_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-124026v6_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-124026v6_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-atsm-2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-atsm-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-124026v6_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-pvc-2:          [PASS][3] -> [SKIP][4] ([Intel XE#678]) +135 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@bo:
    - bat-pvc-2:          [PASS][5] -> [SKIP][6] ([Intel XE#725]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_live_ktest@bo.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_live_ktest@bo.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][7] -> [INCOMPLETE][8] ([Intel XE#597] / [Intel XE#714])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-dg2-oem2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][9] -> [INCOMPLETE][10] ([Intel XE#597])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-adlp-7/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-adlp-7/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          [SKIP][11] ([Intel XE#538]) -> [SKIP][12] ([Intel XE#678]) +33 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-pvc-2:          [SKIP][13] ([Intel XE#539]) -> [SKIP][14] ([Intel XE#678]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-pvc-2:          [SKIP][15] ([Intel XE#275] / [Intel XE#541]) -> [SKIP][16] ([Intel XE#678]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          [SKIP][17] ([Intel XE#540]) -> [SKIP][18] ([Intel XE#678]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-pvc-2:          [SKIP][19] ([Intel XE#537]) -> [SKIP][20] ([Intel XE#678]) +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          [SKIP][21] ([Intel XE#536]) -> [SKIP][22] ([Intel XE#678])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@kms_prop_blob@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@primary_page_flip:
    - bat-pvc-2:          [SKIP][23] ([Intel XE#535]) -> [SKIP][24] ([Intel XE#678]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@kms_psr@primary_page_flip.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@kms_psr@primary_page_flip.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][25] ([Intel XE#389]) -> [SKIP][26] ([Intel XE#678]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][27] ([Intel XE#482]) -> [SKIP][28] ([Intel XE#678]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_guc_pc@freq_range_idle:
    - bat-pvc-2:          [SKIP][29] ([Intel XE#533]) -> [SKIP][30] ([Intel XE#678]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          [SKIP][31] ([Intel XE#255]) -> [SKIP][32] ([Intel XE#678])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          [SKIP][33] ([Intel XE#532]) -> [SKIP][34] ([Intel XE#678])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_intel_bb@render.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          [SKIP][35] ([Intel XE#531]) -> [SKIP][36] ([Intel XE#678])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#275]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/275
  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/533
  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
  [Intel XE#536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/536
  [Intel XE#537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/537
  [Intel XE#538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/538
  [Intel XE#539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/539
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
  [Intel XE#597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/597
  [Intel XE#678]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/678
  [Intel XE#714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/714
  [Intel XE#725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/725


Build changes
-------------

  * Linux: xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64 -> xe-pw-124026v6

  IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64: 9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64
  xe-pw-124026v6: 124026v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/index.html

--===============2268096270663459585==
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
<tr><td><b>Series:</b></td><td>drm/xe: Count and report low level driver errors (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124026/">https://patchwork.freedesktop.org/series/124026/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64_BAT -&gt; xe-pw-124026v6_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-124026v6_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-124026v6_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-124026v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-atsm-2/igt@xe_module_load@load.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124026v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) +135 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/725">Intel XE#725</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-dg2-oem2/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/597">Intel XE#597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/714">Intel XE#714</a>)</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-adlp-7/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/597">Intel XE#597</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/538">Intel XE#538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/539">Intel XE#539</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/275">Intel XE#275</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/541">Intel XE#541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/537">Intel XE#537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/536">Intel XE#536</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_range_idle:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/533">Intel XE#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124026v6/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64 -&gt; xe-pw-124026v6</li>
</ul>
<p>IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-402-9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64: 9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64<br />
  xe-pw-124026v6: 124026v6</p>

</body>
</html>

--===============2268096270663459585==--
