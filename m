Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA74BD1118D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 00:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FEF10E716;
	Thu, 27 Nov 2025 00:54:26 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A3E10E716;
 Thu, 27 Nov 2025 00:54:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7259234456020730423=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Page_Reclamation_Support_fo?=
 =?utf-8?q?r_Xe3p_Platforms_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Nguyen" <brian3.nguyen@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Nov 2025 00:54:25 -0000
Message-ID: <176420486592.32692.10805625807355675578@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
In-Reply-To: <20251126230201.3782788-13-brian3.nguyen@intel.com>
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

--===============7259234456020730423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Page Reclamation Support for Xe3p Platforms (rev2)
URL   : https://patchwork.freedesktop.org/series/157698/
State : failure

== Summary ==

CI Bug Log - changes from xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884_BAT -> xe-pw-157698v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157698v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157698v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157698v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-bmg-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-bmg-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-bmg-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-bmg-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-bmg-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-dg2-oem2:       [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-atsm-2:         [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_pat@pat-index-xe2:
    - bat-ptl-2:          [PASS][9] -> [ABORT][10] +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-ptl-2/igt@xe_pat@pat-index-xe2.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-ptl-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xe2@blt:
    - bat-ptl-1:          [PASS][11] -> [ABORT][12] +1 other test abort
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-ptl-1/igt@xe_pat@pat-index-xe2@blt.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-ptl-1/igt@xe_pat@pat-index-xe2@blt.html
    - bat-ptl-vm:         [PASS][13] -> [ABORT][14] +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-ptl-vm/igt@xe_pat@pat-index-xe2@blt.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-ptl-vm/igt@xe_pat@pat-index-xe2@blt.html
    - bat-lnl-1:          [PASS][15] -> [ABORT][16] +1 other test abort
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-lnl-1/igt@xe_pat@pat-index-xe2@blt.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-lnl-1/igt@xe_pat@pat-index-xe2@blt.html
    - bat-lnl-2:          [PASS][17] -> [ABORT][18] +1 other test abort
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-lnl-2/igt@xe_pat@pat-index-xe2@blt.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-lnl-2/igt@xe_pat@pat-index-xe2@blt.html

  * igt@xe_pat@pat-index-xe2@render:
    - bat-ptl-1:          [PASS][19] -> [INCOMPLETE][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-ptl-1/igt@xe_pat@pat-index-xe2@render.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-ptl-1/igt@xe_pat@pat-index-xe2@render.html
    - bat-ptl-vm:         [PASS][21] -> [INCOMPLETE][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html
    - bat-lnl-1:          [PASS][23] -> [INCOMPLETE][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-lnl-1/igt@xe_pat@pat-index-xe2@render.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-lnl-1/igt@xe_pat@pat-index-xe2@render.html
    - bat-lnl-2:          [PASS][25] -> [INCOMPLETE][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-lnl-2/igt@xe_pat@pat-index-xe2@render.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-lnl-2/igt@xe_pat@pat-index-xe2@render.html

  * igt@xe_pat@pat-index-xelp:
    - bat-adlp-7:         [PASS][27] -> [ABORT][28] +1 other test abort
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-adlp-7/igt@xe_pat@pat-index-xelp.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-adlp-7/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelp@blt:
    - bat-adlp-vm:        [PASS][29] -> [ABORT][30] +1 other test abort
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-adlp-vm/igt@xe_pat@pat-index-xelp@blt.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-adlp-vm/igt@xe_pat@pat-index-xelp@blt.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-7:         [PASS][31] -> [INCOMPLETE][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-adlp-7/igt@xe_pat@pat-index-xelp@render.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-adlp-7/igt@xe_pat@pat-index-xelp@render.html
    - bat-adlp-vm:        [PASS][33] -> [INCOMPLETE][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-adlp-vm/igt@xe_pat@pat-index-xelp@render.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-adlp-vm/igt@xe_pat@pat-index-xelp@render.html

  * igt@xe_peer2peer@read:
    - bat-bmg-3:          [PASS][35] -> [ABORT][36] +1 other test abort
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-bmg-3/igt@xe_peer2peer@read.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-bmg-3/igt@xe_peer2peer@read.html

  


Build changes
-------------

  * Linux: xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884 -> xe-pw-157698v2

  IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884: e7a767430515c3a6e8aee91c2a68cba8b06fe884
  xe-pw-157698v2: 157698v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/index.html

--===============7259234456020730423==
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
<tr><td><b>Series:</b></td><td>Page Reclamation Support for Xe3p Platforms (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157698/">https://patchwork.freedesktop.org/series/157698/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884_BAT -&gt; xe-pw-157698v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157698v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-157698v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-157698v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-bmg-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-bmg-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-bmg-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-bmg-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">ABORT</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-ptl-2/igt@xe_pat@pat-index-xe2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-ptl-2/igt@xe_pat@pat-index-xe2.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@blt:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-ptl-1/igt@xe_pat@pat-index-xe2@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-ptl-1/igt@xe_pat@pat-index-xe2@blt.html">ABORT</a> +1 other test abort</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-ptl-vm/igt@xe_pat@pat-index-xe2@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-ptl-vm/igt@xe_pat@pat-index-xe2@blt.html">ABORT</a> +1 other test abort</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-lnl-1/igt@xe_pat@pat-index-xe2@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-lnl-1/igt@xe_pat@pat-index-xe2@blt.html">ABORT</a> +1 other test abort</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-lnl-2/igt@xe_pat@pat-index-xe2@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-lnl-2/igt@xe_pat@pat-index-xe2@blt.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@render:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-ptl-1/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-ptl-1/igt@xe_pat@pat-index-xe2@render.html">INCOMPLETE</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">INCOMPLETE</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-lnl-1/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-lnl-1/igt@xe_pat@pat-index-xe2@render.html">INCOMPLETE</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-lnl-2/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-lnl-2/igt@xe_pat@pat-index-xe2@render.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-adlp-7/igt@xe_pat@pat-index-xelp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-adlp-7/igt@xe_pat@pat-index-xelp.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@blt:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-adlp-vm/igt@xe_pat@pat-index-xelp@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-adlp-vm/igt@xe_pat@pat-index-xelp@blt.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-adlp-7/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-adlp-7/igt@xe_pat@pat-index-xelp@render.html">INCOMPLETE</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-adlp-vm/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-adlp-vm/igt@xe_pat@pat-index-xelp@render.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884/bat-bmg-3/igt@xe_peer2peer@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157698v2/bat-bmg-3/igt@xe_peer2peer@read.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884 -&gt; xe-pw-157698v2</li>
</ul>
<p>IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4156-e7a767430515c3a6e8aee91c2a68cba8b06fe884: e7a767430515c3a6e8aee91c2a68cba8b06fe884<br />
  xe-pw-157698v2: 157698v2</p>

</body>
</html>

--===============7259234456020730423==--
