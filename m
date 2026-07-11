Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9C5C43458
	for <intel-xe@archiver.kernel.org>; Sat, 11 Jul 2026 11:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E9D10E329;
	Sat, 11 Jul 2026 11:12:20 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C953F10E281;
 Sat, 11 Jul 2026 11:12:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1516863762445361512=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Add_and_use_more?=
 =?utf-8?q?_KLV_helpers_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 11 Jul 2026 11:12:18 -0000
Message-ID: <178376833881.178248.2214934823361765988@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260707220816.677-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260707220816.677-1-michal.wajdeczko@intel.com>
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

--===============1516863762445361512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add and use more KLV helpers (rev7)
URL   : https://patchwork.freedesktop.org/series/169511/
State : success

== Summary ==

CI Bug Log - changes from xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06_FULL -> xe-pw-169511v7_FULL
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

  Here are the changes found in xe-pw-169511v7_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [PASS][1] -> [ABORT][2] ([Intel XE#8007]) +2 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-9/igt@core_hotunplug@hotrebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-7/igt@core_hotunplug@hotrebind.html

  * igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] ([Intel XE#6652] / [Intel XE#6819])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-7/igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-3/igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-lnl:          [PASS][5] -> [INCOMPLETE][6] ([Intel XE#2597] / [Intel XE#8488]) +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-lnl-3/igt@kms_flip@flip-vs-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-lnl-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2311]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2313]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@xe_exec_reset@long-spin-many-preempt-media:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#7956])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-4/igt@xe_exec_reset@long-spin-many-preempt-media.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-5/igt@xe_exec_reset@long-spin-many-preempt-media.html

  * igt@xe_exec_system_allocator@many-malloc-mlock-nomemset:
    - shard-bmg:          [PASS][11] -> [TIMEOUT][12] ([Intel XE#8447])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-4/igt@xe_exec_system_allocator@many-malloc-mlock-nomemset.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-8/igt@xe_exec_system_allocator@many-malloc-mlock-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#8378])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate-race.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [PASS][14] -> [FAIL][15] ([Intel XE#7992])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-9/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-10/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][16] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][17] +1 other test pass
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][18] ([Intel XE#3321]) -> [PASS][19] +1 other test pass
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][20] ([Intel XE#301]) -> [PASS][21] +1 other test pass
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [FAIL][22] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3:
    - shard-bmg:          [FAIL][24] ([Intel XE#6266]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][26] ([Intel XE#1503]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@xe_waitfence@reltime:
    - shard-bmg:          [FAIL][28] ([Intel XE#8017]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-3/igt@xe_waitfence@reltime.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-4/igt@xe_waitfence@reltime.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          [SKIP][30] ([Intel XE#2321] / [Intel XE#7355]) -> [ABORT][31] ([Intel XE#8007])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][32] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][33] ([Intel XE#1729] / [Intel XE#7424])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8017
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447
  [Intel XE#8488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8488


Build changes
-------------

  * Linux: xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06 -> xe-pw-169511v7

  IGT_9002: 9002
  xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06: 7bb9a26014f9ba1b2cb1300252d1eeb83f169c06
  xe-pw-169511v7: 169511v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/index.html

--===============1516863762445361512==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add and use more KLV helpers (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169511/">https://patchwork.freedesktop.org/series/169511/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06_FULL -&gt; xe-pw-169511v7_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169511v7_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-9/igt@core_hotunplug@hotrebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-7/igt@core_hotunplug@hotrebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-7/igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-3/igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-lnl-3/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-lnl-6/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8488">Intel XE#8488</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-media:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-4/igt@xe_exec_reset@long-spin-many-preempt-media.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-5/igt@xe_exec_reset@long-spin-many-preempt-media.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-mlock-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-4/igt@xe_exec_system_allocator@many-malloc-mlock-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-8/igt@xe_exec_system_allocator@many-malloc-mlock-nomemset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Intel XE#8447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-9/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-10/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-3/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8017">Intel XE#8017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-4/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169511v7/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06 -&gt; xe-pw-169511v7</li>
</ul>
<p>IGT_9002: 9002<br />
  xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06: 7bb9a26014f9ba1b2cb1300252d1eeb83f169c06<br />
  xe-pw-169511v7: 169511v7</p>

</body>
</html>

--===============1516863762445361512==--
