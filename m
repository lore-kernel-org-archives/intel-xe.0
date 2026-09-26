Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D791C9832A
	for <intel-xe@archiver.kernel.org>; Sat, 26 Sep 2026 17:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F239610E26F;
	Sat, 26 Sep 2026 17:47:04 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3680010E183;
 Sat, 26 Sep 2026 17:47:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1922750700829812808=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/hwmon=3A_refresh_B7?=
 =?utf-8?q?0_temperature_inputs_after_GT_idle?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Bata_Roland_Kriszti=C3=A1n_via_B4_Relay?=
 <devnull+batarolandkrisztian.gmail.com@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 26 Sep 2026 17:47:04 -0000
Message-ID: <179044482420.210747.12324756504388113605@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <179041811564.526373.13204522833274380927.b70-hwmon-rfc@gmail.com>
In-Reply-To: <179041811564.526373.13204522833274380927.b70-hwmon-rfc@gmail.com>
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

--===============1922750700829812808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: refresh B70 temperature inputs after GT idle
URL   : https://patchwork.freedesktop.org/series/175039/
State : success

== Summary ==

CI Bug Log - changes from xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229_FULL -> xe-pw-175039v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-175039v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-ptl:          NOTRUN -> [SKIP][1] ([Intel XE#5901]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-ptl:          NOTRUN -> [SKIP][2] ([Intel XE#5808]) +4 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][4] ([Intel XE#5822]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-ptl:          [PASS][5] -> [ABORT][6] ([Intel XE#9364] / [Intel XE#9378])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
    - shard-ptl:          [PASS][7] -> [ABORT][8] ([Intel XE#9378])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:
    - shard-ptl:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#9389])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2325] / [Intel XE#7358])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_chamelium_color@degamma.html
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#5824])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2390] / [Intel XE#6974])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-ptl:          NOTRUN -> [SKIP][15] ([Intel XE#5832] / [Intel XE#6974])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#5846]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2321] / [Intel XE#7355])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][18] ([Intel XE#5962]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#6035])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][20] ([Intel XE#5907])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-bmg:          [PASS][21] -> [FAIL][22] ([Intel XE#3098]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-4/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@dpms-vs-vblank-race@b-edp1:
    - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#3098]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race@b-edp1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-lnl-8/igt@kms_flip@dpms-vs-vblank-race@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][25] -> [FAIL][26] ([Intel XE#3149] / [Intel XE#3321]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#301])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2311]) +7 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#5800] / [Intel XE#6312]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7061] / [Intel XE#7356])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#6312]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#5812]) +22 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#7061]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2313]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#7865]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
    - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#6886]) +6 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-ptl:          [PASS][39] -> [ABORT][40] ([Intel XE#9362]) +1 other test abort
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-8/igt@kms_pm_backlight@fade-with-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2234] / [Intel XE#2850])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7795])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_vrr@flipline@pipe-a-edp-1:
    - shard-ptl:          [PASS][44] -> [FAIL][45] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-6/igt@kms_vrr@flipline@pipe-a-edp-1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-2/igt@kms_vrr@flipline@pipe-a-edp-1.html

  * igt@kms_vrr@lobf:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#5950] / [Intel XE#9277])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#7638] / [Intel XE#9277])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#5764]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#7482]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#5575] / [Intel XE#7484])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - shard-bmg:          [PASS][51] -> [INCOMPLETE][52] ([Intel XE#2594])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-4/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-1/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#8374]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-6/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html

  * igt@xe_exec_multi_queue@many-execs-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#8364]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-9/igt@xe_exec_multi_queue@many-execs-close-fd-smem.html

  * igt@xe_exec_multi_queue@one-queue-close-fd-smem:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#8364]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@xe_exec_multi_queue@one-queue-close-fd-smem.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#8378])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#8378])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-lnl:          [PASS][58] -> [ABORT][59] ([Intel XE#6652] / [Intel XE#8007])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_madvise@atomic-cpu:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#7980])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@xe_madvise@atomic-cpu.html

  * igt@xe_media_fill@media-fill:
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#5830] / [Intel XE#7453])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@xe_media_fill@media-fill.html

  * igt@xe_pat@pat-index-xelp:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#5771] / [Intel XE#7590])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#7590])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@xe_pat@xa-app-transient-media-on.html
    - shard-ptl:          NOTRUN -> [SKIP][64] ([Intel XE#7590])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][65] -> [ABORT][66] ([Intel XE#9362])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-lnl-4/igt@xe_pm@s4-basic-exec.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-lnl-5/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          NOTRUN -> [ABORT][67] ([Intel XE#9362])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-6/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-ptl:          [PASS][68] -> [DMESG-WARN][69] ([Intel XE#7727])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-4/igt@xe_pm@s4-multiple-execs.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-1/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          [PASS][70] -> [ABORT][71] ([Intel XE#9362])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-8/igt@xe_pm_residency@cpg-basic.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-5/igt@xe_pm_residency@cpg-basic.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][72] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [FAIL][74] ([Intel XE#6078]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [INCOMPLETE][76] ([Intel XE#9210]) -> [PASS][77] +1 other test pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html
    - shard-ptl:          [ABORT][78] ([Intel XE#9375]) -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-3/igt@kms_cursor_crc@cursor-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][80] ([Intel XE#9390]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [FAIL][82] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][84] ([Intel XE#301]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-ptl:          [ABORT][86] ([Intel XE#9362]) -> [PASS][87] +3 other tests pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-5/igt@kms_hdr@bpc-switch-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [INCOMPLETE][88] ([Intel XE#9320]) -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-9/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][90] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][92] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][93] ([Intel XE#1729] / [Intel XE#7424])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5830
  [Intel XE#5832]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5950
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7638
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#9210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9210
  [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
  [Intel XE#9320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9320
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9364
  [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
  [Intel XE#9378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378
  [Intel XE#9389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9389
  [Intel XE#9390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9390


Build changes
-------------

  * Linux: xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229 -> xe-pw-175039v1

  IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229: 666d2f09d9045fc8f72cc1f71528a04acbaf5229
  xe-pw-175039v1: 175039v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/index.html

--===============1922750700829812808==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: refresh B70 temperature inputs after GT idle</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175039/">https://patchwork.freedesktop.org/series/175039/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229_FULL -&gt; xe-pw-175039v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175039v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9364">Intel XE#9364</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378">Intel XE#9378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378">Intel XE#9378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9389">Intel XE#9389</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832">Intel XE#5832</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-4/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-lnl-8/igt@kms_flip@dpms-vs-vblank-race@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-8/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-7/igt@kms_pm_backlight@fade-with-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-6/igt@kms_vrr@flipline@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-2/igt@kms_vrr@flipline@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5950">Intel XE#5950</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277">Intel XE#9277</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@kms_vrr@lobf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7638">Intel XE#7638</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277">Intel XE#9277</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-4/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-1/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-6/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-9/igt@xe_exec_multi_queue@many-execs-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-close-fd-smem:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@xe_exec_multi_queue@one-queue-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-cpu:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@xe_madvise@atomic-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5830">Intel XE#5830</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-8/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-lnl-4/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-lnl-5/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-6/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-4/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-1/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-8/igt@xe_pm_residency@cpg-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-5/igt@xe_pm_residency@cpg-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9210">Intel XE#9210</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +1 other test pass</li>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-3/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-3/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9390">Intel XE#9390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-ptl-5/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-ptl-6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9320">Intel XE#9320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-9/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175039v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229 -&gt; xe-pw-175039v1</li>
</ul>
<p>IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5831-666d2f09d9045fc8f72cc1f71528a04acbaf5229: 666d2f09d9045fc8f72cc1f71528a04acbaf5229<br />
  xe-pw-175039v1: 175039v1</p>

</body>
</html>

--===============1922750700829812808==--
