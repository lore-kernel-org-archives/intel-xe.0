Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A557EE20A4
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 13:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE9A10E66C;
	Fri,  6 Feb 2026 13:33:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660B010E66C;
 Fri,  6 Feb 2026 13:33:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2626123338409373065=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_update_the_stolen_memory_a?=
 =?utf-8?q?llocation_preference?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Feb 2026 13:33:07 -0000
Message-ID: <177038478739.232294.4054272970037167346@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260205140235.338410-1-vinod.govindapillai@intel.com>
In-Reply-To: <20260205140235.338410-1-vinod.govindapillai@intel.com>
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

--===============2626123338409373065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: update the stolen memory allocation preference
URL   : https://patchwork.freedesktop.org/series/161200/
State : failure

== Summary ==

CI Bug Log - changes from xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692_FULL -> xe-pw-161200v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161200v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161200v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161200v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-lnl:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-lnl-7/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-lnl-8/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in xe-pw-161200v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2328])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#2314] / [Intel XE#2894])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#367])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2887]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2724])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2252]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#3304])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][14] ([Intel XE#1178] / [Intel XE#3304]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2321])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2320])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2291]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2373])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2374])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][22] -> [DMESG-WARN][23] ([Intel XE#3428] / [Intel XE#5208])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][24] -> [DMESG-WARN][25] ([Intel XE#3428])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2316]) +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#301]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][30] -> [INCOMPLETE][31] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7178]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4141]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2352])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2311]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2313]) +6 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7061]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7131]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#4596])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-1/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#1406] / [Intel XE#2234])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_psr@psr2-primary-render.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6503]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1499])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_vrr@flipline.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#4837]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4837] / [Intel XE#6665])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][48] -> [INCOMPLETE][49] ([Intel XE#6321])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2322]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7136]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-imm.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#6874]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4943]) +10 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_threads@threads-multi-queue-cm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7138]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-userptr.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#6964])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2236])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2284])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4733])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#944])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][60] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - shard-bmg:          [FAIL][62] ([Intel XE#6841]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@kms_cursor_edge_walk@256x256-top-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [SKIP][64] ([Intel XE#2291]) -> [PASS][65] +8 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-10/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][66] ([Intel XE#4302]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-10/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][68] ([Intel XE#3009]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_dp_aux_dev.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][70] ([Intel XE#2316]) -> [PASS][71] +9 other tests pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-10/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][72] ([Intel XE#1503]) -> [PASS][73] +1 other test pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-5/igt@kms_hdr@static-swap.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][74] ([Intel XE#1435]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-10/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][76] ([Intel XE#1499]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-10/igt@kms_vrr@negative-basic.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          [SKIP][78] ([Intel XE#7194]) -> [FAIL][79] ([Intel XE#3304])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_content_protection@atomic-hdcp14.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][80] ([Intel XE#2312]) -> [SKIP][81] ([Intel XE#2311]) +14 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][82] ([Intel XE#2311]) -> [SKIP][83] ([Intel XE#2312]) +11 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][84] ([Intel XE#4141]) -> [SKIP][85] ([Intel XE#2312]) +11 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][86] ([Intel XE#2312]) -> [SKIP][87] ([Intel XE#4141]) +7 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][88] ([Intel XE#2313]) -> [SKIP][89] ([Intel XE#2312]) +16 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][90] ([Intel XE#2312]) -> [SKIP][91] ([Intel XE#2313]) +16 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][92] ([Intel XE#3544]) -> [SKIP][93] ([Intel XE#3374] / [Intel XE#3544])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][94] ([Intel XE#5021]) -> [SKIP][95] ([Intel XE#4596])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][96] ([Intel XE#2426]) -> [SKIP][97] ([Intel XE#2509])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [SKIP][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [DMESG-FAIL][120], [PASS][121], [PASS][122], [PASS][123]) ([Intel XE#2457] / [Intel XE#6652]) -> ([PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [SKIP][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149]) ([Intel XE#2457])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-10/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-2/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-4/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-3/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-8/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-9/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-3/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-9/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-8/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-7/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-8/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-2/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-4/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-4/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-10/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-1/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-1/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-7/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-5/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-2/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-10/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-5/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-5/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-10/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-1/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-1/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-7/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-2/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-2/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-8/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-1/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-8/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-2/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-8/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-4/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-7/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-2/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-10/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@xe_module_load@load.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692 -> xe-pw-161200v1

  IGT_8739: 8739
  xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692: 2134641837dc23e9a7cb911c1d9eb590bc265692
  xe-pw-161200v1: 161200v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/index.html

--===============2626123338409373065==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>update the stolen memory allocation preferen=
ce</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/161200/">https://patchwork.freedesktop.org/series/161200/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-161200v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-161200v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4507-2134641837dc23e9a7cb911c1d9eb590b=
c265692_FULL -&gt; xe-pw-161200v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161200v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-161200v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1612=
00v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-lnl-7/igt@xe_exec_=
threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-lnl-8/i=
gt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">ABORT</a><=
/li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161200v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_big_fb@4-tiled-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_big_fb@y-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_bw@linear-tiling-1-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_chamelium_frames@dp-crc-s=
ingle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@kms_content_protection@atomic=
-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_cursor_crc@cursor-onscree=
n-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding=
-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-10/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/s=
hard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varyin=
g-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-4/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_feature_discovery@psr1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@kms_flip@2x=
-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/=
igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428=
">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-3/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-lnl-2/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-9/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-4/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +=
1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcp=
sr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane=
-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_plane@pixel-format-x-tile=
d-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/igt@kms_plane_multiple@2x-=
tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-1/igt@kms_psr@fbc-psr-sprite-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_psr@psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_sharpness_filter@filter-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@kms_vrr@flipline.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_eudebug@basic-read-event.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_eudebug_online@writes-cach=
ing-vram-bb-sram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-2/igt@xe_evict=
@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@xe_evict@evic=
t-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-mult=
i-queue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7136">Intel XE#7136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_exec_system_allocator@proc=
ess-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +10 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_exec_threads@threads-multi=
-queue-cm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-concurre=
nt-access-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_pm@s4-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_pxp@pxp-stale-queue-post-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_query@multigpu-query-uc-fw=
-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-161200v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-2/igt@kms_curs=
or_edge_walk@256x256-top-edge.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6841">Intel XE#6841</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@k=
ms_cursor_edge_walk@256x256-top-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-10=
/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> +8 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-10/igt@=
kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-10/igt@kms=
_flip@2x-plain-flip-fb-recreate.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-5/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/igt@kms_hdr@static-swap=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-10/igt@kms_s=
etmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-10/igt@kms_vrr@negativ=
e-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_cont=
ent_protection@atomic-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7194">Intel XE#7194</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@km=
s_content_protection@atomic-hdcp14.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v=
1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
200v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1612=
00v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1612=
00v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
1200v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pg=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1612=
00v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-4/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-1/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-10/igt@kms_pla=
ne_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@kms_pla=
ne_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/sha=
rd-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509"=
>Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-10/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-=
bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/sh=
ard-bmg-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc26569=
2/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc2=
65692/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb59=
0bc265692/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9=
eb590bc265692/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb9=
11c1d9eb590bc265692/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a=
7cb911c1d9eb590bc265692/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc2=
3e9a7cb911c1d9eb590bc265692/shard-bmg-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-213464183=
7dc23e9a7cb911c1d9eb590bc265692/shard-bmg-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-21346=
41837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2=
134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-45=
07-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-4/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-10/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692/shard-=
bmg-2/igt@xe_module_load@load.html">DMESG-FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265=
692/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9eb590=
bc265692/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4507-2134641837dc23e9a7cb911c1d9e=
b590bc265692/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652"=
>Intel XE#6652</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-161200v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
200v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-161200v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg=
-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
200v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-161200v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
200v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-161200v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
200v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-161200v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg=
-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
200v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161200v1/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-161200v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel =
XE#2457</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692 -&gt; xe-pw-161=
200v1</li>
</ul>
<p>IGT_8739: 8739<br />
  xe-4507-2134641837dc23e9a7cb911c1d9eb590bc265692: 2134641837dc23e9a7cb911=
c1d9eb590bc265692<br />
  xe-pw-161200v1: 161200v1</p>

</body>
</html>

--===============2626123338409373065==--
