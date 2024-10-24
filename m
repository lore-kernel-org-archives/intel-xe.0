Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16814D0E3F3
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 19:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30A010E997;
	Thu, 24 Oct 2024 19:24:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B111010E998;
 Thu, 24 Oct 2024 19:24:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8439325765242960425=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/guc=3A_Improvements_to_Gu?=
 =?utf-8?q?C_debugfs_info_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 19:24:48 -0000
Message-ID: <172979788871.1327227.15283578345681614142@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241024002554.1983101-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241024002554.1983101-1-John.C.Harrison@Intel.com>
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

--===============8439325765242960425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Improvements to GuC debugfs info (rev2)
URL   : https://patchwork.freedesktop.org/series/140341/
State : failure

== Summary ==

CI Bug Log - changes from xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a_BAT -> xe-pw-140341v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140341v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140341v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140341v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-userptr-rebind:
    - bat-lnl-2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-rebind.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-lnl-1:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-2:          [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-1:          [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-dg2-oem2:       [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-atsm-2:         [PASS][13] -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-pvc-2:          [PASS][15] -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][17] -> [SKIP][18] +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][19] -> [SKIP][20] +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  
Known issues
------------

  Here are the changes found in xe-pw-140341v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][21] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          [PASS][22] -> [FAIL][23] ([Intel XE#2754])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][24] ([Intel XE#288]) +32 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [PASS][25] -> [SKIP][26] ([Intel XE#1192]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-1:          [PASS][27] -> [SKIP][28] ([Intel XE#1192]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          [PASS][29] -> [SKIP][30] ([Intel XE#1192]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [PASS][31] -> [SKIP][32] ([Intel XE#1192]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][33] -> [SKIP][34] ([Intel XE#1192]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][35] ([Intel XE#2229])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [INCOMPLETE][36] ([Intel XE#2874]) -> [PASS][37] +1 other test pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * Linux: xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a -> xe-pw-140341v2

  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a: d42d1d4a13007b0e53898454d5597b1a6126877a
  xe-pw-140341v2: 140341v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/index.html

--===============8439325765242960425==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Improvements to GuC debugfs info (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140341/">https://patchwork.freedesktop.org/series/140341/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a_BAT -&gt; xe-pw-140341v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140341v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140341v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140341v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-rebind:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140341v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140341v2/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a -&gt; xe-pw-140341v2</li>
</ul>
<p>IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2117-d42d1d4a13007b0e53898454d5597b1a6126877a: d42d1d4a13007b0e53898454d5597b1a6126877a<br />
  xe-pw-140341v2: 140341v2</p>

</body>
</html>

--===============8439325765242960425==--
