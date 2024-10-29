Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2995D2AB0A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 09:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C3310E5F7;
	Tue, 29 Oct 2024 09:43:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7187910E5F4;
 Tue, 29 Oct 2024 09:43:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3788897397787522086=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/i915/hdcp=3A_Add_the_loop_on?=
 =?utf-8?q?ly_for_DP_encoders?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 09:43:27 -0000
Message-ID: <173019500745.1358125.16918893680648699532@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029085304.219168-1-suraj.kandpal@intel.com>
In-Reply-To: <20241029085304.219168-1-suraj.kandpal@intel.com>
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

--===============3788897397787522086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/hdcp: Add the loop only for DP encoders
URL   : https://patchwork.freedesktop.org/series/140632/
State : failure

== Summary ==

CI Bug Log - changes from xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154_BAT -> xe-pw-140632v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140632v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140632v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140632v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][3] -> [DMESG-WARN][4] +6 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-dg2-oem2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-atsm-2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-atsm-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-140632v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][7] ([Intel XE#288]) +32 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          [PASS][8] -> [SKIP][9] ([Intel XE#1192]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][10] ([Intel XE#2229]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-lnl-2:          NOTRUN -> [SKIP][11] ([Intel XE#2229]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         NOTRUN -> [INCOMPLETE][12] ([Intel XE#2874])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][13] ([Intel XE#1192]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][14] -> [SKIP][15] ([Intel XE#1192]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][16] ([Intel XE#2229]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - bat-lnl-1:          [DMESG-WARN][17] ([Intel XE#3230]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
    - bat-pvc-2:          [DMESG-WARN][19] ([Intel XE#3230]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
    - bat-bmg-2:          [DMESG-WARN][21] ([Intel XE#3230]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
    - bat-bmg-1:          [DMESG-WARN][23] ([Intel XE#3230]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-bmg-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-adlp-vf:        [DMESG-WARN][25] ([Intel XE#3230]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-adlp-7:         [DMESG-WARN][27] ([Intel XE#3230]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-lnl-2:          [DMESG-WARN][29] ([Intel XE#3230]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-atsm-2:         [DMESG-WARN][31] ([Intel XE#3230]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][33] ([Intel XE#1192]) -> [PASS][34] +2 other tests pass
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          [SKIP][35] ([Intel XE#1192]) -> [PASS][36] +2 other tests pass
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-7:         [SKIP][37] ([Intel XE#1192]) -> [INCOMPLETE][38] ([Intel XE#2874])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
    - bat-dg2-oem2:       [INCOMPLETE][39] ([Intel XE#2874]) -> [SKIP][40] ([Intel XE#1192])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230


Build changes
-------------

  * Linux: xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154 -> xe-pw-140632v1

  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154: 24707cf2a7c47d4cd192c97e73d58aa4011de154
  xe-pw-140632v1: 140632v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/index.html

--===============3788897397787522086==
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
<tr><td><b>Series:</b></td><td>drm/i915/hdcp: Add the loop only for DP encoders</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140632/">https://patchwork.freedesktop.org/series/140632/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154_BAT -&gt; xe-pw-140632v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140632v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140632v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140632v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-dg2-oem2/igt@xe_module_load@load.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-atsm-2/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140632v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-bmg-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140632v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154 -&gt; xe-pw-140632v1</li>
</ul>
<p>IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154: 24707cf2a7c47d4cd192c97e73d58aa4011de154<br />
  xe-pw-140632v1: 140632v1</p>

</body>
</html>

--===============3788897397787522086==--
