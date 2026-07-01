Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F048FC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 19:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956C110E266;
	Wed,  1 Jul 2026 19:11:33 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCDB10E20F;
 Wed,  1 Jul 2026 19:11:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3021752698782626512=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Add_debugfs_knob_?=
 =?utf-8?q?to_disable_Mid-Thread_Preemption_per_GT_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 19:11:32 -0000
Message-ID: <178293309270.139541.16276445635720158685@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260618042421.483657-1-varun.gupta@intel.com>
In-Reply-To: <20260618042421.483657-1-varun.gupta@intel.com>
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

--===============3021752698782626512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add debugfs knob to disable Mid-Thread Preemption per GT (rev2)
URL   : https://patchwork.freedesktop.org/series/168743/
State : failure

== Summary ==

CI Bug Log - changes from xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b_BAT -> xe-pw-168743v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168743v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168743v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168743v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-bmg-3:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-3/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-3/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-1/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-1/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-168743v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][7] -> [SKIP][8] ([Intel XE#8517])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_exec_basic@twice-bindexecqueue-userptr:
    - bat-bmg-2:          [PASS][9] -> [SKIP][10] ([Intel XE#8480]) +250 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][11] -> [FAIL][12] ([Intel XE#8464]) +6 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - bat-bmg-3:          [PASS][13] -> [SKIP][14] ([Intel XE#6964]) +20 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html

  * igt@xe_peer2peer@read:
    - bat-bmg-3:          [PASS][15] -> [SKIP][16] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-3/igt@xe_peer2peer@read.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-3/igt@xe_peer2peer@read.html

  * igt@xe_query@multigpu-query-pxp-status:
    - bat-bmg-3:          [PASS][17] -> [SKIP][18] ([Intel XE#8480]) +71 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-3/igt@xe_query@multigpu-query-pxp-status.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-3/igt@xe_query@multigpu-query-pxp-status.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-bmg-2:          [SKIP][19] ([Intel XE#2233]) -> [SKIP][20] ([Intel XE#8480])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          [SKIP][21] ([Intel XE#2489] / [Intel XE#3419]) -> [SKIP][22] ([Intel XE#8480]) +13 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-bmg-2:          [SKIP][23] ([Intel XE#2482]) -> [SKIP][24] ([Intel XE#8480]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-2:          [SKIP][25] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][26] ([Intel XE#8480])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-bmg-2:          [SKIP][27] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][28] ([Intel XE#8480]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_exec_multi_queue@priority:
    - bat-bmg-2:          [SKIP][29] ([Intel XE#8364]) -> [SKIP][30] ([Intel XE#8480]) +13 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_exec_multi_queue@priority.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_exec_multi_queue@priority.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          [SKIP][31] ([Intel XE#2229]) -> [FAIL][32] ([Intel XE#8464])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-bmg-2:          [SKIP][33] ([Intel XE#1420] / [Intel XE#7590]) -> [SKIP][34] ([Intel XE#8480])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][35] ([Intel XE#2245] / [Intel XE#7590]) -> [SKIP][36] ([Intel XE#8480])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-bmg-2:          [SKIP][37] ([Intel XE#2236] / [Intel XE#7590]) -> [SKIP][38] ([Intel XE#8480])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8464
  [Intel XE#8480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480
  [Intel XE#8517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8517


Build changes
-------------

  * Linux: xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b -> xe-pw-168743v2

  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b: a10cc0a3736f20e94703ccb9f9c57b078dcfe94b
  xe-pw-168743v2: 168743v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/index.html

--===============3021752698782626512==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add debugfs knob to disable Mid-Thread Preemption per GT (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168743/">https://patchwork.freedesktop.org/series/168743/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b_BAT -&gt; xe-pw-168743v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168743v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168743v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168743v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-3/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168743v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8517">Intel XE#8517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +250 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8464">Intel XE#8464</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-3/igt@xe_peer2peer@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-3/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-3/igt@xe_query@multigpu-query-pxp-status.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-3/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +71 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@priority:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8464">Intel XE#8464</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168743v2/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b -&gt; xe-pw-168743v2</li>
</ul>
<p>IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5324-a10cc0a3736f20e94703ccb9f9c57b078dcfe94b: a10cc0a3736f20e94703ccb9f9c57b078dcfe94b<br />
  xe-pw-168743v2: 168743v2</p>

</body>
</html>

--===============3021752698782626512==--
