Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1EEC4828F
	for <intel-xe@archiver.kernel.org>; Sat,  3 Feb 2024 00:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C10D10E8CE;
	Sat,  3 Feb 2024 00:30:51 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BC810E8CE;
 Sat,  3 Feb 2024 00:30:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6617583543886559832=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5Bv3=2C1/4?=
 =?utf-8?q?=5D_drm/xe=3A_Add_uapi_for_dumpable_bos_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 03 Feb 2024 00:30:49 -0000
Message-ID: <170692024998.953177.6704814343888650795@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202224052.848867-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240202224052.848867-1-maarten.lankhorst@linux.intel.com>
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

--===============6617583543886559832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/4] drm/xe: Add uapi for dumpable bos (rev2)
URL   : https://patchwork.freedesktop.org/series/129496/
State : failure

== Summary ==

CI Bug Log - changes from xe-719-40994da55437acf620a48af39b0d8545e1595c42_BAT -> xe-pw-129496v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-129496v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-129496v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-129496v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +91 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] +92 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [PASS][5] -> [FAIL][6] +117 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][7] -> [FAIL][8] +71 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit:
    - bat-dg2-oem2:       [PASS][9] -> [DMESG-WARN][10] +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-dg2-oem2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-dg2-oem2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html

  
#### Warnings ####

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-pvc-2:          [INCOMPLETE][11] ([Intel XE#392]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_intel_bb@render@render-4-1024}:
    - bat-atsm-2:         [PASS][13] -> [FAIL][14] +2 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-atsm-2/igt@xe_intel_bb@render@render-4-1024.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-atsm-2/igt@xe_intel_bb@render@render-4-1024.html

  * {igt@xe_pat@pat-index-xelp@render}:
    - bat-adlp-7:         [PASS][15] -> [FAIL][16] +2 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-adlp-7/igt@xe_pat@pat-index-xelp@render.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-adlp-7/igt@xe_pat@pat-index-xelp@render.html
    - bat-dg2-oem2:       [PASS][17] -> [FAIL][18] +2 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render.html

  
Known issues
------------

  Here are the changes found in xe-pw-129496v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@migrate:
    - bat-dg2-oem2:       [PASS][19] -> [SKIP][20] ([Intel XE#1192])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-dg2-oem2/igt@xe_live_ktest@migrate.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-dg2-oem2/igt@xe_live_ktest@migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392


Build changes
-------------

  * Linux: xe-719-40994da55437acf620a48af39b0d8545e1595c42 -> xe-pw-129496v2

  IGT_7702: bf075a74ece1956fc0e554291591b9da3eab54cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-719-40994da55437acf620a48af39b0d8545e1595c42: 40994da55437acf620a48af39b0d8545e1595c42
  xe-pw-129496v2: 129496v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/index.html

--===============6617583543886559832==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/4] drm/xe: Add uapi for dumpable bos (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129496/">https://patchwork.freedesktop.org/series/129496/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-719-40994da55437acf620a48af39b0d8545e1595c42_BAT -&gt; xe-pw-129496v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-129496v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-129496v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-129496v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +91 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +92 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> +117 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> +71 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-dg2-oem2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-dg2-oem2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_intel_bb@render@render-4-1024}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-atsm-2/igt@xe_intel_bb@render@render-4-1024.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-atsm-2/igt@xe_intel_bb@render@render-4-1024.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-xelp@render}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-adlp-7/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-adlp-7/igt@xe_pat@pat-index-xelp@render.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129496v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@migrate:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-719-40994da55437acf620a48af39b0d8545e1595c42/bat-dg2-oem2/igt@xe_live_ktest@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v2/bat-dg2-oem2/igt@xe_live_ktest@migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-719-40994da55437acf620a48af39b0d8545e1595c42 -&gt; xe-pw-129496v2</li>
</ul>
<p>IGT_7702: bf075a74ece1956fc0e554291591b9da3eab54cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-719-40994da55437acf620a48af39b0d8545e1595c42: 40994da55437acf620a48af39b0d8545e1595c42<br />
  xe-pw-129496v2: 129496v2</p>

</body>
</html>

--===============6617583543886559832==--
