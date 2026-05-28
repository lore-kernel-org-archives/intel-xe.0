Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21445CD5BD1
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 11:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF3D10F06F;
	Thu, 28 May 2026 11:43:45 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DDC10F06E;
 Thu, 28 May 2026 11:43:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4136088133815904763=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_complete_perf=5Fallow=5F*_?=
 =?utf-8?q?trio_and_use_in_drm/xe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 May 2026 11:43:44 -0000
Message-ID: <177996862488.19961.5725952208080002011@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527225507.2044027-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260527225507.2044027-1-ashutosh.dixit@intel.com>
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

--===============4136088133815904763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: complete perf_allow_* trio and use in drm/xe (rev2)
URL   : https://patchwork.freedesktop.org/series/167137/
State : success

== Summary ==

CI Bug Log - changes from xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6_FULL -> xe-pw-167137v2_FULL
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

  Here are the changes found in xe-pw-167137v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bo-too-small:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#1727] / [Intel XE#6819])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-4/igt@kms_addfb_basic@bo-too-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-3/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#607] / [Intel XE#7361])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#7679])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +7 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2252])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2325] / [Intel XE#7358])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_chamelium_color@gamma.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#6969]) +10 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1138] / [Intel XE#7344])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#301])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2311]) +17 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#4141]) +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7061]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2350] / [Intel XE#7503])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2313]) +18 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#6911] / [Intel XE#7466])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7283])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7130]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1489]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7795])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_sharpness_filter@filter-strength:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#6503])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_sharpness_filter@filter-strength.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1499])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_copy_basic@mem-page-copy-17:
    - shard-lnl:          [PASS][31] -> [ABORT][32] ([Intel XE#8007])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-lnl-3/igt@xe_copy_basic@mem-page-copy-17.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-lnl-5/igt@xe_copy_basic@mem-page-copy-17.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7636]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7136]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#6874]) +8 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-basic-smem.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][37] ([Intel XE#7098] / [Intel XE#8159])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_system_allocator@threads-many-large-new:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#6703]) +127 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-large-new.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-new.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#6557] / [Intel XE#6703])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7138]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#6964])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_page_reclaim@prl-invalidate-full:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7793])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_page_reclaim@prl-invalidate-full.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4733] / [Intel XE#7417])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#944]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][47] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][48] +1 other test pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [INCOMPLETE][49] ([Intel XE#7935] / [Intel XE#8151]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][51] ([Intel XE#301]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][53] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][54] +1 other test pass
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][55] ([Intel XE#6321]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][57] ([Intel XE#1124]) -> [SKIP][58] ([Intel XE#6703])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][59] ([Intel XE#2328] / [Intel XE#7367]) -> [SKIP][60] ([Intel XE#6703])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][61] ([Intel XE#367]) -> [SKIP][62] ([Intel XE#6703])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-bmg:          [SKIP][63] ([Intel XE#2887]) -> [SKIP][64] ([Intel XE#6703]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][65] ([Intel XE#2252]) -> [SKIP][66] ([Intel XE#6703])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][67] ([Intel XE#2320]) -> [SKIP][68] ([Intel XE#6703])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][69] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][70] ([Intel XE#6703])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][71] ([Intel XE#2375]) -> [SKIP][72] ([Intel XE#6703])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][73] ([Intel XE#2311]) -> [SKIP][74] ([Intel XE#6703]) +8 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][75] ([Intel XE#4141]) -> [SKIP][76] ([Intel XE#6703]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][77] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][78] ([Intel XE#6703])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][79] ([Intel XE#2313]) -> [SKIP][80] ([Intel XE#6703]) +11 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][81] ([Intel XE#7061]) -> [SKIP][82] ([Intel XE#6703])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][83] ([Intel XE#1489]) -> [SKIP][84] ([Intel XE#6703]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@pr-primary-blt:
    - shard-bmg:          [SKIP][85] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][86] ([Intel XE#6703]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_psr@pr-primary-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_psr@pr-primary-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][87] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][88] ([Intel XE#1729] / [Intel XE#7424])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][89] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][90] ([Intel XE#2426] / [Intel XE#5848])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][91] ([Intel XE#1499]) -> [SKIP][92] ([Intel XE#6703])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_vrr@flip-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_vrr@flip-suspend.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][93] ([Intel XE#6599]) -> [SKIP][94] ([Intel XE#6703])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_compute@ccs-mode-basic.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][95] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350]) -> [SKIP][96] ([Intel XE#6703])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          [SKIP][97] ([Intel XE#7636]) -> [SKIP][98] ([Intel XE#6703])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-discovery.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][99] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][100] ([Intel XE#6703]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:
    - shard-bmg:          [SKIP][101] ([Intel XE#7136]) -> [SKIP][102] ([Intel XE#6703]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd:
    - shard-bmg:          [SKIP][103] ([Intel XE#6874]) -> [SKIP][104] ([Intel XE#6703]) +5 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind:
    - shard-bmg:          [SKIP][105] ([Intel XE#7138]) -> [SKIP][106] ([Intel XE#6703])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind.html

  * igt@xe_page_reclaim@random:
    - shard-bmg:          [SKIP][107] ([Intel XE#7793]) -> [SKIP][108] ([Intel XE#6703])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_page_reclaim@random.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_page_reclaim@random.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          [FAIL][109] ([Intel XE#7695]) -> [SKIP][110] ([Intel XE#6703])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_pat@pat-sw-hw-compare.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-bmg:          [SKIP][111] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][112] ([Intel XE#6703])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][113] ([Intel XE#944]) -> [SKIP][114] ([Intel XE#6703])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6 -> xe-pw-167137v2

  IGT_8939: 8939
  xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6: 7570b524ddecbe5db4af0c493a047e21bab6b3d6
  xe-pw-167137v2: 167137v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/index.html

--===============4136088133815904763==
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
<tr><td><b>Series:</b></td><td>complete perf_allow_* trio and use in drm/xe (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167137/">https://patchwork.freedesktop.org/series/167137/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6_FULL -&gt; xe-pw-167137v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167137v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-4/igt@kms_addfb_basic@bo-too-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-3/igt@kms_addfb_basic@bo-too-small.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_sharpness_filter@filter-strength.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-page-copy-17:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-lnl-3/igt@xe_copy_basic@mem-page-copy-17.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-lnl-5/igt@xe_copy_basic@mem-page-copy-17.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-large-new.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-new.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +127 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-invalidate-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_page_reclaim@prl-invalidate-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_pat@pat-sw-hw-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_pat@pat-sw-hw-compare.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167137v2/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6 -&gt; xe-pw-167137v2</li>
</ul>
<p>IGT_8939: 8939<br />
  xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6: 7570b524ddecbe5db4af0c493a047e21bab6b3d6<br />
  xe-pw-167137v2: 167137v2</p>

</body>
</html>

--===============4136088133815904763==--
