Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DDFC982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 12:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5631010E735;
	Mon, 21 Sep 2026 12:45:25 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA79610E38D;
 Mon, 21 Sep 2026 12:45:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2718162179901282735=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/display=3A_switch_?=
 =?utf-8?q?to_modern_drm=5Fdp=5Fdpcd*_accessors_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Sep 2026 12:45:23 -0000
Message-ID: <178999472375.186928.11684534957304197467@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1789547331.git.jani.nikula@intel.com>
In-Reply-To: <cover.1789547331.git.jani.nikula@intel.com>
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

--===============2718162179901282735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: switch to modern drm_dp_dpcd* accessors (rev2)
URL   : https://patchwork.freedesktop.org/series/174241/
State : failure

== Summary ==

CI Bug Log - changes from xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe_BAT -> xe-pw-174241v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-174241v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-174241v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 15)
------------------------------

  Additional (1): bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-174241v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-vm:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html

  * igt@xe_exec_system_allocator@twice-free:
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - bat-bmg-3:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-174241v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-vm:         NOTRUN -> [SKIP][7] ([Intel XE#5764]) +11 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-basic:
    - bat-ptl-vm:         NOTRUN -> [SKIP][8] ([Intel XE#7482]) +17 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
    - bat-ptl-vm:         NOTRUN -> [SKIP][9] ([Intel XE#8364]) +13 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-ptl-vm:         NOTRUN -> [SKIP][10] ([Intel XE#5775]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_mmap@vram:
    - bat-ptl-vm:         NOTRUN -> [SKIP][11] ([Intel XE#5776])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-vm:         NOTRUN -> [SKIP][12] ([Intel XE#5777] / [Intel XE#7590])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-ptl-vm:         NOTRUN -> [SKIP][13] ([Intel XE#5771] / [Intel XE#7590])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-vm:         NOTRUN -> [SKIP][14] ([Intel XE#5780] / [Intel XE#7590])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_waitfence@engine:
    - bat-wcl-1:          [PASS][15] -> [FAIL][16] ([Intel XE#9103])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-wcl-1/igt@xe_waitfence@engine.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-wcl-1/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-wcl-1:          [PASS][17] -> [FAIL][18] ([Intel XE#9115])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-wcl-1/igt@xe_waitfence@reltime.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-wcl-1/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - bat-bmg-vm:         [DMESG-WARN][19] -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - bat-bmg-1:          [DMESG-WARN][21] -> [PASS][22] +1 other test pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - bat-bmg-3:          [DMESG-WARN][23] -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#9103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * Linux: xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe -> xe-pw-174241v2

  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe: 1a3cf4b9d76455bd9de175ca12736eff1ec60fbe
  xe-pw-174241v2: 174241v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/index.html

--===============2718162179901282735==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: switch to modern drm_dp_dpcd* accessors (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174241/">https://patchwork.freedesktop.org/series/174241/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe_BAT -&gt; xe-pw-174241v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-174241v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-174241v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 15)</h2>
<p>Additional (1): bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-174241v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174241v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-basic:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-wcl-1/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-wcl-1/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103">Intel XE#9103</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-wcl-1/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-wcl-1/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174241v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe -&gt; xe-pw-174241v2</li>
</ul>
<p>IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5793-1a3cf4b9d76455bd9de175ca12736eff1ec60fbe: 1a3cf4b9d76455bd9de175ca12736eff1ec60fbe<br />
  xe-pw-174241v2: 174241v2</p>

</body>
</html>

--===============2718162179901282735==--
