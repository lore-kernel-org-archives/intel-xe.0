Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C80CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 10:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF8310E8CA;
	Wed, 10 Jun 2026 10:56:17 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50A110E59E;
 Wed, 10 Jun 2026 10:56:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5246443552018856054=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/debugfs=3A_Expose_p?=
 =?utf-8?q?er-engine_idle_status?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Jun 2026 10:56:15 -0000
Message-ID: <178108897593.64488.7468975394665060286@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609195149.616010-2-sk.anirban@intel.com>
In-Reply-To: <20260609195149.616010-2-sk.anirban@intel.com>
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

--===============5246443552018856054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/debugfs: Expose per-engine idle status
URL   : https://patchwork.freedesktop.org/series/168204/
State : success

== Summary ==

CI Bug Log - changes from xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3_FULL -> xe-pw-168204v1_FULL
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

  Here are the changes found in xe-pw-168204v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6078])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2325] / [Intel XE#7358])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2252])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#3321]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#301] / [Intel XE#3149])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2311]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2313]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#1503])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#7922]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-3/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#7915]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7636]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][22] -> [INCOMPLETE][23] ([Intel XE#6321])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7136])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-priority:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#6874]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7138])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [PASS][28] -> [DMESG-WARN][29] ([Intel XE#6627] / [Intel XE#7419])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-10/igt@xe_survivability@runtime-survivability.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-8/igt@xe_survivability@runtime-survivability.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][30] -> [ABORT][31] ([Intel XE#8007])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html
    - shard-bmg:          [PASS][32] -> [ABORT][33] ([Intel XE#8007])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][34] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_getfb@getfb-reject-nv12:
    - shard-bmg:          [INCOMPLETE][36] ([Intel XE#2594]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-7/igt@kms_getfb@getfb-reject-nv12.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-10/igt@kms_getfb@getfb-reject-nv12.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][38] ([Intel XE#7915]) -> [PASS][39] +1 other test pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-7/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-3/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][40] ([Intel XE#6321]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][42] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][43] ([Intel XE#309] / [Intel XE#7343])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][44] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][45] ([Intel XE#301])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][46] ([Intel XE#301]) -> [FAIL][47] ([Intel XE#301] / [Intel XE#3149])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007


Build changes
-------------

  * Linux: xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3 -> xe-pw-168204v1

  IGT_8956: 8956
  xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3: 71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3
  xe-pw-168204v1: 168204v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/index.html

--===============5246443552018856054==
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
<tr><td><b>Series:</b></td><td>drm/xe/debugfs: Expose per-engine idle status</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168204/">https://patchwork.freedesktop.org/series/168204/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3_FULL -&gt; xe-pw-168204v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168204v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-3/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-10/igt@xe_survivability@runtime-survivability.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-8/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-7/igt@kms_getfb@getfb-reject-nv12.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-10/igt@kms_getfb@getfb-reject-nv12.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-7/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-3/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3 -&gt; xe-pw-168204v1</li>
</ul>
<p>IGT_8956: 8956<br />
  xe-5227-71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3: 71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3<br />
  xe-pw-168204v1: 168204v1</p>

</body>
</html>

--===============5246443552018856054==--
