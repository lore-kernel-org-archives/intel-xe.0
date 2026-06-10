Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6F7CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 14:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DC389FF9;
	Wed, 10 Jun 2026 14:45:41 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DDA89FA5;
 Wed, 10 Jun 2026 14:45:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1654388885341908446=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/scaler=3A_allocat?=
 =?utf-8?q?ion_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Jun 2026 14:45:40 -0000
Message-ID: <178110274032.64641.1914228303963687165@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609231217.208357-1-michal.grzelak@intel.com>
In-Reply-To: <20260609231217.208357-1-michal.grzelak@intel.com>
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

--===============1654388885341908446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/scaler: allocation cleanup
URL   : https://patchwork.freedesktop.org/series/168206/
State : success

== Summary ==

CI Bug Log - changes from xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a_FULL -> xe-pw-168206v1_FULL
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

  Here are the changes found in xe-pw-168206v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#1124]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2887]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2325] / [Intel XE#7358])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2252])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2320])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][6] -> [FAIL][7] ([Intel XE#301])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2311]) +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2313]) +12 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#7915]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-1/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-6/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2234] / [Intel XE#2850])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#6361]) +2 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#6503])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7636]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#5793] / [Intel XE#7320] / [Intel XE#7464])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7136])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-priority:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#6874]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7138])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [PASS][22] -> [DMESG-WARN][23] ([Intel XE#6627] / [Intel XE#7419])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-8/igt@xe_survivability@runtime-survivability.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-3/igt@xe_survivability@runtime-survivability.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][24] ([Intel XE#301]) -> [PASS][25] +1 other test pass
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][26] ([Intel XE#1503]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-10/igt@kms_hdr@invalid-hdr.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][28] ([Intel XE#7922]) -> [PASS][29] +1 other test pass
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [INCOMPLETE][30] -> [PASS][31] +1 other test pass
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][32] ([Intel XE#2142]) -> [PASS][33] +1 other test pass
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:
    - shard-bmg:          [FAIL][34] ([Intel XE#7850]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-9/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][36] ([Intel XE#3544] / [Intel XE#7916]) -> [SKIP][37] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][38] ([Intel XE#7916]) -> [SKIP][39] ([Intel XE#7915]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][40] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][41] ([Intel XE#1729] / [Intel XE#7424])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][42] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][43] ([Intel XE#2509] / [Intel XE#7437])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7320
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922


Build changes
-------------

  * Linux: xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a -> xe-pw-168206v1

  IGT_8956: 8956
  xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a: 724e06af260b571e2d970d4a806ae3d620ff0b7a
  xe-pw-168206v1: 168206v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/index.html

--===============1654388885341908446==
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
<tr><td><b>Series:</b></td><td>drm/i915/scaler: allocation cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168206/">https://patchwork.freedesktop.org/series/168206/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a_FULL -&gt; xe-pw-168206v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168206v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-1/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-6/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7320">Intel XE#7320</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464">Intel XE#7464</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-8/igt@xe_survivability@runtime-survivability.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-3/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-9/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-7/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168206v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a -&gt; xe-pw-168206v1</li>
</ul>
<p>IGT_8956: 8956<br />
  xe-5230-724e06af260b571e2d970d4a806ae3d620ff0b7a: 724e06af260b571e2d970d4a806ae3d620ff0b7a<br />
  xe-pw-168206v1: 168206v1</p>

</body>
</html>

--===============1654388885341908446==--
