Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7B1CA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 16:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB4810E06D;
	Mon,  2 Sep 2024 16:05:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7936710E06D;
 Mon,  2 Sep 2024 16:05:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5330609159171984172=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe=3A_Use_xe=5Fpm=5Fruntime=5Fget_in_xe=5Fbo=5Fmove=28=29_if_r?=
 =?utf-8?q?eclaim-safe=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Sep 2024 16:05:48 -0000
Message-ID: <172529314847.907433.14145197032144138151@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240902142042.77581-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240902142042.77581-1-thomas.hellstrom@linux.intel.com>
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

--===============5330609159171984172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.
URL   : https://patchwork.freedesktop.org/series/138098/
State : failure

== Summary ==

CI Bug Log - changes from xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5_BAT -> xe-pw-138098v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138098v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138098v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138098v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
    - bat-atsm-2:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5/bat-atsm-2/igt@xe_live_ktest@xe_bo.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-atsm-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit (NEW):
    - bat-atsm-2:         NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
    - bat-pvc-2:          NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
New tests
---------

  New tests have been introduced between xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5_BAT and xe-pw-138098v1_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - Statuses : 2 incomplete(s) 7 pass(s)
    - Exec time: [0.34, 44.29] s

  

Known issues
------------

  Here are the changes found in xe-pw-138098v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch:
    - bat-bmg-1:          [DMESG-WARN][7] ([Intel XE#877]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][9] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
    - bat-adlp-7:         [SKIP][11] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-adlp-7:         [SKIP][13] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][14] ([Intel XE#2229])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-adlp-vf:        [SKIP][15] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][16] ([Intel XE#2229])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5 -> xe-pw-138098v1

  IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5: d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5
  xe-pw-138098v1: 138098v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/index.html

--===============5330609159171984172==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138098/">https://patchwork.freedesktop.org/series/138098/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5_BAT -&gt; xe-pw-138098v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138098v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138098v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138098v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5/bat-atsm-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-atsm-2/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a></li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5_BAT and xe-pw-138098v1_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>Statuses : 2 incomplete(s) 7 pass(s)</li>
<li>Exec time: [0.34, 44.29] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138098v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138098v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5 -&gt; xe-pw-138098v1</li>
</ul>
<p>IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1877-d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5: d5b1bfdcb803eb5b8b572a2fed8a9134993b47e5<br />
  xe-pw-138098v1: 138098v1</p>

</body>
</html>

--===============5330609159171984172==--
