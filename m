Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF01BCD5BC0
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 06:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EEF10E400;
	Mon, 25 May 2026 06:26:44 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D2410E094;
 Mon, 25 May 2026 06:26:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2712509279481129300=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Migrate_on_fault_for_device?=
 =?utf-8?q?_pages_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: mpenttil@redhat.com
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 May 2026 06:26:44 -0000
Message-ID: <177969040408.4244.13740636341214325720@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260525050830.100254-1-mpenttil@redhat.com>
In-Reply-To: <20260525050830.100254-1-mpenttil@redhat.com>
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

--===============2712509279481129300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Migrate on fault for device pages (rev3)
URL   : https://patchwork.freedesktop.org/series/165953/
State : failure

== Summary ==

CI Bug Log - changes from xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88_BAT -> xe-pw-165953v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165953v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165953v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165953v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@twice-virtual-userptr:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-bmg-2/igt@xe_exec_balancer@twice-virtual-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-bmg-2/igt@xe_exec_balancer@twice-virtual-userptr.html
    - bat-bmg-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr.html
    - bat-bmg-vm:         [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-bmg-vm/igt@xe_exec_balancer@twice-virtual-userptr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-bmg-vm/igt@xe_exec_balancer@twice-virtual-userptr.html
    - bat-atsm-2:         [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - bat-bmg-3:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-bmg-3/igt@xe_exec_basic@multigpu-once-userptr.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-bmg-3/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_basic@twice-userptr:
    - bat-adlp-7:         [PASS][11] -> [ABORT][12] +1 other test abort
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-adlp-7/igt@xe_exec_basic@twice-userptr.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-adlp-7/igt@xe_exec_basic@twice-userptr.html
    - bat-lnl-2:          [PASS][13] -> [ABORT][14] +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-lnl-2/igt@xe_exec_basic@twice-userptr.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-lnl-2/igt@xe_exec_basic@twice-userptr.html
    - bat-ptl-2:          [PASS][15] -> [ABORT][16] +1 other test abort
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-ptl-2/igt@xe_exec_basic@twice-userptr.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-ptl-2/igt@xe_exec_basic@twice-userptr.html

  * igt@xe_exec_basic@twice-userptr@rcs0:
    - bat-wcl-1:          [PASS][17] -> [ABORT][18] +1 other test abort
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-wcl-1/igt@xe_exec_basic@twice-userptr@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-wcl-1/igt@xe_exec_basic@twice-userptr@rcs0.html
    - bat-ptl-1:          [PASS][19] -> [ABORT][20] +1 other test abort
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-ptl-1/igt@xe_exec_basic@twice-userptr@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-ptl-1/igt@xe_exec_basic@twice-userptr@rcs0.html
    - bat-ptl-vm:         [PASS][21] -> [ABORT][22] +1 other test abort
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-ptl-vm/igt@xe_exec_basic@twice-userptr@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-ptl-vm/igt@xe_exec_basic@twice-userptr@rcs0.html
    - bat-lnl-1:          [PASS][23] -> [ABORT][24] +1 other test abort
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-lnl-1/igt@xe_exec_basic@twice-userptr@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-lnl-1/igt@xe_exec_basic@twice-userptr@rcs0.html
    - bat-wcl-2:          [PASS][25] -> [ABORT][26] +1 other test abort
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-wcl-2/igt@xe_exec_basic@twice-userptr@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-wcl-2/igt@xe_exec_basic@twice-userptr@rcs0.html

  


Build changes
-------------

  * Linux: xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88 -> xe-pw-165953v3

  IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88: 7ce39e849680d6c0bf2795bbb4d986ecd1649d88
  xe-pw-165953v3: 165953v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/index.html

--===============2712509279481129300==
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
<tr><td><b>Series:</b></td><td>Migrate on fault for device pages (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165953/">https://patchwork.freedesktop.org/series/165953/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88_BAT -&gt; xe-pw-165953v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165953v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165953v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165953v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-bmg-2/igt@xe_exec_balancer@twice-virtual-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-bmg-2/igt@xe_exec_balancer@twice-virtual-userptr.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr.html">ABORT</a></li>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-bmg-vm/igt@xe_exec_balancer@twice-virtual-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-bmg-vm/igt@xe_exec_balancer@twice-virtual-userptr.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-atsm-2/igt@xe_exec_balancer@twice-virtual-userptr.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-bmg-3/igt@xe_exec_basic@multigpu-once-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-bmg-3/igt@xe_exec_basic@multigpu-once-userptr.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-adlp-7/igt@xe_exec_basic@twice-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-adlp-7/igt@xe_exec_basic@twice-userptr.html">ABORT</a> +1 other test abort</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-lnl-2/igt@xe_exec_basic@twice-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-lnl-2/igt@xe_exec_basic@twice-userptr.html">ABORT</a> +1 other test abort</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-ptl-2/igt@xe_exec_basic@twice-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-ptl-2/igt@xe_exec_basic@twice-userptr.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr@rcs0:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-wcl-1/igt@xe_exec_basic@twice-userptr@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-wcl-1/igt@xe_exec_basic@twice-userptr@rcs0.html">ABORT</a> +1 other test abort</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-ptl-1/igt@xe_exec_basic@twice-userptr@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-ptl-1/igt@xe_exec_basic@twice-userptr@rcs0.html">ABORT</a> +1 other test abort</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-ptl-vm/igt@xe_exec_basic@twice-userptr@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-ptl-vm/igt@xe_exec_basic@twice-userptr@rcs0.html">ABORT</a> +1 other test abort</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-lnl-1/igt@xe_exec_basic@twice-userptr@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-lnl-1/igt@xe_exec_basic@twice-userptr@rcs0.html">ABORT</a> +1 other test abort</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88/bat-wcl-2/igt@xe_exec_basic@twice-userptr@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v3/bat-wcl-2/igt@xe_exec_basic@twice-userptr@rcs0.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88 -&gt; xe-pw-165953v3</li>
</ul>
<p>IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88: 7ce39e849680d6c0bf2795bbb4d986ecd1649d88<br />
  xe-pw-165953v3: 165953v3</p>

</body>
</html>

--===============2712509279481129300==--
