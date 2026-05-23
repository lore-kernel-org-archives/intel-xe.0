Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA43CD4F54
	for <intel-xe@archiver.kernel.org>; Sat, 23 May 2026 08:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F4C10E05D;
	Sat, 23 May 2026 08:15:24 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4D510E05D;
 Sat, 23 May 2026 08:15:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2187613046547528149=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_DRM_RAS_Fixes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 23 May 2026 08:15:22 -0000
Message-ID: <177952412257.2445.13453900089125319463@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260523050212.557292-1-raag.jadav@intel.com>
In-Reply-To: <20260523050212.557292-1-raag.jadav@intel.com>
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

--===============2187613046547528149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DRM RAS Fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/166595/
State : success

== Summary ==

CI Bug Log - changes from xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f_FULL -> xe-pw-166595v2_FULL
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

  Here are the changes found in xe-pw-166595v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6078]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1407]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#7059] / [Intel XE#7085])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#6974])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1424]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#2321] / [Intel XE#7355])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2320])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#309] / [Intel XE#7343])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#4422] / [Intel XE#7442])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1421])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#301])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [PASS][17] -> [DMESG-FAIL][18] ([Intel XE#5545] / [Intel XE#7774]) +1 other test dmesg-fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_flip@plain-flip-ts-check.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2311]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#656] / [Intel XE#7905]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#6312])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#4141]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#7061]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#7865]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7905]) +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2313]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7061] / [Intel XE#7356])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7061])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1503] / [Intel XE#7915])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-swap@pipe-a-edp-1-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7915]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_hdr@static-swap@pipe-a-edp-1-xrgb2101010.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#7915]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-6/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-8/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7283])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7283])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1489])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#4608])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#4608] / [Intel XE#7304])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr@pr-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1406])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_psr@pr-suspend.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@xe_ccs@vm-bind-decompress:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7644])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_ccs@vm-bind-decompress.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7636]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7636]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#6540] / [Intel XE#688])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#7482])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2322] / [Intel XE#7372])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1392]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#7136]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#7136]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#6874]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#6874])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-6/igt@xe_exec_multi_queue@one-queue-priority-smem.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#6703]) +133 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_madvise@atomic-device:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#7980])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_madvise@atomic-device.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1948])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#584] / [Intel XE#7369])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4733] / [Intel XE#7417])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:
    - shard-bmg:          [INCOMPLETE][62] ([Intel XE#4912]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-dp-2:
    - shard-bmg:          [FAIL][64] ([Intel XE#6841]) -> [PASS][65] +1 other test pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-5/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-dp-2.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-8/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [INCOMPLETE][66] ([Intel XE#8151]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][68] ([Intel XE#301]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-lnl:          [INCOMPLETE][70] -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][72] ([Intel XE#1503]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][74] ([Intel XE#7922]) -> [PASS][75] +1 other test pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-5/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][76] ([Intel XE#7915]) -> [PASS][77] +1 other test pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-3/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-4/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [FAIL][78] -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-6/igt@kms_pm_rpm@i2c.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-8/igt@kms_pm_rpm@i2c.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][80] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][81] ([Intel XE#6703])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][82] ([Intel XE#1124]) -> [SKIP][83] ([Intel XE#6703]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][84] ([Intel XE#607] / [Intel XE#7361]) -> [SKIP][85] ([Intel XE#6703])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][86] ([Intel XE#7679]) -> [SKIP][87] ([Intel XE#6703])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][88] ([Intel XE#2887]) -> [SKIP][89] ([Intel XE#6703]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][90] ([Intel XE#2652]) -> [SKIP][91] ([Intel XE#6703])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-bmg:          [SKIP][92] ([Intel XE#2252]) -> [SKIP][93] ([Intel XE#6703]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][94] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][95] ([Intel XE#6703])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_content_protection@atomic-dpms.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-bmg:          [SKIP][96] ([Intel XE#2320]) -> [SKIP][97] ([Intel XE#6703])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-bmg:          [SKIP][98] ([Intel XE#7179]) -> [SKIP][99] ([Intel XE#6703])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][100] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][101] ([Intel XE#6703])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][102] ([Intel XE#7061]) -> [SKIP][103] ([Intel XE#6703]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][104] ([Intel XE#4141]) -> [SKIP][105] ([Intel XE#6703]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          [SKIP][106] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][107] ([Intel XE#6703])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][108] ([Intel XE#2311]) -> [SKIP][109] ([Intel XE#6703]) +11 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][110] ([Intel XE#2313]) -> [SKIP][111] ([Intel XE#6703]) +12 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][112] ([Intel XE#6911] / [Intel XE#7466]) -> [SKIP][113] ([Intel XE#6703])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][114] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][115] ([Intel XE#6703])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_pm_backlight@fade.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_pm_backlight@fade.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][116] ([Intel XE#1489]) -> [SKIP][117] ([Intel XE#6703]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][118] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][119] ([Intel XE#6703]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_psr@psr-sprite-plane-onoff.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][120] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][121] ([Intel XE#2426] / [Intel XE#5848])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][122] ([Intel XE#7636]) -> [SKIP][123] ([Intel XE#6703]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_eudebug_online@single-step.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_eudebug_online@single-step.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          [SKIP][124] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][125] ([Intel XE#6703])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [SKIP][126] ([Intel XE#7136]) -> [SKIP][127] ([Intel XE#6703]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr:
    - shard-bmg:          [SKIP][128] ([Intel XE#6874]) -> [SKIP][129] ([Intel XE#6703]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][130] ([Intel XE#7866]) -> [SKIP][131] ([Intel XE#6703])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          [INCOMPLETE][132] ([Intel XE#7098] / [Intel XE#8159]) -> [SKIP][133] ([Intel XE#6703])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          [SKIP][134] ([Intel XE#7138]) -> [SKIP][135] ([Intel XE#6703]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          [SKIP][136] ([Intel XE#7793]) -> [SKIP][137] ([Intel XE#6703])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_page_reclaim@basic-mixed.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          [FAIL][138] ([Intel XE#7695]) -> [SKIP][139] ([Intel XE#6703])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_pat@pat-sw-hw-reset-compare.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          [SKIP][140] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][141] ([Intel XE#6703])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870


Build changes
-------------

  * Linux: xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f -> xe-pw-166595v2

  IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f: ca274c47b66d01ca8986007a2d7d395aa5cf247f
  xe-pw-166595v2: 166595v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/index.html

--===============2187613046547528149==
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
<tr><td><b>Series:</b></td><td>DRM RAS Fixes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166595/">https://patchwork.freedesktop.org/series/166595/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f_FULL -&gt; xe-pw-166595v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166595v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_flip@plain-flip-ts-check.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_hdr@static-swap@pipe-a-edp-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-6/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-8/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-decompress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_ccs@vm-bind-decompress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@sysfs-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_eudebug@sysfs-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-6/igt@xe_exec_multi_queue@one-queue-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +133 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-device:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_madvise@atomic-device.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912">Intel XE#4912</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-5/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841">Intel XE#6841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-8/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-5/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-3/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-4/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-6/igt@kms_pm_rpm@i2c.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-8/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_pat@pat-sw-hw-reset-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_pat@pat-sw-hw-reset-compare.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v2/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f -&gt; xe-pw-166595v2</li>
</ul>
<p>IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5119-ca274c47b66d01ca8986007a2d7d395aa5cf247f: ca274c47b66d01ca8986007a2d7d395aa5cf247f<br />
  xe-pw-166595v2: 166595v2</p>

</body>
</html>

--===============2187613046547528149==--
