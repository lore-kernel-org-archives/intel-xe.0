Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8977EC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 20:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5025210E849;
	Fri, 16 Aug 2024 20:11:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235B510E840;
 Fri, 16 Aug 2024 20:11:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4021041447869763429=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Add_PXP_HWDRM_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 20:11:04 -0000
Message-ID: <172383906413.659138.15214258128536112169@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
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

--===============4021041447869763429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add PXP HWDRM support (rev2)
URL   : https://patchwork.freedesktop.org/series/136052/
State : failure

== Summary ==

CI Bug Log - changes from xe-1785-479cde039b423852ee120f3832ca74ea45b646fd_BAT -> xe-pw-136052v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136052v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136052v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136052v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_create@create-invalid-mbz:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-atsm-2/igt@xe_create@create-invalid-mbz.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-atsm-2/igt@xe_create@create-invalid-mbz.html
    - bat-adlp-vf:        [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-adlp-vf/igt@xe_create@create-invalid-mbz.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-adlp-vf/igt@xe_create@create-invalid-mbz.html
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-adlp-7/igt@xe_create@create-invalid-mbz.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-adlp-7/igt@xe_create@create-invalid-mbz.html
    - bat-bmg-1:          [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-bmg-1/igt@xe_create@create-invalid-mbz.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-bmg-1/igt@xe_create@create-invalid-mbz.html
    - bat-lnl-2:          [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-lnl-2/igt@xe_create@create-invalid-mbz.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-lnl-2/igt@xe_create@create-invalid-mbz.html

  * igt@xe_exec_queue_property@invalid-property:
    - bat-dg2-oem2:       [PASS][11] -> [FAIL][12] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
    - bat-lnl-1:          [PASS][13] -> [FAIL][14] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_create@create-invalid-mbz:
    - {bat-bmg-2}:        [PASS][15] -> [FAIL][16] +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-bmg-2/igt@xe_create@create-invalid-mbz.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-bmg-2/igt@xe_create@create-invalid-mbz.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-1785-479cde039b423852ee120f3832ca74ea45b646fd -> xe-pw-136052v2

  IGT_7973: 9c3a20d0403a2fe80bde618de5c2ef83b7e08d50 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1785-479cde039b423852ee120f3832ca74ea45b646fd: 479cde039b423852ee120f3832ca74ea45b646fd
  xe-pw-136052v2: 136052v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/index.html

--===============4021041447869763429==
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
<tr><td><b>Series:</b></td><td>Add PXP HWDRM support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136052/">https://patchwork.freedesktop.org/series/136052/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1785-479cde039b423852ee120f3832ca74ea45b646fd_BAT -&gt; xe-pw-136052v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136052v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136052v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136052v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_create@create-invalid-mbz:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-atsm-2/igt@xe_create@create-invalid-mbz.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-atsm-2/igt@xe_create@create-invalid-mbz.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-adlp-vf/igt@xe_create@create-invalid-mbz.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-adlp-vf/igt@xe_create@create-invalid-mbz.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-adlp-7/igt@xe_create@create-invalid-mbz.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-adlp-7/igt@xe_create@create-invalid-mbz.html">FAIL</a> +1 other test fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-bmg-1/igt@xe_create@create-invalid-mbz.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-bmg-1/igt@xe_create@create-invalid-mbz.html">FAIL</a> +1 other test fail</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-lnl-2/igt@xe_create@create-invalid-mbz.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-lnl-2/igt@xe_create@create-invalid-mbz.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@invalid-property:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> +1 other test fail</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_create@create-invalid-mbz:<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1785-479cde039b423852ee120f3832ca74ea45b646fd/bat-bmg-2/igt@xe_create@create-invalid-mbz.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v2/bat-bmg-2/igt@xe_create@create-invalid-mbz.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1785-479cde039b423852ee120f3832ca74ea45b646fd -&gt; xe-pw-136052v2</li>
</ul>
<p>IGT_7973: 9c3a20d0403a2fe80bde618de5c2ef83b7e08d50 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1785-479cde039b423852ee120f3832ca74ea45b646fd: 479cde039b423852ee120f3832ca74ea45b646fd<br />
  xe-pw-136052v2: 136052v2</p>

</body>
</html>

--===============4021041447869763429==--
