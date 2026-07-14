Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F32C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 12:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0E910E6AD;
	Tue, 14 Jul 2026 12:23:39 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D08510E6AD;
 Tue, 14 Jul 2026 12:23:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8244786991234499975=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_add_page_size_all?=
 =?utf-8?q?ocation_mode_control_and_coverage_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jul 2026 12:23:38 -0000
Message-ID: <178403181837.187566.14918029784741435505@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260714105538.170849-9-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260714105538.170849-9-himal.prasad.ghimiray@intel.com>
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

--===============8244786991234499975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: add page size allocation mode control and coverage (rev5)
URL   : https://patchwork.freedesktop.org/series/168905/
State : failure

== Summary ==

CI Bug Log - changes from xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366_BAT -> xe-pw-168905v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168905v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168905v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168905v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@madvise-atomic-inc:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-bmg-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-bmg-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html
    - bat-wcl-2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-wcl-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-wcl-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html
    - bat-bmg-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-bmg-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-bmg-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html
    - bat-lnl-2:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-lnl-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-lnl-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html
    - bat-bmg-vm:         [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html
    - bat-ptl-2:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-ptl-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-ptl-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html
    - bat-wcl-1:          [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-wcl-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-wcl-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html
    - bat-ptl-1:          [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-ptl-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-ptl-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html
    - bat-ptl-vm:         [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-ptl-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-ptl-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html
    - bat-lnl-1:          [PASS][19] -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-lnl-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-lnl-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - bat-bmg-3:          [PASS][21] -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  


Build changes
-------------

  * Linux: xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366 -> xe-pw-168905v5

  IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366: d3709d2bd13debee032d55c0dd71f145e11ec366
  xe-pw-168905v5: 168905v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/index.html

--===============8244786991234499975==
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
<tr><td><b>Series:</b></td><td>drm/xe: add page size allocation mode control and coverage (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168905/">https://patchwork.freedesktop.org/series/168905/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366_BAT -&gt; xe-pw-168905v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168905v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168905v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168905v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@madvise-atomic-inc:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-bmg-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-bmg-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html">ABORT</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-wcl-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-wcl-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-bmg-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-bmg-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-lnl-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-lnl-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html">ABORT</a></li>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html">ABORT</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-ptl-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-ptl-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html">ABORT</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-wcl-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-wcl-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-ptl-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-ptl-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html">ABORT</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-ptl-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-ptl-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-lnl-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-lnl-1/igt@xe_exec_system_allocator@madvise-atomic-inc.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168905v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366 -&gt; xe-pw-168905v5</li>
</ul>
<p>IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366: d3709d2bd13debee032d55c0dd71f145e11ec366<br />
  xe-pw-168905v5: 168905v5</p>

</body>
</html>

--===============8244786991234499975==--
