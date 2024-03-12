Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E7AC54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 14:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6197610FD7F;
	Tue, 12 Mar 2024 14:56:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FB710FD7F;
 Tue, 12 Mar 2024 14:56:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4502246591619893787=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5BCI=2C1/7?=
 =?utf-8?q?=5D_drm/xe=3A_Make_TLB_invalidation_fences_unordered?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 Mar 2024 14:56:29 -0000
Message-ID: <171025538973.694325.13463558680525123936@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240312140447.50437-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240312140447.50437-1-thomas.hellstrom@linux.intel.com>
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

--===============4502246591619893787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/7] drm/xe: Make TLB invalidation fences unordered
URL   : https://patchwork.freedesktop.org/series/131028/
State : failure

== Summary ==

CI Bug Log - changes from xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad_BAT -> xe-pw-131028v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-131028v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131028v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131028v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2] +211 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131028v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_module_load@load:
    - bat-atsm-2:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad/bat-atsm-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131028v1/bat-atsm-2/igt@xe_module_load@load.html
    - bat-pvc-2:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad/bat-pvc-2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131028v1/bat-pvc-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-131028v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo:
    - bat-dg2-oem2:       [PASS][7] -> [SKIP][8] ([Intel XE#1192]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131028v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192


Build changes
-------------

  * IGT: IGT_7754 -> IGT_7756
  * Linux: xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad -> xe-pw-131028v1

  IGT_7754: 5fb3239299b5be2c110aafa483c9e197c53f8bb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7756: 7756
  xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad: 61fa386186cb302cf26e29aef76d5b1a6ffe57ad
  xe-pw-131028v1: 131028v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131028v1/index.html

--===============4502246591619893787==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/7] drm/xe: Make TLB invalidation fences unordered</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131028/">https://patchwork.freedesktop.org/series/131028/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131028v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131028v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad_BAT -&gt; xe-pw-131028v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-131028v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131028v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131028v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131028v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">DMESG-WARN</a> +211 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131028v1/bat-atsm-2/igt@xe_module_load@load.html">INCOMPLETE</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad/bat-pvc-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131028v1/bat-pvc-2/igt@xe_module_load@load.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131028v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131028v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7754 -&gt; IGT_7756</li>
<li>Linux: xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad -&gt; xe-pw-131028v1</li>
</ul>
<p>IGT_7754: 5fb3239299b5be2c110aafa483c9e197c53f8bb8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7756: 7756<br />
  xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad: 61fa386186cb302cf26e29aef76d5b1a6ffe57ad<br />
  xe-pw-131028v1: 131028v1</p>

</body>
</html>

--===============4502246591619893787==--
