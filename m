Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB61C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 23:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F1F10E095;
	Wed, 22 Jan 2025 23:54:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035BE10E095;
 Wed, 22 Jan 2025 23:54:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5750660926012042654=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_PXP_HWDRM_support_=28re?=
 =?utf-8?q?v6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 23:54:14 -0000
Message-ID: <173759005400.3263273.15380648337540138317@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116001110.4158032-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250116001110.4158032-1-daniele.ceraolospurio@intel.com>
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

--===============5750660926012042654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add PXP HWDRM support (rev6)
URL   : https://patchwork.freedesktop.org/series/136052/
State : failure

== Summary ==

CI Bug Log - changes from xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308_BAT -> xe-pw-136052v6_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136052v6_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136052v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136052v6_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_create@create-invalid-mbz:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-atsm-2/igt@xe_create@create-invalid-mbz.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-atsm-2/igt@xe_create@create-invalid-mbz.html
    - bat-adlp-vf:        [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-adlp-vf/igt@xe_create@create-invalid-mbz.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-adlp-vf/igt@xe_create@create-invalid-mbz.html
    - bat-pvc-2:          [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-pvc-2/igt@xe_create@create-invalid-mbz.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-pvc-2/igt@xe_create@create-invalid-mbz.html
    - bat-bmg-2:          [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-bmg-2/igt@xe_create@create-invalid-mbz.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-bmg-2/igt@xe_create@create-invalid-mbz.html
    - bat-bmg-1:          [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-bmg-1/igt@xe_create@create-invalid-mbz.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-bmg-1/igt@xe_create@create-invalid-mbz.html
    - bat-lnl-2:          [PASS][11] -> [FAIL][12] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-lnl-2/igt@xe_create@create-invalid-mbz.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-lnl-2/igt@xe_create@create-invalid-mbz.html

  * igt@xe_exec_queue_property@invalid-property:
    - bat-dg2-oem2:       [PASS][13] -> [FAIL][14] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
    - bat-lnl-1:          [PASS][15] -> [FAIL][16] +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html

  
Known issues
------------

  Here are the changes found in xe-pw-136052v6_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][17] -> [SKIP][18] ([Intel XE#1192]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_vm@shared-pde-page:
    - bat-adlp-vf:        [PASS][19] -> [DMESG-WARN][20] ([Intel XE#3970] / [Intel XE#4078])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-adlp-vf/igt@xe_vm@shared-pde-page.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-adlp-vf/igt@xe_vm@shared-pde-page.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][21] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][22] ([Intel XE#1192])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308 -> xe-pw-136052v6

  IGT_8206: 48d7780a026179e5de232142df3ac59fec6487ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308: d577d9e67e5ac149fcd4442327210b831cddb308
  xe-pw-136052v6: 136052v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/index.html

--===============5750660926012042654==
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
<tr><td><b>Series:</b></td><td>Add PXP HWDRM support (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136052/">https://patchwork.freedesktop.org/series/136052/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308_BAT -&gt; xe-pw-136052v6_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136052v6_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136052v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136052v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_create@create-invalid-mbz:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-atsm-2/igt@xe_create@create-invalid-mbz.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-atsm-2/igt@xe_create@create-invalid-mbz.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-adlp-vf/igt@xe_create@create-invalid-mbz.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-adlp-vf/igt@xe_create@create-invalid-mbz.html">FAIL</a> +1 other test fail</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-pvc-2/igt@xe_create@create-invalid-mbz.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-pvc-2/igt@xe_create@create-invalid-mbz.html">FAIL</a> +1 other test fail</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-bmg-2/igt@xe_create@create-invalid-mbz.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-bmg-2/igt@xe_create@create-invalid-mbz.html">FAIL</a> +1 other test fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-bmg-1/igt@xe_create@create-invalid-mbz.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-bmg-1/igt@xe_create@create-invalid-mbz.html">FAIL</a> +1 other test fail</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-lnl-2/igt@xe_create@create-invalid-mbz.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-lnl-2/igt@xe_create@create-invalid-mbz.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@invalid-property:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> +1 other test fail</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136052v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde-page:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-adlp-vf/igt@xe_vm@shared-pde-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-adlp-vf/igt@xe_vm@shared-pde-page.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v6/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308 -&gt; xe-pw-136052v6</li>
</ul>
<p>IGT_8206: 48d7780a026179e5de232142df3ac59fec6487ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2533-d577d9e67e5ac149fcd4442327210b831cddb308: d577d9e67e5ac149fcd4442327210b831cddb308<br />
  xe-pw-136052v6: 136052v6</p>

</body>
</html>

--===============5750660926012042654==--
