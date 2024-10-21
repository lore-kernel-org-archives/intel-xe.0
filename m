Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36A2D1714B
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 23:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666F810E068;
	Mon, 21 Oct 2024 23:43:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A343010E068;
 Mon, 21 Oct 2024 23:43:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4032403911968643252=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/xe=5Fguc=5Fads=3A_save/re?=
 =?utf-8?q?store_OA_registers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 23:43:33 -0000
Message-ID: <172955421366.1306617.7559490868503362992@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021222401.95833-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241021222401.95833-1-jonathan.cavitt@intel.com>
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

--===============4032403911968643252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_guc_ads: save/restore OA registers
URL   : https://patchwork.freedesktop.org/series/140281/
State : failure

== Summary ==

CI Bug Log - changes from xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56_BAT -> xe-pw-140281v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140281v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140281v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140281v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          [PASS][3] -> [SKIP][4] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][5] -> [DMESG-WARN][6] +6 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/bat-dg2-oem2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/bat-atsm-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-atsm-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-140281v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-lnl-2:          [PASS][9] -> [FAIL][10] ([Intel XE#2754])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][11] ([Intel XE#288]) +32 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][12] ([Intel XE#1192]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][13] -> [SKIP][14] ([Intel XE#1192]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-dg2-oem2:       [INCOMPLETE][15] ([Intel XE#2874]) -> [SKIP][16] ([Intel XE#1192])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288


Build changes
-------------

  * Linux: xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56 -> xe-pw-140281v1

  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56: aa0898115bcff3eda6d021cc66eb8a1c3b264c56
  xe-pw-140281v1: 140281v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/index.html

--===============4032403911968643252==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_guc_ads: save/restore OA registers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140281/">https://patchwork.freedesktop.org/series/140281/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56_BAT -&gt; xe-pw-140281v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140281v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140281v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140281v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-dg2-oem2/igt@xe_module_load@load.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-atsm-2/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140281v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140281v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56 -&gt; xe-pw-140281v1</li>
</ul>
<p>IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56: aa0898115bcff3eda6d021cc66eb8a1c3b264c56<br />
  xe-pw-140281v1: 140281v1</p>

</body>
</html>

--===============4032403911968643252==--
