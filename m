Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AB5E784BE
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 03:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0506211A888;
	Thu, 25 Dec 2025 03:02:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E772F11A885;
 Thu, 25 Dec 2025 03:02:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1415034326142721813=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Fence_deadlines_in_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Dec 2025 03:02:46 -0000
Message-ID: <176663176695.117300.4659469240907474712@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251225011734.341683-1-matthew.brost@intel.com>
In-Reply-To: <20251225011734.341683-1-matthew.brost@intel.com>
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

--===============1415034326142721813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fence deadlines in Xe
URL   : https://patchwork.freedesktop.org/series/159479/
State : success

== Summary ==

CI Bug Log - changes from xe-4302-5c680ac45628b1951d20a444f400c82242029031_FULL -> xe-pw-159479v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-159479v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2887])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2724])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2325])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][4] -> [FAIL][5] ([Intel XE#4633])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#5299])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2311]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2313]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
    - shard-bmg:          [PASS][10] -> [ABORT][11] ([Intel XE#6740]) +1 other test abort
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-10/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-8/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1406] / [Intel XE#1489])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@xe_eudebug_online@interrupt-all:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#4837] / [Intel XE#6665])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@xe_eudebug_online@interrupt-all.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][14] -> [INCOMPLETE][15] ([Intel XE#6321])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#6874])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html

  * igt@xe_exec_system_allocator@twice-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#4943]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@xe_exec_system_allocator@twice-mmap-free-huge-nomemset.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#6251]) +4 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#6569])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [FAIL][21] ([Intel XE#5993]) -> [PASS][22] +3 other tests pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][23] ([Intel XE#2291]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][25] ([Intel XE#2316]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][27] ([Intel XE#4227]) -> [PASS][28] +1 other test pass
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-lnl-4/igt@kms_vrr@flipline.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-lnl-3/igt@kms_vrr@flipline.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [FAIL][29] ([Intel XE#5625]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [FAIL][31] ([Intel XE#6251]) -> [PASS][32] +1 other test pass
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][33] ([Intel XE#2312]) -> [SKIP][34] ([Intel XE#4141])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][35] ([Intel XE#2312]) -> [SKIP][36] ([Intel XE#2313])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [ABORT][37] ([Intel XE#6740]) -> [SKIP][38] ([Intel XE#1503])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874


Build changes
-------------

  * Linux: xe-4302-5c680ac45628b1951d20a444f400c82242029031 -> xe-pw-159479v1

  IGT_8677: 8677
  xe-4302-5c680ac45628b1951d20a444f400c82242029031: 5c680ac45628b1951d20a444f400c82242029031
  xe-pw-159479v1: 159479v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/index.html

--===============1415034326142721813==
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
<tr><td><b>Series:</b></td><td>Fence deadlines in Xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159479/">https://patchwork.freedesktop.org/series/159479/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4302-5c680ac45628b1951d20a444f400c82242029031_FULL -&gt; xe-pw-159479v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159479v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-10/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-8/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@xe_exec_system_allocator@twice-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-lnl-4/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-lnl-3/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4302-5c680ac45628b1951d20a444f400c82242029031/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159479v1/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4302-5c680ac45628b1951d20a444f400c82242029031 -&gt; xe-pw-159479v1</li>
</ul>
<p>IGT_8677: 8677<br />
  xe-4302-5c680ac45628b1951d20a444f400c82242029031: 5c680ac45628b1951d20a444f400c82242029031<br />
  xe-pw-159479v1: 159479v1</p>

</body>
</html>

--===============1415034326142721813==--
