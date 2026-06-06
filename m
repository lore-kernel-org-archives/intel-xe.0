Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5261ACD6E75
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jun 2026 04:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D978510E555;
	Sat,  6 Jun 2026 04:11:28 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C75910E555;
 Sat,  6 Jun 2026 04:11:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6386383474088280090=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_improve_Kconfig?=
 =?utf-8?q?=2Eprofile_help_text_for_scheduler_timeouts_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 06 Jun 2026 04:11:27 -0000
Message-ID: <178071908744.49962.6121453780570166782@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260605140951.958172-2-rodrigo.vivi@intel.com>
In-Reply-To: <20260605140951.958172-2-rodrigo.vivi@intel.com>
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

--===============6386383474088280090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: improve Kconfig.profile help text for scheduler timeouts (rev2)
URL   : https://patchwork.freedesktop.org/series/167489/
State : success

== Summary ==

CI Bug Log - changes from xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b_FULL -> xe-pw-167489v2_FULL
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

  Here are the changes found in xe-pw-167489v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327]) +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#610] / [Intel XE#7387])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#7679])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2887]) +5 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#3432])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2252]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#6974])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][10] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2320])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#8265]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7178] / [Intel XE#7351])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7179])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2311]) +15 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#4141]) +9 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7061]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#656] / [Intel XE#7905])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2313]) +20 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#7915]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-bmg-6/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#4298] / [Intel XE#5873])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7130]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1489]) +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7795])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#3904] / [Intel XE#7342])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6503])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1499])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_vrr@flip-dpms.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7636]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7140])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7136]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html

  * igt@xe_exec_multi_queue@max-queues-basic:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#6874]) +9 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_exec_multi_queue@max-queues-basic.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7138]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#6964])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7793]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          NOTRUN -> [FAIL][40] ([Intel XE#7695])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4733] / [Intel XE#7417])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7892])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-lnl-4/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          NOTRUN -> [ABORT][43] ([Intel XE#8007])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][44] ([Intel XE#301]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][46] ([Intel XE#7915]) -> [PASS][47] +3 other tests pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-bmg-7/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-5/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_sequence@get-forked-busy@pipe-c-edp-1:
    - shard-lnl:          [INCOMPLETE][48] -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-lnl-4/igt@kms_sequence@get-forked-busy@pipe-c-edp-1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-lnl-4/igt@kms_sequence@get-forked-busy@pipe-c-edp-1.html

  * igt@xe_exec_system_allocator@fault-process-benchmark:
    - shard-bmg:          [FAIL][50] ([Intel XE#7850]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-bmg-6/igt@xe_exec_system_allocator@fault-process-benchmark.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-5/igt@xe_exec_system_allocator@fault-process-benchmark.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][52] ([Intel XE#3544] / [Intel XE#7916]) -> [SKIP][53] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][54] ([Intel XE#7916]) -> [SKIP][55] ([Intel XE#7915]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-bmg-5/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-7/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][56] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][57] ([Intel XE#2426] / [Intel XE#5848])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265


Build changes
-------------

  * Linux: xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b -> xe-pw-167489v2

  IGT_8950: 8950
  xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b: 979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b
  xe-pw-167489v2: 167489v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/index.html

--===============6386383474088280090==
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
<tr><td><b>Series:</b></td><td>drm/xe: improve Kconfig.profile help text for scheduler timeouts (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167489/">https://patchwork.freedesktop.org/series/167489/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b_FULL -&gt; xe-pw-167489v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167489v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-bmg-6/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_exec_multi_queue@max-queues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-1/igt@xe_page_reclaim@binds-null-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_pat@pat-sw-hw-reset-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-defer:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-lnl-4/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-bmg-7/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-5/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-lnl-4/igt@kms_sequence@get-forked-busy@pipe-c-edp-1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-lnl-4/igt@kms_sequence@get-forked-busy@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-process-benchmark:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-bmg-6/igt@xe_exec_system_allocator@fault-process-benchmark.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-5/igt@xe_exec_system_allocator@fault-process-benchmark.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-bmg-5/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-7/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167489v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b -&gt; xe-pw-167489v2</li>
</ul>
<p>IGT_8950: 8950<br />
  xe-5211-979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b: 979f5a1e19ce3f36c43dd92314b7e1500a5d5b3b<br />
  xe-pw-167489v2: 167489v2</p>

</body>
</html>

--===============6386383474088280090==--
