Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98302C35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 09:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5833E10E52C;
	Tue, 25 Mar 2025 09:37:23 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2563110E2CD;
 Tue, 25 Mar 2025 09:37:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0986440018313777565=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/xe=3A_Remove_extra_spaces_in_xe=5Fvm=2Ec_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Mar 2025 09:37:22 -0000
Message-ID: <174289544214.218.14501066439435038545@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250320211519.632432-1-dev@lankhorst.se>
In-Reply-To: <20250320211519.632432-1-dev@lankhorst.se>
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

--===============0986440018313777565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Remove extra spaces in xe_vm.c (rev2)
URL   : https://patchwork.freedesktop.org/series/146562/
State : failure

== Summary ==

CI Bug Log - changes from xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056_BAT -> xe-pw-146562v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-146562v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-146562v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-146562v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pat@prime-external-import-coh:
    - bat-bmg-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-bmg-2/igt@xe_pat@prime-external-import-coh.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-bmg-2/igt@xe_pat@prime-external-import-coh.html
    - bat-bmg-1:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-bmg-1/igt@xe_pat@prime-external-import-coh.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-bmg-1/igt@xe_pat@prime-external-import-coh.html
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html
    - bat-atsm-2:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html
    - bat-pvc-2:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html

  


Build changes
-------------

  * IGT: IGT_8281 -> IGT_8282
  * Linux: xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056 -> xe-pw-146562v2

  IGT_8281: 18c445bea641c03b637d7ed5bc3bd120b5d83b2a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8282: a7043acec01b578377fadd008c13f2d52ef6c8e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056: 9a42bdcde0f77b2c1e947e283cc3b267b1ce2056
  xe-pw-146562v2: 146562v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/index.html

--===============0986440018313777565==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Remove extra spaces in xe_vm.c (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146562/">https://patchwork.freedesktop.org/series/146562/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056_BAT -&gt; xe-pw-146562v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-146562v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-146562v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-146562v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pat@prime-external-import-coh:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-bmg-2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-bmg-2/igt@xe_pat@prime-external-import-coh.html">FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-bmg-1/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-bmg-1/igt@xe_pat@prime-external-import-coh.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html">FAIL</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8281 -&gt; IGT_8282</li>
<li>Linux: xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056 -&gt; xe-pw-146562v2</li>
</ul>
<p>IGT_8281: 18c445bea641c03b637d7ed5bc3bd120b5d83b2a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8282: a7043acec01b578377fadd008c13f2d52ef6c8e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056: 9a42bdcde0f77b2c1e947e283cc3b267b1ce2056<br />
  xe-pw-146562v2: 146562v2</p>

</body>
</html>

--===============0986440018313777565==--
