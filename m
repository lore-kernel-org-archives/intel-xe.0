Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EF8CD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 20:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332481123A6;
	Wed,  3 Jun 2026 20:53:02 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4801011239F;
 Wed,  3 Jun 2026 20:53:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5229416378728181692=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Allow_pushing_mor?=
 =?utf-8?q?e_jobs_into_LRC=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Jun 2026 20:53:01 -0000
Message-ID: <178051998128.41466.14879068106457399560@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260603192239.257733-1-dev@lankhorst.se>
In-Reply-To: <20260603192239.257733-1-dev@lankhorst.se>
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

--===============5229416378728181692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Allow pushing more jobs into LRC. (rev2)
URL   : https://patchwork.freedesktop.org/series/167764/
State : failure

== Summary ==

CI Bug Log - changes from xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d_BAT -> xe-pw-167764v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-167764v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-167764v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-167764v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute@compute-square:
    - bat-ptl-1:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-ptl-1/igt@xe_compute@compute-square.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-ptl-1/igt@xe_compute@compute-square.html
    - bat-ptl-vm:         [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-ptl-vm/igt@xe_compute@compute-square.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-ptl-vm/igt@xe_compute@compute-square.html
    - bat-lnl-1:          [PASS][5] -> [TIMEOUT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-lnl-1/igt@xe_compute@compute-square.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-lnl-1/igt@xe_compute@compute-square.html
    - bat-bmg-vm:         [PASS][7] -> [TIMEOUT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-bmg-vm/igt@xe_compute@compute-square.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-bmg-vm/igt@xe_compute@compute-square.html
    - bat-bmg-2:          [PASS][9] -> [TIMEOUT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-bmg-2/igt@xe_compute@compute-square.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-bmg-2/igt@xe_compute@compute-square.html
    - bat-adlp-7:         [PASS][11] -> [TIMEOUT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-adlp-7/igt@xe_compute@compute-square.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-adlp-7/igt@xe_compute@compute-square.html
    - bat-ptl-2:          [PASS][13] -> [TIMEOUT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-ptl-2/igt@xe_compute@compute-square.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-ptl-2/igt@xe_compute@compute-square.html
    - bat-atsm-2:         [PASS][15] -> [TIMEOUT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-atsm-2/igt@xe_compute@compute-square.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-atsm-2/igt@xe_compute@compute-square.html
    - bat-wcl-2:          [PASS][17] -> [TIMEOUT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-wcl-2/igt@xe_compute@compute-square.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-wcl-2/igt@xe_compute@compute-square.html
    - bat-bmg-1:          [PASS][19] -> [TIMEOUT][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-bmg-1/igt@xe_compute@compute-square.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-bmg-1/igt@xe_compute@compute-square.html
    - bat-lnl-2:          [PASS][21] -> [TIMEOUT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-lnl-2/igt@xe_compute@compute-square.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-lnl-2/igt@xe_compute@compute-square.html
    - bat-wcl-1:          [PASS][23] -> [TIMEOUT][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-wcl-1/igt@xe_compute@compute-square.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-wcl-1/igt@xe_compute@compute-square.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-rebind:
    - bat-atsm-2:         [PASS][25] -> [FAIL][26] +24 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-bmg-vm:         [PASS][27] -> [FAIL][28] +57 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-bmg-vm/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-bmg-vm/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-ptl-2:          [PASS][29] -> [FAIL][30] +48 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-ptl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-ptl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
    - bat-wcl-1:          [PASS][31] -> [FAIL][32] +48 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-wcl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-wcl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-ptl-1:          [PASS][33] -> [FAIL][34] +48 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-ptl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-ptl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
    - bat-ptl-vm:         [PASS][35] -> [FAIL][36] +48 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-ptl-vm/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-ptl-vm/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
    - bat-wcl-2:          [PASS][37] -> [FAIL][38] +48 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - bat-lnl-1:          [PASS][39] -> [FAIL][40] +48 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:
    - bat-bmg-1:          [PASS][41] -> [FAIL][42] +57 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-imm:
    - bat-bmg-2:          [PASS][43] -> [FAIL][44] +57 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-bmg-2/igt@xe_exec_fault_mode@twice-userptr-imm.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-bmg-2/igt@xe_exec_fault_mode@twice-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-lnl-2:          [PASS][45] -> [FAIL][46] +48 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-adlp-7:         [PASS][47] -> [FAIL][48] +15 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - bat-bmg-3:          [PASS][49] -> [FAIL][50] +20 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html

  


Build changes
-------------

  * Linux: xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d -> xe-pw-167764v2

  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d: b49dd7b6567b6e747e49235da3bf81813baf531d
  xe-pw-167764v2: 167764v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/index.html

--===============5229416378728181692==
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
<tr><td><b>Series:</b></td><td>drm/xe: Allow pushing more jobs into LRC. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167764/">https://patchwork.freedesktop.org/series/167764/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d_BAT -&gt; xe-pw-167764v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-167764v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-167764v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-167764v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-ptl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-ptl-1/igt@xe_compute@compute-square.html">TIMEOUT</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-ptl-vm/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-ptl-vm/igt@xe_compute@compute-square.html">TIMEOUT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-lnl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-lnl-1/igt@xe_compute@compute-square.html">TIMEOUT</a></li>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-bmg-vm/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-bmg-vm/igt@xe_compute@compute-square.html">TIMEOUT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-bmg-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-bmg-2/igt@xe_compute@compute-square.html">TIMEOUT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-adlp-7/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-adlp-7/igt@xe_compute@compute-square.html">TIMEOUT</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-ptl-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-ptl-2/igt@xe_compute@compute-square.html">TIMEOUT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-atsm-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-atsm-2/igt@xe_compute@compute-square.html">TIMEOUT</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-wcl-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-wcl-2/igt@xe_compute@compute-square.html">TIMEOUT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-bmg-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-bmg-1/igt@xe_compute@compute-square.html">TIMEOUT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-lnl-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-lnl-2/igt@xe_compute@compute-square.html">TIMEOUT</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-wcl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-wcl-1/igt@xe_compute@compute-square.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-rebind:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html">FAIL</a> +24 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-bmg-vm/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-bmg-vm/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">FAIL</a> +57 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-ptl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-ptl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">FAIL</a> +48 other tests fail</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-wcl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-wcl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">FAIL</a> +48 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-ptl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-ptl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +48 other tests fail</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-ptl-vm/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-ptl-vm/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +48 other tests fail</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +48 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">FAIL</a> +48 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">FAIL</a> +57 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-imm:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-bmg-2/igt@xe_exec_fault_mode@twice-userptr-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-bmg-2/igt@xe_exec_fault_mode@twice-userptr-imm.html">FAIL</a> +57 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +48 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d -&gt; xe-pw-167764v2</li>
</ul>
<p>IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5194-b49dd7b6567b6e747e49235da3bf81813baf531d: b49dd7b6567b6e747e49235da3bf81813baf531d<br />
  xe-pw-167764v2: 167764v2</p>

</body>
</html>

--===============5229416378728181692==--
