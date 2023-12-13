Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85380C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 23:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5525B10E873;
	Wed, 13 Dec 2023 23:19:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 91AD510E873;
 Wed, 13 Dec 2023 23:19:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 88372AADF2;
 Wed, 13 Dec 2023 23:19:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3904414615753612987=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/uapi=3A_Uniform_async_vs_?=
 =?utf-8?q?sync_handling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 13 Dec 2023 23:19:55 -0000
Message-ID: <170250959552.10264.8828685326314241546@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231213222957.624515-1-matthew.brost@intel.com>
In-Reply-To: <20231213222957.624515-1-matthew.brost@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============3904414615753612987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Uniform async vs sync handling (rev3)
URL   : https://patchwork.freedesktop.org/series/127442/
State : failure

== Summary ==

CI Bug Log - changes from xe-577-5cd1893366708380854f4694ae57417192458a6b_BAT -> xe-pw-127442v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-127442v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-127442v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-127442v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +123 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-pvc-2:          [PASS][3] -> [TIMEOUT][4] +2 other tests timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-pvc-2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-pvc-2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] +182 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [PASS][7] -> [FAIL][8] +106 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] +149 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][11] ([Intel XE#400] / [Intel XE#616]) -> [FAIL][12] +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_create@create-execqueues-noleak:
    - bat-adlp-7:         [FAIL][13] ([Intel XE#524]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
    - bat-atsm-2:         [FAIL][15] ([Intel XE#524]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][17] ([Intel XE#1000]) -> [FAIL][18] +3 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-pvc-2:          [DMESG-FAIL][19] ([Intel XE#482]) -> [FAIL][20] +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-pvc-2:          [INCOMPLETE][21] ([Intel XE#392]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_psr@psr-cursor-plane-move}:
    - bat-adlp-7:         [PASS][23] -> [FAIL][24] +8 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * {igt@xe_pat@pat-index-xehpc@blt}:
    - bat-pvc-2:          [PASS][25] -> [FAIL][26] +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-pvc-2/igt@xe_pat@pat-index-xehpc@blt.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-pvc-2/igt@xe_pat@pat-index-xehpc@blt.html

  * {igt@xe_pat@pat-index-xelp@render}:
    - bat-dg2-oem2:       [PASS][27] -> [FAIL][28] +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render.html
    - bat-atsm-2:         [PASS][29] -> [FAIL][30] +2 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-atsm-2/igt@xe_pat@pat-index-xelp@render.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-atsm-2/igt@xe_pat@pat-index-xelp@render.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616


Build changes
-------------

  * IGT: IGT_7636 -> IGT_7639
  * Linux: xe-577-5cd1893366708380854f4694ae57417192458a6b -> xe-pw-127442v3

  IGT_7636: 7636
  IGT_7639: 18afc09e362b605a3c88c000331708f105d2c23a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-577-5cd1893366708380854f4694ae57417192458a6b: 5cd1893366708380854f4694ae57417192458a6b
  xe-pw-127442v3: 127442v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/index.html

--===============3904414615753612987==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Uniform async vs sync handling (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127442/">https://patchwork.freedesktop.org/series/127442/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-577-5cd1893366708380854f4694ae57417192458a6b_BAT -&gt; xe-pw-127442v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-127442v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-127442v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-127442v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +123 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-pvc-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-pvc-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +182 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> +106 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> +149 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_psr@psr-cursor-plane-move}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-xehpc@blt}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-pvc-2/igt@xe_pat@pat-index-xehpc@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-pvc-2/igt@xe_pat@pat-index-xehpc@blt.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-xelp@render}:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-dg2-oem2/igt@xe_pat@pat-index-xelp@render.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-577-5cd1893366708380854f4694ae57417192458a6b/bat-atsm-2/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127442v3/bat-atsm-2/igt@xe_pat@pat-index-xelp@render.html">FAIL</a> +2 other tests fail</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7636 -&gt; IGT_7639</li>
<li>Linux: xe-577-5cd1893366708380854f4694ae57417192458a6b -&gt; xe-pw-127442v3</li>
</ul>
<p>IGT_7636: 7636<br />
  IGT_7639: 18afc09e362b605a3c88c000331708f105d2c23a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-577-5cd1893366708380854f4694ae57417192458a6b: 5cd1893366708380854f4694ae57417192458a6b<br />
  xe-pw-127442v3: 127442v3</p>

</body>
</html>

--===============3904414615753612987==--
