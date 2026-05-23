Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB318CD5BB8
	for <intel-xe@archiver.kernel.org>; Sat, 23 May 2026 02:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7472C10E1F1;
	Sat, 23 May 2026 02:03:22 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8410710E040;
 Sat, 23 May 2026 02:03:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0862916935023818166=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/dp=3A_Sanitize_li?=
 =?utf-8?q?nk_capability_change_handling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 23 May 2026 02:03:21 -0000
Message-ID: <177950180153.2002.5694217615720435845@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260522160514.2628249-1-imre.deak@intel.com>
In-Reply-To: <20260522160514.2628249-1-imre.deak@intel.com>
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

--===============0862916935023818166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Sanitize link capability change handling (rev2)
URL   : https://patchwork.freedesktop.org/series/166769/
State : success

== Summary ==

CI Bug Log - changes from xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124_FULL -> xe-pw-166769v2_FULL
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

  Here are the changes found in xe-pw-166769v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6078])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#7679])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][8] -> [INCOMPLETE][9] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2724] / [Intel XE#7449])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2252]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7642])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1508])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2244])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#4156] / [Intel XE#7425])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#301]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7178] / [Intel XE#7351])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2311]) +12 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7399]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4141]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2313]) +15 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7130]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7794])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1489]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2387] / [Intel XE#7429])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#6503])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#1499])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_eudebug@discovery-race:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7636]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_eudebug@discovery-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2322] / [Intel XE#7372])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7136]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@two-queues-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#6874]) +8 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-userptr.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:
    - shard-bmg:          [PASS][39] -> [FAIL][40] ([Intel XE#7850])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-4/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-4/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7138]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][42] -> [FAIL][43] ([Intel XE#7736]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-10/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_page_reclaim@many-vma-same-bo:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7793])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_page_reclaim@many-vma-same-bo.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#944])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][46] -> [ABORT][47] ([Intel XE#8007])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html
    - shard-bmg:          [PASS][48] -> [ABORT][49] ([Intel XE#8007])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][50] -> [PASS][51] +7 other tests pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [FAIL][52] ([i915#4767]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [DMESG-WARN][54] ([Intel XE#7774]) -> [PASS][55] +1 other test pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][56] ([Intel XE#301]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][58] ([Intel XE#6321]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-threads:
    - shard-bmg:          [FAIL][60] ([Intel XE#7850]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-7/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-9/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html

  * igt@xe_exec_system_allocator@many-large-execqueues-free-race:
    - shard-bmg:          [ABORT][62] ([Intel XE#6652] / [Intel XE#7893]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-free-race.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-free-race.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset:
    - shard-bmg:          [DMESG-FAIL][64] ([Intel XE#5545]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-free-madvise:
    - shard-bmg:          [SKIP][66] ([Intel XE#6703]) -> [PASS][67] +97 other tests pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html

  * igt@xe_pmu@engine-activity-most-load-idle:
    - shard-bmg:          [TIMEOUT][68] ([Intel XE#7774]) -> [PASS][69] +1 other test pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_pmu@engine-activity-most-load-idle.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_pmu@engine-activity-most-load-idle.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][70] ([Intel XE#6703]) -> [SKIP][71] ([Intel XE#1124])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][72] ([Intel XE#6703]) -> [SKIP][73] ([Intel XE#2887]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][74] ([Intel XE#6703]) -> [SKIP][75] ([Intel XE#2325] / [Intel XE#7358])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_chamelium_color@degamma.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-bmg:          [SKIP][76] ([Intel XE#6703]) -> [SKIP][77] ([Intel XE#2252])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][78] ([Intel XE#6703]) -> [SKIP][79] ([Intel XE#2320])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][80] ([Intel XE#6703]) -> [SKIP][81] ([Intel XE#7178] / [Intel XE#7351])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][82] ([Intel XE#6703]) -> [SKIP][83] ([Intel XE#2311]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][84] ([Intel XE#6703]) -> [SKIP][85] ([Intel XE#4141]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][86] ([Intel XE#6703]) -> [SKIP][87] ([Intel XE#2313]) +8 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][88] ([Intel XE#6703]) -> [SKIP][89] ([Intel XE#2393])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-bmg:          [SKIP][90] ([Intel XE#6703]) -> [SKIP][91] ([Intel XE#1489]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          [SKIP][92] ([Intel XE#6703]) -> [SKIP][93] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-blt.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][94] ([Intel XE#6703]) -> [SKIP][95] ([Intel XE#3904] / [Intel XE#7342])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][96] ([Intel XE#6703]) -> [SKIP][97] ([Intel XE#2168] / [Intel XE#7444])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_vrr@lobf.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_vrr@lobf.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          [SKIP][98] ([Intel XE#6703]) -> [SKIP][99] ([Intel XE#7636]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][100] ([Intel XE#6703]) -> [SKIP][101] ([Intel XE#2322] / [Intel XE#7372])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [SKIP][102] ([Intel XE#6703]) -> [SKIP][103] ([Intel XE#7136]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-close-fd:
    - shard-bmg:          [SKIP][104] ([Intel XE#6703]) -> [SKIP][105] ([Intel XE#6874]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-close-fd.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-close-fd.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:
    - shard-bmg:          [SKIP][106] ([Intel XE#6703]) -> [SKIP][107] ([Intel XE#7138])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          [SKIP][108] ([Intel XE#6703]) -> [SKIP][109] ([Intel XE#4733] / [Intel XE#7417])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_pxp@display-pxp-fb.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7736
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767


Build changes
-------------

  * Linux: xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124 -> xe-pw-166769v2

  IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124: 60d51bdeabf700864c26264c51b146a86b0a9124
  xe-pw-166769v2: 166769v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/index.html

--===============0862916935023818166==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Sanitize link capability change handling (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166769/">https://patchwork.freedesktop.org/series/166769/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124_FULL -&gt; xe-pw-166769v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166769v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_psr@psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_eudebug@discovery-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-4/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-4/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-10/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7736">Intel XE#7736</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@many-vma-same-bo:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_page_reclaim@many-vma-same-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@core_setmaster@master-drop-set-user.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767">i915#4767</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-7/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-9/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-free-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-free-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893">Intel XE#7893</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-free-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html">PASS</a> +97 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-most-load-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_pmu@engine-activity-most-load-idle.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_pmu@engine-activity-most-load-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-close-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166769v2/shard-bmg-10/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124 -&gt; xe-pw-166769v2</li>
</ul>
<p>IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5118-60d51bdeabf700864c26264c51b146a86b0a9124: 60d51bdeabf700864c26264c51b146a86b0a9124<br />
  xe-pw-166769v2: 166769v2</p>

</body>
</html>

--===============0862916935023818166==--
