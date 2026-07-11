Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F8EC44501
	for <intel-xe@archiver.kernel.org>; Sat, 11 Jul 2026 09:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7A810E324;
	Sat, 11 Jul 2026 09:30:39 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E71C10E30E;
 Sat, 11 Jul 2026 09:30:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8054946216232845615=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_balance_exec_que?=
 =?utf-8?q?ue_suspend/resume_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 11 Jul 2026 09:30:38 -0000
Message-ID: <178376223849.178249.3150184400571786421@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260711020459.2049523-8-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260711020459.2049523-8-niranjana.vishwanathapura@intel.com>
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

--===============8054946216232845615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: balance exec queue suspend/resume (rev5)
URL   : https://patchwork.freedesktop.org/series/169125/
State : success

== Summary ==

CI Bug Log - changes from xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06_FULL -> xe-pw-169125v5_FULL
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

  Here are the changes found in xe-pw-169125v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#7571])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#3321]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2311]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2313]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2450] / [Intel XE#5857])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_exec_reset@long-spin-many-preempt:
    - shard-bmg:          [PASS][8] -> [FAIL][9] ([Intel XE#7956])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-6/igt@xe_exec_reset@long-spin-many-preempt.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#8378])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate-race.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [PASS][11] -> [FAIL][12] ([Intel XE#7992])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-9/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][13] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][15] ([Intel XE#3321]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][17] ([Intel XE#301]) -> [PASS][18] +4 other tests pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [FAIL][19] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3:
    - shard-bmg:          [FAIL][21] ([Intel XE#6266]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3.html

  * igt@xe_waitfence@reltime:
    - shard-bmg:          [FAIL][23] ([Intel XE#8017]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-3/igt@xe_waitfence@reltime.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-1/igt@xe_waitfence@reltime.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          [SKIP][25] ([Intel XE#2321] / [Intel XE#7355]) -> [ABORT][26] ([Intel XE#8007])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][27] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][28] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][29] ([Intel XE#3544]) -> [SKIP][30] ([Intel XE#3374] / [Intel XE#3544])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][31] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][32] ([Intel XE#1729] / [Intel XE#7424])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][33] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][34] ([Intel XE#2509] / [Intel XE#7437])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8017
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378


Build changes
-------------

  * Linux: xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06 -> xe-pw-169125v5

  IGT_9002: 9002
  xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06: 7bb9a26014f9ba1b2cb1300252d1eeb83f169c06
  xe-pw-169125v5: 169125v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/index.html

--===============8054946216232845615==
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
<tr><td><b>Series:</b></td><td>drm/xe: balance exec queue suspend/resume (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169125/">https://patchwork.freedesktop.org/series/169125/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06_FULL -&gt; xe-pw-169125v5_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169125v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-6/igt@xe_exec_reset@long-spin-many-preempt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-9/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-3/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8017">Intel XE#8017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-1/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v5/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06 -&gt; xe-pw-169125v5</li>
</ul>
<p>IGT_9002: 9002<br />
  xe-5386-7bb9a26014f9ba1b2cb1300252d1eeb83f169c06: 7bb9a26014f9ba1b2cb1300252d1eeb83f169c06<br />
  xe-pw-169125v5: 169125v5</p>

</body>
</html>

--===============8054946216232845615==--
