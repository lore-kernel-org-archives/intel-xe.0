Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0EEC28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 16:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A00F10E830;
	Wed,  2 Apr 2025 16:28:15 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D0110E830;
 Wed,  2 Apr 2025 16:28:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0376111239478322287=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Allow_scratch_page_under_fa?=
 =?utf-8?q?ult_mode_for_certain_platform?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Apr 2025 16:28:13 -0000
Message-ID: <174361129386.28827.17568132306759453298@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402154602.2431681-1-oak.zeng@intel.com>
In-Reply-To: <20250402154602.2431681-1-oak.zeng@intel.com>
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

--===============0376111239478322287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Allow scratch page under fault mode for certain platform
URL   : https://patchwork.freedesktop.org/series/147154/
State : failure

== Summary ==

CI Bug Log - changes from xe-2897-883e4daea46ff15b470f138ee61573513243210d_BAT -> xe-pw-147154v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147154v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147154v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147154v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2897-883e4daea46ff15b470f138ee61573513243210d/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147154v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
    - bat-atsm-2:         [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2897-883e4daea46ff15b470f138ee61573513243210d/bat-atsm-2/igt@xe_intel_bb@create-in-region.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147154v1/bat-atsm-2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@create-in-region@region-vram0:
    - bat-dg2-oem2:       [PASS][5] -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2897-883e4daea46ff15b470f138ee61573513243210d/bat-dg2-oem2/igt@xe_intel_bb@create-in-region@region-vram0.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147154v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region@region-vram0.html
    - bat-atsm-2:         [PASS][7] -> [DMESG-FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2897-883e4daea46ff15b470f138ee61573513243210d/bat-atsm-2/igt@xe_intel_bb@create-in-region@region-vram0.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147154v1/bat-atsm-2/igt@xe_intel_bb@create-in-region@region-vram0.html

  


Build changes
-------------

  * IGT: IGT_8300 -> IGT_8301
  * Linux: xe-2897-883e4daea46ff15b470f138ee61573513243210d -> xe-pw-147154v1

  IGT_8300: 00e9274442b3407b4b16f999068f3f54d87496bd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8301: 8301
  xe-2897-883e4daea46ff15b470f138ee61573513243210d: 883e4daea46ff15b470f138ee61573513243210d
  xe-pw-147154v1: 147154v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147154v1/index.html

--===============0376111239478322287==
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
<tr><td><b>Series:</b></td><td>Allow scratch page under fault mode for certain platform</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147154/">https://patchwork.freedesktop.org/series/147154/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147154v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147154v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2897-883e4daea46ff15b470f138ee61573513243210d_BAT -&gt; xe-pw-147154v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147154v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-147154v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-147154v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2897-883e4daea46ff15b470f138ee61573513243210d/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147154v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">ABORT</a> +1 other test abort</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2897-883e4daea46ff15b470f138ee61573513243210d/bat-atsm-2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147154v1/bat-atsm-2/igt@xe_intel_bb@create-in-region.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram0:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2897-883e4daea46ff15b470f138ee61573513243210d/bat-dg2-oem2/igt@xe_intel_bb@create-in-region@region-vram0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147154v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region@region-vram0.html">DMESG-FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2897-883e4daea46ff15b470f138ee61573513243210d/bat-atsm-2/igt@xe_intel_bb@create-in-region@region-vram0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147154v1/bat-atsm-2/igt@xe_intel_bb@create-in-region@region-vram0.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8300 -&gt; IGT_8301</li>
<li>Linux: xe-2897-883e4daea46ff15b470f138ee61573513243210d -&gt; xe-pw-147154v1</li>
</ul>
<p>IGT_8300: 00e9274442b3407b4b16f999068f3f54d87496bd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8301: 8301<br />
  xe-2897-883e4daea46ff15b470f138ee61573513243210d: 883e4daea46ff15b470f138ee61573513243210d<br />
  xe-pw-147154v1: 147154v1</p>

</body>
</html>

--===============0376111239478322287==--
