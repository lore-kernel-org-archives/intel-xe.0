Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA02BD10399
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 01:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505FE10E0E4;
	Fri, 25 Oct 2024 01:08:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE7D10E0E4;
 Fri, 25 Oct 2024 01:08:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1746485623916631911=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/i915/display=3A_bunch_of_str?=
 =?utf-8?q?uct_intel=5Fdisplay_conversions_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 01:08:19 -0000
Message-ID: <172981849964.1330038.16133455483045565936@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1729776384.git.jani.nikula@intel.com>
In-Reply-To: <cover.1729776384.git.jani.nikula@intel.com>
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

--===============1746485623916631911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: bunch of struct intel_display conversions (rev2)
URL   : https://patchwork.freedesktop.org/series/140323/
State : failure

== Summary ==

CI Bug Log - changes from xe-2123-526c63710d1e43d3bf56ed9260f69412533de182_BAT -> xe-pw-140323v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140323v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140323v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140323v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
    - bat-bmg-2:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - bat-pvc-2:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-bmg-1:          [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-dg2-oem2:       [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][11] -> [SKIP][12] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  
Known issues
------------

  Here are the changes found in xe-pw-140323v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][13] ([Intel XE#2229]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [PASS][14] -> [SKIP][15] ([Intel XE#1192]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-pvc-2:          NOTRUN -> [SKIP][16] ([Intel XE#2229]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-lnl-1:          NOTRUN -> [SKIP][17] ([Intel XE#2229]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [SKIP][18] ([Intel XE#455]) -> [PASS][19] +1 other test pass
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-adlp-7:         [DMESG-FAIL][20] ([Intel XE#2871]) -> [PASS][21] +1 other test pass
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - bat-bmg-2:          [DMESG-WARN][22] -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-pvc-2:          [DMESG-WARN][24] -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-lnl-1:          [DMESG-WARN][26] -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-adlp-7:         [DMESG-WARN][28] -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-bmg-1:          [DMESG-WARN][30] -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-1/igt@xe_exec_threads@threads-mixed-basic.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-1/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-dg2-oem2:       [DMESG-WARN][32] -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [SKIP][34] ([Intel XE#1192]) -> [PASS][35] +2 other tests pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
    - bat-pvc-2:          [SKIP][36] -> [PASS][37] +2 other tests pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [SKIP][38] ([Intel XE#1192]) -> [PASS][39] +2 other tests pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-adlp-7:         [SKIP][40] ([Intel XE#455]) -> [DMESG-FAIL][41] ([Intel XE#2871]) +1 other test dmesg-fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2871]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2123-526c63710d1e43d3bf56ed9260f69412533de182 -> xe-pw-140323v2

  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2123-526c63710d1e43d3bf56ed9260f69412533de182: 526c63710d1e43d3bf56ed9260f69412533de182
  xe-pw-140323v2: 140323v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/index.html

--===============1746485623916631911==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: bunch of struct intel_display conversions (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140323/">https://patchwork.freedesktop.org/series/140323/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2123-526c63710d1e43d3bf56ed9260f69412533de182_BAT -&gt; xe-pw-140323v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140323v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140323v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140323v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140323v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-1/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-1/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@psr-sprite-plane-onoff:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2123-526c63710d1e43d3bf56ed9260f69412533de182 -&gt; xe-pw-140323v2</li>
</ul>
<p>IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2123-526c63710d1e43d3bf56ed9260f69412533de182: 526c63710d1e43d3bf56ed9260f69412533de182<br />
  xe-pw-140323v2: 140323v2</p>

</body>
</html>

--===============1746485623916631911==--
