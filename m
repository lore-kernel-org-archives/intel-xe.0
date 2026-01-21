Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8682D262B2
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 05:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9952F10E6BF;
	Wed, 21 Jan 2026 05:26:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E7410E6BA;
 Wed, 21 Jan 2026 05:26:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1052165692859952767=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/ptl=3A_Disable_DCC_?=
 =?utf-8?q?on_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 05:26:46 -0000
Message-ID: <176897320679.175579.2553966381245488874@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260120235926.4040336-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260120235926.4040336-1-vinay.belgaumkar@intel.com>
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

--===============1052165692859952767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ptl: Disable DCC on PTL
URL   : https://patchwork.freedesktop.org/series/160388/
State : success

== Summary ==

CI Bug Log - changes from xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e_FULL -> xe-pw-160388v1_FULL
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

  Here are the changes found in xe-pw-160388v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] ([Intel XE#2705]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#367]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2252]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2390] / [Intel XE#6974])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2320]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#6831])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [PASS][12] -> [FAIL][13] ([Intel XE#3321]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#301]) +3 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2293] / [Intel XE#2380])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2293]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7064] / [Intel XE#7081])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7064])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2311]) +5 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7061])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#4141]) +6 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2313]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1406] / [Intel XE#2414])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#6503])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1499])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [PASS][29] -> [INCOMPLETE][30] ([Intel XE#4504]) +1 other test incomplete
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-10/igt@xe_ccs@suspend-resume.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-3/igt@xe_ccs@suspend-resume.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4837]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][33] ([Intel XE#6321])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2322]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6874]) +8 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-lnl:          [PASS][36] -> [DMESG-WARN][37] ([Intel XE#7023])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@xe_exec_reset@gt-reset-stress.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-lnl-7/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#5007])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4943]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6964]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [FAIL][41] ([Intel XE#5993]) -> [PASS][42] +3 other tests pass
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [INCOMPLETE][43] ([Intel XE#6904]) -> [PASS][44] +1 other test pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][45] ([Intel XE#5299]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][47] ([Intel XE#7030]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][49] -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [DMESG-FAIL][51] ([Intel XE#5545]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-bmg:          [SKIP][53] ([Intel XE#6693]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][55] ([Intel XE#6321]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap:
    - shard-bmg:          [SKIP][57] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][58] +1 other test pass
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-free:
    - shard-bmg:          [INCOMPLETE][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-execqueues-free.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-execqueues-free.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset:
    - shard-bmg:          [SKIP][61] ([Intel XE#6703]) -> [PASS][62] +69 other tests pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [DMESG-WARN][63] ([Intel XE#7024]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@xe_pm@s4-mocs.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-lnl-7/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][65] ([Intel XE#6703]) -> [SKIP][66] ([Intel XE#2327])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][67] ([Intel XE#6703]) -> [SKIP][68] ([Intel XE#1124]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][69] ([Intel XE#6703]) -> [SKIP][70] ([Intel XE#2314] / [Intel XE#2894])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          [SKIP][71] ([Intel XE#6703]) -> [SKIP][72] ([Intel XE#2252])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][73] ([Intel XE#6703]) -> [SKIP][74] ([Intel XE#2390] / [Intel XE#6974])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][75] ([Intel XE#6703]) -> [SKIP][76] ([Intel XE#2374])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_feature_discovery@psr2.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][77] ([Intel XE#6703]) -> [SKIP][78] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][79] ([Intel XE#6703]) -> [SKIP][80] ([Intel XE#2311]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][81] ([Intel XE#6703]) -> [SKIP][82] ([Intel XE#4141])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][83] ([Intel XE#6703]) -> [SKIP][84] ([Intel XE#2313]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][85] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][86] ([Intel XE#3544])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][87] ([Intel XE#6703]) -> [SKIP][88] ([Intel XE#2392])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-bmg:          [SKIP][89] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][90] ([Intel XE#1406] / [Intel XE#1489])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][91] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][92] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_psr@psr-cursor-plane-onoff.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][93] ([Intel XE#1729]) -> [SKIP][94] ([Intel XE#2426])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][95] ([Intel XE#2509]) -> [SKIP][96] ([Intel XE#2426])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-bmg:          [SKIP][97] ([Intel XE#6703]) -> [SKIP][98] ([Intel XE#4837]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_eudebug@basic-vm-access-faultable.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][99] ([Intel XE#6703]) -> [SKIP][100] ([Intel XE#2322])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority:
    - shard-bmg:          [SKIP][101] ([Intel XE#6703]) -> [SKIP][102] ([Intel XE#6874]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:
    - shard-bmg:          [SKIP][103] ([Intel XE#6703]) -> [SKIP][104] ([Intel XE#4943]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6831]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6831
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6904
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023
  [Intel XE#7024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7024
  [Intel XE#7030]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7030
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7064]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7064
  [Intel XE#7081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7081


Build changes
-------------

  * Linux: xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e -> xe-pw-160388v1

  IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e: e1d337ba2d56f16062ced77fc4763660eb239e3e
  xe-pw-160388v1: 160388v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/index.html

--===============1052165692859952767==
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
<tr><td><b>Series:</b></td><td>drm/xe/ptl: Disable DCC on PTL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160388/">https://patchwork.freedesktop.org/series/160388/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e_FULL -&gt; xe-pw-160388v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160388v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6831">Intel XE#6831</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7064">Intel XE#7064</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7081">Intel XE#7081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7064">Intel XE#7064</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_sharpness_filter@filter-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-10/igt@xe_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-3/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-lnl-7/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023">Intel XE#7023</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6904">Intel XE#6904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7030">Intel XE#7030</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-execqueues-free.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-execqueues-free.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset.html">PASS</a> +69 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-lnl-5/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7024">Intel XE#7024</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-lnl-7/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160388v1/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e -&gt; xe-pw-160388v1</li>
</ul>
<p>IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4420-e1d337ba2d56f16062ced77fc4763660eb239e3e: e1d337ba2d56f16062ced77fc4763660eb239e3e<br />
  xe-pw-160388v1: 160388v1</p>

</body>
</html>

--===============1052165692859952767==--
