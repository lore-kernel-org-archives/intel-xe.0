Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6FCEE6B6B
	for <intel-xe@archiver.kernel.org>; Sat,  7 Feb 2026 00:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB0910E1BB;
	Sat,  7 Feb 2026 00:04:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7D910E1BB;
 Sat,  7 Feb 2026 00:04:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3012636853172509298=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_series_starting_with_=5Bv2?=
 =?utf-8?q?=2C1/2=5D_drm/xe=3A_Move_number_of_XeCore_fuse_registers_to_graph?=
 =?utf-8?q?ics_descriptor?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Feb 2026 00:04:43 -0000
Message-ID: <177042268373.235304.3401892970054501733@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260205214139.48515-3-matthew.d.roper@intel.com>
In-Reply-To: <20260205214139.48515-3-matthew.d.roper@intel.com>
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

--===============3012636853172509298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/2] drm/xe: Move number of XeCore fuse registers to graphics descriptor
URL   : https://patchwork.freedesktop.org/series/161222/
State : success

== Summary ==

CI Bug Log - changes from xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3_FULL -> xe-pw-161222v1_FULL
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

  Here are the changes found in xe-pw-161222v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2252])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][4] -> [SKIP][5] ([Intel XE#2291])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#6715])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#2316]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2311]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2313]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7111] / [Intel XE#7130] / [Intel XE#7131])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7131])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7130]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7111] / [Intel XE#7131])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#4837])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][19] -> [INCOMPLETE][20] ([Intel XE#6321])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-imm:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7136])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][22] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-10/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][24] ([Intel XE#2291]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][26] ([Intel XE#5299]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-render:
    - shard-bmg:          [INCOMPLETE][28] ([Intel XE#6819]) -> [PASS][29] +1 other test pass
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-3/igt@kms_draw_crc@draw-method-render.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_draw_crc@draw-method-render.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [SKIP][30] ([Intel XE#2316]) -> [PASS][31] +1 other test pass
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-10/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][32] ([Intel XE#1503]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][34] ([Intel XE#2311]) -> [SKIP][35] ([Intel XE#2312]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][36] ([Intel XE#4141]) -> [SKIP][37] ([Intel XE#2312]) +7 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][38] ([Intel XE#2312]) -> [SKIP][39] ([Intel XE#2311]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][40] ([Intel XE#2313]) -> [SKIP][41] ([Intel XE#2312]) +8 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][42] ([Intel XE#2312]) -> [SKIP][43] ([Intel XE#2313]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][44] ([Intel XE#5021]) -> [SKIP][45] ([Intel XE#4596])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][46] ([Intel XE#5466] / [Intel XE#6652]) -> [ABORT][47] ([Intel XE#5466])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787


Build changes
-------------

  * Linux: xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3 -> xe-pw-161222v1

  IGT_8739: 8739
  xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3: af5dcbe7f59f0275168f750fc7c80160db3b6ab3
  xe-pw-161222v1: 161222v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/index.html

--===============3012636853172509298==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/2] drm/xe: Move number of XeCore fuse registers to graphics descriptor</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161222/">https://patchwork.freedesktop.org/series/161222/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3_FULL -&gt; xe-pw-161222v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161222v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_chamelium_frames@hdmi-crc-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715">Intel XE#6715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@xe_eudebug@discovery-race-vmbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-10/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-3/igt@kms_draw_crc@draw-method-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-9/igt@kms_draw_crc@draw-method-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-10/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3 -&gt; xe-pw-161222v1</li>
</ul>
<p>IGT_8739: 8739<br />
  xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3: af5dcbe7f59f0275168f750fc7c80160db3b6ab3<br />
  xe-pw-161222v1: 161222v1</p>

</body>
</html>

--===============3012636853172509298==--
