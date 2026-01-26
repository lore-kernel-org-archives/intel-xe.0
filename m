Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47091CF65CB
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 09:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E5310E3FA;
	Mon, 26 Jan 2026 09:50:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68A610E3F3;
 Mon, 26 Jan 2026 09:50:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1071139251516882048=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Use_trans_push_mechanism_t?=
 =?utf-8?q?o_generate_frame_change_event_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jan 2026 09:50:40 -0000
Message-ID: <176942104067.192124.18077035728140281528@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260126075959.925413-1-jouni.hogander@intel.com>
In-Reply-To: <20260126075959.925413-1-jouni.hogander@intel.com>
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

--===============1071139251516882048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use trans push mechanism to generate frame change event (rev10)
URL   : https://patchwork.freedesktop.org/series/139831/
State : failure

== Summary ==

CI Bug Log - changes from xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b_FULL -> xe-pw-139831v10_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-139831v10_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139831v10_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139831v10_FULL:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind:
    - shard-bmg:          [SKIP][1] ([Intel XE#7136]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-139831v10_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#5993]) +3 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#7059])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2887]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2724])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2252]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#1178] / [Intel XE#3304]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2321])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2320]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][16] -> [FAIL][17] ([Intel XE#4633])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][18] -> [FAIL][19] ([Intel XE#5299])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2286])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#4422])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][22] -> [FAIL][23] ([Intel XE#7030]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2293]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4141]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2311]) +14 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7061]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2313]) +11 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6901])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2486])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#6912])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#5021])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@pr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@kms_psr@pr-primary-render.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1406] / [Intel XE#2234])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1406] / [Intel XE#2414])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#3414] / [Intel XE#3904])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2413])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6503])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2504])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4837]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@pagefault-write-stress:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#6665] / [Intel XE#6681])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_eudebug_online@pagefault-write-stress.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4837] / [Intel XE#6665])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2322]) +7 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7136]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#6703]) +23 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@max-queues-basic:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#6874]) +8 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_exec_multi_queue@max-queues-basic.html

  * igt@xe_exec_system_allocator@many-64k-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#5007])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_exec_system_allocator@many-64k-mmap-huge.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#4943]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro:
    - shard-bmg:          [PASS][52] -> [ABORT][53] ([Intel XE#5545])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7138]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#6281])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#6964]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2427] / [Intel XE#6953])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-1/igt@xe_peer2peer@write.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4733])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#944])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-dp-2:
    - shard-bmg:          [INCOMPLETE][60] -> [PASS][61] +1 other test pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-dp-2.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-1/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-bmg:          [FAIL][62] ([Intel XE#6747]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][64] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][65] +1 other test pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][66] ([Intel XE#1503]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][68] ([Intel XE#6321]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset:
    - shard-bmg:          [ABORT][70] -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-7/igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [FAIL][72] ([Intel XE#5625]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  
#### Warnings ####

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][74] ([Intel XE#2887]) -> [SKIP][75] ([Intel XE#6703]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          [SKIP][76] ([Intel XE#2325]) -> [SKIP][77] ([Intel XE#6703])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@kms_chamelium_color@ctm-0-75.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          [ABORT][78] -> [SKIP][79] ([Intel XE#4141])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][80] ([Intel XE#7061]) -> [SKIP][81] ([Intel XE#6703])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][82] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][83] ([Intel XE#1406] / [Intel XE#6703])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][84] ([Intel XE#1729]) -> [SKIP][85] ([Intel XE#2426])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-bmg:          [SKIP][86] ([Intel XE#4837]) -> [SKIP][87] ([Intel XE#6703])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][88] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][89] ([Intel XE#6703])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:
    - shard-bmg:          [SKIP][90] ([Intel XE#6874]) -> [SKIP][91] ([Intel XE#6703]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file:
    - shard-lnl:          [DMESG-WARN][92] ([Intel XE#4537] / [Intel XE#7063]) -> [DMESG-WARN][93] ([Intel XE#7063])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file.html

  * igt@xe_exec_system_allocator@twice-large-mmap-free-huge:
    - shard-bmg:          [SKIP][94] ([Intel XE#4943]) -> [SKIP][95] ([Intel XE#6703])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_exec_system_allocator@twice-large-mmap-free-huge.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-mmap-free-huge.html

  * igt@xe_exec_threads@threads-multi-queue-userptr:
    - shard-bmg:          [SKIP][96] ([Intel XE#7138]) -> [SKIP][97] ([Intel XE#6703])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-userptr.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-userptr.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][98] ([Intel XE#2284]) -> [SKIP][99] ([Intel XE#6703])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6747
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7030]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7030
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b -> xe-pw-139831v10

  IGT_8716: 8716
  xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b: 6d7af7c5b6b121d5595b64be7dfcbf33be53287b
  xe-pw-139831v10: 139831v10

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/index.html

--===============1071139251516882048==
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
<tr><td><b>Series:</b></td><td>Use trans push mechanism to generate frame change event (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139831/">https://patchwork.freedesktop.org/series/139831/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b_FULL -&gt; xe-pw-139831v10_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-139831v10_FULL need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139831v10_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139831v10_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139831v10_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7030">Intel XE#7030</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@kms_psr@pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_eudebug@vm-bind-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_eudebug_online@pagefault-write-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_exec_multi_queue@max-queues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_exec_system_allocator@many-64k-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-ro.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_multigpu_svm@mgpu-latency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-1/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-10/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-dp-2.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-1/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6747">Intel XE#6747</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x256.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-7/igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537">Intel XE#4537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-file.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_exec_system_allocator@twice-large-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v10/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b -&gt; xe-pw-139831v10</li>
</ul>
<p>IGT_8716: 8716<br />
  xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b: 6d7af7c5b6b121d5595b64be7dfcbf33be53287b<br />
  xe-pw-139831v10: 139831v10</p>

</body>
</html>

--===============1071139251516882048==--
