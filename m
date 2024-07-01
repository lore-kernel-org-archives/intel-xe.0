Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D894C2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 14:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44CA10E309;
	Mon,  1 Jul 2024 14:56:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F2610E270;
 Mon,  1 Jul 2024 14:56:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6277673465672701340=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_lean_exhaustive_evicti?=
 =?utf-8?q?on_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jul 2024 14:56:26 -0000
Message-ID: <171984578694.2381.500454107184411867@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240701080327.3191-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240701080327.3191-1-thomas.hellstrom@linux.intel.com>
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

--===============6277673465672701340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: lean exhaustive eviction (rev3)
URL   : https://patchwork.freedesktop.org/series/135570/
State : failure

== Summary ==

CI Bug Log - changes from xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT -> xe-pw-135570v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135570v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135570v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135570v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
    - bat-dg2-oem2:       [PASS][3] -> [DMESG-FAIL][4] +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-atsm-2:         [PASS][5] -> [DMESG-FAIL][6] +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
    - bat-pvc-2:          [PASS][9] -> [SKIP][10] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - {bat-lnl-1}:        [PASS][11] -> [ABORT][12] +1 other test abort
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

  
Known issues
------------

  Here are the changes found in xe-pw-135570v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [PASS][13] -> [SKIP][14] ([Intel XE#1192]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][15] -> [SKIP][16] ([Intel XE#2109]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109


Build changes
-------------

  * IGT: IGT_7907 -> IGT_7908
  * Linux: xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299 -> xe-pw-135570v3

  IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7908: 7908
  xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299
  xe-pw-135570v3: 135570v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/index.html

--===============6277673465672701340==
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
<tr><td><b>Series:</b></td><td>drm/xe: lean exhaustive eviction (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135570/">https://patchwork.freedesktop.org/series/135570/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT -&gt; xe-pw-135570v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135570v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135570v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135570v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">ABORT</a> +1 other test abort</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135570v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135570v3/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109">Intel XE#2109</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7907 -&gt; IGT_7908</li>
<li>Linux: xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299 -&gt; xe-pw-135570v3</li>
</ul>
<p>IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7908: 7908<br />
  xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299<br />
  xe-pw-135570v3: 135570v3</p>

</body>
</html>

--===============6277673465672701340==--
