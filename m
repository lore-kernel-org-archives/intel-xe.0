Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69277CE8E78
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 13:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3473A10E949;
	Thu, 24 Oct 2024 13:57:26 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE1C10E284;
 Thu, 24 Oct 2024 13:57:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5786014365944279624=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/i915/xe3lpd=3A_ptl_display_p?=
 =?utf-8?q?atches_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 13:57:25 -0000
Message-ID: <172977824557.1327763.12488772773490687751@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023214701.963830-1-clinton.a.taylor@intel.com>
In-Reply-To: <20241023214701.963830-1-clinton.a.taylor@intel.com>
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

--===============5786014365944279624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/xe3lpd: ptl display patches (rev2)
URL   : https://patchwork.freedesktop.org/series/140195/
State : failure

== Summary ==

CI Bug Log - changes from xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553_BAT -> xe-pw-140195v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140195v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140195v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140195v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-lnl-1:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-2:          [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-1:          [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-atsm-2:         [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-dg2-oem2:       [PASS][13] -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][15] -> [SKIP][16] +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][17] -> [SKIP][18] +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  
Known issues
------------

  Here are the changes found in xe-pw-140195v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [PASS][19] -> [SKIP][20] ([Intel XE#1192]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-1:          [PASS][21] -> [SKIP][22] ([Intel XE#1192]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [PASS][23] -> [INCOMPLETE][24] ([Intel XE#2874]) +1 other test incomplete
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-atsm-2:         [PASS][25] -> [SKIP][26] ([Intel XE#1192]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][27] ([Intel XE#1861]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874


Build changes
-------------

  * Linux: xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553 -> xe-pw-140195v2

  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553: 26b9d5af7030484e831dd7335a08ec0c3a22f553
  xe-pw-140195v2: 140195v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/index.html

--===============5786014365944279624==
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
<tr><td><b>Series:</b></td><td>drm/i915/xe3lpd: ptl display patches (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140195/">https://patchwork.freedesktop.org/series/140195/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553_BAT -&gt; xe-pw-140195v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140195v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140195v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140195v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140195v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553 -&gt; xe-pw-140195v2</li>
</ul>
<p>IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2112-26b9d5af7030484e831dd7335a08ec0c3a22f553: 26b9d5af7030484e831dd7335a08ec0c3a22f553<br />
  xe-pw-140195v2: 140195v2</p>

</body>
</html>

--===============5786014365944279624==--
