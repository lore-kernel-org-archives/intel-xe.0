Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDC9C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 04:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3064D10E445;
	Wed,  5 Jun 2024 04:12:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E24810E445;
 Wed,  5 Jun 2024 04:11:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1199716590578641328=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Xe_+_TTM_bo_shrinker_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Hellstrom" <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 04:11:59 -0000
Message-ID: <171756071951.2266944.4622241471165722149@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240604144658.69890-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240604144658.69890-1-thomas.hellstrom@linux.intel.com>
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

--===============1199716590578641328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Xe + TTM bo shrinker (rev2)
URL   : https://patchwork.freedesktop.org/series/134426/
State : failure

== Summary ==

CI Bug Log - changes from xe-1399-596cf447db94909c4788fd612876520531e439b0_BAT -> xe-pw-134426v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-134426v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-134426v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 5)
------------------------------

  Additional (1): bat-adlp-7 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134426v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-atsm-2:         [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
    - bat-pvc-2:          [PASS][5] -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_evict@evict-threads-small:
    - bat-pvc-2:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-pvc-2/igt@xe_evict@evict-threads-small.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-pvc-2/igt@xe_evict@evict-threads-small.html
    - bat-atsm-2:         [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-atsm-2/igt@xe_evict@evict-threads-small.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-atsm-2/igt@xe_evict@evict-threads-small.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][11] ([Intel XE#1000]) -> [FAIL][12] +3 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-pvc-2:          [DMESG-FAIL][13] ([Intel XE#482]) -> [DMESG-FAIL][14] +3 other tests dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html

  
New tests
---------

  New tests have been introduced between xe-1399-596cf447db94909c4788fd612876520531e439b0_BAT and xe-pw-134426v2_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - Statuses : 5 pass(s)
    - Exec time: [7.04, 58.45] s

  

Known issues
------------

  Here are the changes found in xe-pw-134426v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         NOTRUN -> [SKIP][15] ([Intel XE#455])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][16] ([Intel XE#324])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_evict@evict-small-cm:
    - bat-adlp-7:         NOTRUN -> [SKIP][17] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@xe_evict@evict-small-cm.html

  * igt@xe_evict@evict-threads-small:
    - bat-dg2-oem2:       [PASS][18] -> [TIMEOUT][19] ([Intel XE#1473])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-7:         NOTRUN -> [SKIP][20] ([Intel XE#688]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][21] ([Intel XE#288]) +32 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         NOTRUN -> [SKIP][22] ([Intel XE#1008])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-7:         NOTRUN -> [SKIP][23] ([Intel XE#977])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-7:         NOTRUN -> [SKIP][24] ([Intel XE#979]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - {bat-lnl-1}:        [FAIL][25] ([Intel XE#886]) -> [PASS][26] +1 other test pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1399-596cf447db94909c4788fd612876520531e439b0 -> xe-pw-134426v2

  IGT_7877: 23b8b8a0168e1b5141e29346be1f83fdbed31037 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1399-596cf447db94909c4788fd612876520531e439b0: 596cf447db94909c4788fd612876520531e439b0
  xe-pw-134426v2: 134426v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/index.html

--===============1199716590578641328==
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
<tr><td><b>Series:</b></td><td>Xe + TTM bo shrinker (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134426/">https://patchwork.freedesktop.org/series/134426/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1399-596cf447db94909c4788fd612876520531e439b0_BAT -&gt; xe-pw-134426v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-134426v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-134426v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 5)</h2>
<p>Additional (1): bat-adlp-7 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-134426v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">DMESG-FAIL</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-pvc-2/igt@xe_evict@evict-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-pvc-2/igt@xe_evict@evict-threads-small.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-atsm-2/igt@xe_evict@evict-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-atsm-2/igt@xe_evict@evict-threads-small.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">DMESG-FAIL</a> +3 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1399-596cf447db94909c4788fd612876520531e439b0_BAT and xe-pw-134426v2_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [7.04, 58.45] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134426v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1399-596cf447db94909c4788fd612876520531e439b0/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134426v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1399-596cf447db94909c4788fd612876520531e439b0 -&gt; xe-pw-134426v2</li>
</ul>
<p>IGT_7877: 23b8b8a0168e1b5141e29346be1f83fdbed31037 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1399-596cf447db94909c4788fd612876520531e439b0: 596cf447db94909c4788fd612876520531e439b0<br />
  xe-pw-134426v2: 134426v2</p>

</body>
</html>

--===============1199716590578641328==--
