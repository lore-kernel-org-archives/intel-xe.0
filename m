Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C9CD0BB62
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 20:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AAD10E137;
	Thu, 24 Oct 2024 20:20:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB3C10E137;
 Thu, 24 Oct 2024 20:20:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0129077537275652692=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Don=27t_short_circuit_?=
 =?utf-8?q?TDR_on_jobs_not_started_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 20:20:36 -0000
Message-ID: <172980123643.1328167.15107243599167899204@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241024025323.1846299-1-matthew.brost@intel.com>
In-Reply-To: <20241024025323.1846299-1-matthew.brost@intel.com>
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

--===============0129077537275652692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Don't short circuit TDR on jobs not started (rev2)
URL   : https://patchwork.freedesktop.org/series/140410/
State : failure

== Summary ==

CI Bug Log - changes from xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e_BAT -> xe-pw-140410v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140410v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140410v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140410v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-lnl-1:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-2:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-1:          [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-adlp-7:         [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-lnl-2:          [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-dg2-oem2:       [PASS][13] -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-atsm-2:         [PASS][15] -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-adlp-vf:        [PASS][17] -> [DMESG-WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][19] -> [SKIP][20] +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][21] -> [SKIP][22] +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  
Known issues
------------

  Here are the changes found in xe-pw-140410v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][23] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][24] ([Intel XE#288]) +32 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [PASS][25] -> [SKIP][26] ([Intel XE#1192]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         NOTRUN -> [SKIP][27] ([Intel XE#1192]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
    - bat-lnl-2:          [PASS][28] -> [SKIP][29] ([Intel XE#1192]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [PASS][30] -> [SKIP][31] ([Intel XE#1192]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][32] -> [SKIP][33] ([Intel XE#1192]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
#### Possible fixes ####

  * igt@kms_psr@psr-cursor-plane-move@edp-1:
    - bat-lnl-1:          [FAIL][34] -> [PASS][35] +1 other test pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-7:         [INCOMPLETE][36] ([Intel XE#2874]) -> [SKIP][37] ([Intel XE#1192])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-adlp-7/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * Linux: xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e -> xe-pw-140410v2

  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e: 790c7308eb96861950ceddfd5a0f410cc3306c2e
  xe-pw-140410v2: 140410v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/index.html

--===============0129077537275652692==
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
<tr><td><b>Series:</b></td><td>drm/xe: Don&#x27;t short circuit TDR on jobs not started (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140410/">https://patchwork.freedesktop.org/series/140410/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e_BAT -&gt; xe-pw-140410v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140410v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140410v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140410v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140410v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_psr@psr-cursor-plane-move@edp-1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140410v2/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e -&gt; xe-pw-140410v2</li>
</ul>
<p>IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e: 790c7308eb96861950ceddfd5a0f410cc3306c2e<br />
  xe-pw-140410v2: 140410v2</p>

</body>
</html>

--===============0129077537275652692==--
