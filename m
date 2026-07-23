Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4CCC531CC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 22:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D21210E61E;
	Thu, 23 Jul 2026 22:47:37 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602E710E61E;
 Thu, 23 Jul 2026 22:47:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1193882813118386155=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Fine_grained_fault_locking?=
 =?utf-8?q?=2C_threaded_prefetch=2C_storm_cache_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jul 2026 22:47:36 -0000
Message-ID: <178484685638.223390.9793028629487664702@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260723214743.1498125-1-matthew.brost@intel.com>
In-Reply-To: <20260723214743.1498125-1-matthew.brost@intel.com>
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

--===============1193882813118386155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fine grained fault locking, threaded prefetch, storm cache (rev5)
URL   : https://patchwork.freedesktop.org/series/162167/
State : failure

== Summary ==

CI Bug Log - changes from xe-5468-1b41172259f1c761714ee4d65a4386b42181c492_BAT -> xe-pw-162167v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-162167v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-162167v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 13)
------------------------------

  Additional (1): bat-bmg-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-162167v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:
    - bat-wcl-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-wcl-2/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-wcl-2/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
    - bat-bmg-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
    - bat-lnl-2:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-lnl-2/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-lnl-2/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
    - bat-bmg-vm:         [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-bmg-vm/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-vm/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
    - bat-ptl-2:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-ptl-2/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-ptl-2/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
    - bat-wcl-1:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-wcl-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-wcl-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
    - bat-ptl-1:          [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-ptl-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-ptl-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
    - bat-ptl-vm:         [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-ptl-vm/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-ptl-vm/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
    - bat-lnl-1:          [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-lnl-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-lnl-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
    - bat-bmg-2:          NOTRUN -> [ABORT][19]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - bat-bmg-3:          [PASS][20] -> [DMESG-FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-162167v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - bat-bmg-2:          NOTRUN -> [SKIP][22] ([Intel XE#2134]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@fbdev@write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][23] ([Intel XE#2233])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][24] ([Intel XE#2489] / [Intel XE#3419]) +13 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-bmg-2:          NOTRUN -> [SKIP][25] ([Intel XE#2482]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-2:          NOTRUN -> [SKIP][26] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-bmg-2:          NOTRUN -> [SKIP][27] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_exec_multi_queue@priority:
    - bat-bmg-2:          NOTRUN -> [SKIP][28] ([Intel XE#8364]) +13 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@xe_exec_multi_queue@priority.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - bat-bmg-3:          [PASS][29] -> [DMESG-FAIL][30] ([Intel XE#8300]) +1 other test dmesg-fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
    - bat-bmg-3:          [PASS][31] -> [ABORT][32] ([Intel XE#8300])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html

  
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314
  [Intel XE#8300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364


Build changes
-------------

  * Linux: xe-5468-1b41172259f1c761714ee4d65a4386b42181c492 -> xe-pw-162167v5

  IGT_9022: 9022
  xe-5468-1b41172259f1c761714ee4d65a4386b42181c492: 1b41172259f1c761714ee4d65a4386b42181c492
  xe-pw-162167v5: 162167v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/index.html

--===============1193882813118386155==
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
<tr><td><b>Series:</b></td><td>Fine grained fault locking, threaded prefetch, storm cache (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162167/">https://patchwork.freedesktop.org/series/162167/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5468-1b41172259f1c761714ee4d65a4386b42181c492_BAT -&gt; xe-pw-162167v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-162167v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-162167v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 13)</h2>
<p>Additional (1): bat-bmg-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-162167v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-wcl-2/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-wcl-2/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-lnl-2/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-lnl-2/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">ABORT</a></li>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-bmg-vm/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-vm/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">ABORT</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-ptl-2/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-ptl-2/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">ABORT</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-wcl-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-wcl-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-ptl-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-ptl-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">ABORT</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-ptl-vm/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-ptl-vm/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-lnl-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-lnl-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">ABORT</a></li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162167v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@priority:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-2/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300">Intel XE#8300</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5468-1b41172259f1c761714ee4d65a4386b42181c492/bat-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162167v5/bat-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300">Intel XE#8300</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5468-1b41172259f1c761714ee4d65a4386b42181c492 -&gt; xe-pw-162167v5</li>
</ul>
<p>IGT_9022: 9022<br />
  xe-5468-1b41172259f1c761714ee4d65a4386b42181c492: 1b41172259f1c761714ee4d65a4386b42181c492<br />
  xe-pw-162167v5: 162167v5</p>

</body>
</html>

--===============1193882813118386155==--
