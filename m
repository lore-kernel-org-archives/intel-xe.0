Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12083CF65E2
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 11:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90C910E1CD;
	Mon, 26 Jan 2026 11:42:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693F610E1CD;
 Mon, 26 Jan 2026 11:42:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5252210429299923001=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/ptl=3A_Disable_DCC_?=
 =?utf-8?q?on_PTL_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jan 2026 11:42:07 -0000
Message-ID: <176942772742.192124.3739913494760652979@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260124005917.398522-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260124005917.398522-1-vinay.belgaumkar@intel.com>
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

--===============5252210429299923001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ptl: Disable DCC on PTL (rev5)
URL   : https://patchwork.freedesktop.org/series/160388/
State : success

== Summary ==

CI Bug Log - changes from xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9_FULL -> xe-pw-160388v5_FULL
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

  Here are the changes found in xe-pw-160388v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#1124])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2887])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2341])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_content_protection@type1.html

  * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:
    - shard-bmg:          [PASS][4] -> ([PASS][5], [FAIL][6], [PASS][7]) ([Intel XE#6841]) +1 other test ( 1 fail, 2 pass )
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-8/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2244])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [PASS][9] -> ([FAIL][10], [PASS][11], [PASS][12]) ([Intel XE#3321]) +1 other test ( 1 fail, 2 pass )
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][13], [SKIP][14]) ([Intel XE#656])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7061]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2311]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> ([SKIP][17], [SKIP][18]) ([Intel XE#7061])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2313]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][20] -> ([ABORT][21], [PASS][22], [PASS][23]) ([Intel XE#5175])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - shard-bmg:          [PASS][24] -> ([PASS][25], [ABORT][26], [PASS][27]) ([Intel XE#1727])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2.html

  * igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - shard-bmg:          [PASS][28] -> ([PASS][29], [PASS][30], [INCOMPLETE][31]) ([Intel XE#6652])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#1439] / [Intel XE#836])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_sharpness_filter@filter-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#6503])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_sharpness_filter@filter-dpms.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
    - shard-lnl:          [PASS][34] -> ([DMESG-WARN][35], [PASS][36], [DMESG-WARN][37]) ([Intel XE#4537]) +1 other test ( 2 dmesg-warn, 1 pass )
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-lnl-5/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-7/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-4/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-8/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1499])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_vrr@max-min.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4837] / [Intel XE#6665])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][40] -> ([PASS][41], [INCOMPLETE][42]) ([Intel XE#6321])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2322])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-execs-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6874])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-close-fd-smem.html

  * igt@xe_exec_system_allocator@once-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4943]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_exec_system_allocator@once-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file:
    - shard-lnl:          [PASS][46] -> ([DMESG-WARN][47], [DMESG-WARN][48]) ([Intel XE#7063])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-lnl-8/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> ([SKIP][49], [SKIP][50]) ([Intel XE#4943])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap:
    - shard-bmg:          [PASS][51] -> ([PASS][52], [PASS][53], [ABORT][54]) ([Intel XE#5545])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7138]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2284])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4733])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_pxp@pxp-optout.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][58] ([Intel XE#5299]) -> ([PASS][59], [PASS][60], [PASS][61])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@xe_vm@large-binds-16777216:
    - shard-bmg:          [INCOMPLETE][62] ([Intel XE#2594]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-7/igt@xe_vm@large-binds-16777216.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_vm@large-binds-16777216.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][64] ([Intel XE#4633]) -> ([PASS][65], [FAIL][66], [PASS][67]) ([Intel XE#4633])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][68] ([Intel XE#5299]) -> ([FAIL][69], [PASS][70]) ([Intel XE#5299])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [DMESG-WARN][71] ([Intel XE#5354]) -> ([DMESG-WARN][72], [DMESG-WARN][73], [PASS][74]) ([Intel XE#5354])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][75] ([Intel XE#2049] / [Intel XE#2597]) -> ([INCOMPLETE][76], [PASS][77]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 1 incomplete, 1 pass )
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          [DMESG-WARN][78] ([Intel XE#7063]) -> ([DMESG-WARN][79], [PASS][80]) ([Intel XE#7063])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][81] ([Intel XE#3374] / [Intel XE#3544]) -> ([SKIP][82], [SKIP][83]) ([Intel XE#3544])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][84] ([Intel XE#1503]) -> ([SKIP][85], [PASS][86], [PASS][87]) ([Intel XE#1503])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][88] ([Intel XE#2426]) -> ([FAIL][89], [FAIL][90]) ([Intel XE#1729])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][91] ([Intel XE#2509]) -> ([SKIP][92], [SKIP][93], [SKIP][94]) ([Intel XE#2426] / [Intel XE#2509])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836


Build changes
-------------

  * Linux: xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9 -> xe-pw-160388v5

  IGT_8716: 8716
  xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9: a47173257e3d0aeae02f59baad97046bee0b7ce9
  xe-pw-160388v5: 160388v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/index.html

--===============5252210429299923001==
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
<tr><td><b>Series:</b></td><td>drm/xe/ptl: Disable DCC on PTL (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160388/">https://patchwork.freedesktop.org/series/160388/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9_FULL -&gt; xe-pw-160388v5_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160388v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-8/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841">Intel XE#6841</a>) +1 other test ( 1 fail, 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test ( 1 fail, 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175">Intel XE#5175</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_sharpness_filter@filter-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-lnl-5/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-7/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-4/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-8/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537">Intel XE#4537</a>) +1 other test ( 2 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_exec_system_allocator@once-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-lnl-8/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge-nomemset.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-shared-remap.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-16777216:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-7/igt@xe_vm@large-binds-16777216.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@xe_vm@large-binds-16777216.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_flip@flip-vs-suspend.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v5/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9 -&gt; xe-pw-160388v5</li>
</ul>
<p>IGT_8716: 8716<br />
  xe-4443-a47173257e3d0aeae02f59baad97046bee0b7ce9: a47173257e3d0aeae02f59baad97046bee0b7ce9<br />
  xe-pw-160388v5: 160388v5</p>

</body>
</html>

--===============5252210429299923001==--
