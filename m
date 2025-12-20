Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36086E668AF
	for <intel-xe@archiver.kernel.org>; Sat, 20 Dec 2025 03:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EA610F130;
	Sat, 20 Dec 2025 03:32:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E3510EEA4;
 Sat, 20 Dec 2025 03:32:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3412892266804619077=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_All_pa?=
 =?utf-8?q?tches_to_make_PREEMPT=5FRT_work_on_i915_+_xe=2E_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 20 Dec 2025 03:32:29 -0000
Message-ID: <176620154919.108745.5017336117915411136@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251218163408.97508-1-dev@lankhorst.se>
In-Reply-To: <20251218163408.97508-1-dev@lankhorst.se>
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

--===============3412892266804619077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: All patches to make PREEMPT_RT work on i915 + xe. (rev8)
URL   : https://patchwork.freedesktop.org/series/159034/
State : failure

== Summary ==

CI Bug Log - changes from xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb_FULL -> xe-pw-159034v8_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159034v8_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159034v8_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159034v8_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@fbc-psr-suspend@edp-1:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +9 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-1/igt@kms_psr@fbc-psr-suspend@edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-8/igt@kms_psr@fbc-psr-suspend@edp-1.html

  * igt@xe_exec_system_allocator@prefetch-benchmark:
    - shard-bmg:          [PASS][3] -> [TIMEOUT][4] +1 other test timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@xe_exec_system_allocator@prefetch-benchmark.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@xe_exec_system_allocator@prefetch-benchmark.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  
Known issues
------------

  Here are the changes found in xe-pw-159034v8_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#6914]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@core_getversion@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@core_getversion@basic.html

  * igt@fbdev@write:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#2134])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@fbdev@write.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@fbdev@write.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#5177] / [Intel XE#6703])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][12] -> [FAIL][13] ([Intel XE#3718] / [Intel XE#6078]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][14] ([Intel XE#6078])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - shard-bmg:          [PASS][15] -> [FAIL][16] ([Intel XE#6078])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-lnl:          [PASS][17] -> [INCOMPLETE][18] ([Intel XE#4912]) +1 other test incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-3/igt@kms_async_flips@async-flip-suspend-resume.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2314] / [Intel XE#2894])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][22] ([Intel XE#3862]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#3432])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2325])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2320])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2291])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][28] -> [FAIL][29] ([Intel XE#3149] / [Intel XE#3321]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2316]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [PASS][34] -> [FAIL][35] ([Intel XE#3321]) +8 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][36] -> [FAIL][37] ([Intel XE#301]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][38] -> [DMESG-FAIL][39] ([Intel XE#5545]) +1 other test dmesg-fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#6703]) +424 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2293]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2293] / [Intel XE#2380])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2311]) +6 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4141]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2313]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][47] ([Intel XE#6740]) +1 other test abort
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2925])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2392])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#6693]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#1489])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1406] / [Intel XE#2387])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-10/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#1406] / [Intel XE#6703]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#3414] / [Intel XE#3904])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-lnl:          [PASS][56] -> [INCOMPLETE][57] ([Intel XE#6907])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-1/igt@kms_sharpness_filter@filter-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-4/igt@kms_sharpness_filter@filter-suspend.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4837])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4837] / [Intel XE#6665])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-10/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2322]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_compute_mode@twice-basic:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#6557] / [Intel XE#6703]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@xe_exec_compute_mode@twice-basic.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#6874]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-bmg:          [PASS][64] -> [ABORT][65] ([Intel XE#6515])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-8/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#4943]) +6 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#6557] / [Intel XE#6703])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-madvise:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#6703]) +98 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-madvise.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2459] / [Intel XE#2596])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2457])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@xe_module_load@force-load.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][71] -> [FAIL][72] ([Intel XE#6913])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@xe_module_load@reload-no-display.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-lnl:          [PASS][73] -> [INCOMPLETE][74] ([Intel XE#4504]) +5 other tests incomplete
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-3/igt@xe_pm@s2idle-exec-after.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-5/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s4-exec-after:
    - shard-bmg:          [PASS][75] -> [DMESG-WARN][76] ([Intel XE#6576]) +1 other test dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-1/igt@xe_pm@s4-exec-after.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_pm@s4-exec-after.html

  * igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_render0:
    - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#6251]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_render0.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_render0.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#4733])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [SKIP][80] ([Intel XE#6779]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][82] ([Intel XE#4674]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [SKIP][84] ([Intel XE#6815]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [SKIP][86] ([Intel XE#2134]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@fbdev@unaligned-read.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@fbdev@unaligned-read.html

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [SKIP][88] ([Intel XE#6703]) -> [PASS][89] +434 other tests pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][90] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][92] ([Intel XE#2291]) -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][94] ([Intel XE#5299]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][96] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][97] +1 other test pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][98] ([Intel XE#6693]) -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][100] ([Intel XE#2142]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@testdisplay:
    - shard-bmg:          [ABORT][102] ([Intel XE#6740]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-7/igt@testdisplay.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-10/igt@testdisplay.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset:
    - shard-bmg:          [SKIP][104] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][105] +3 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][106] ([Intel XE#6913]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_module_load@many-reload.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@xe_module_load@many-reload.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][108] ([Intel XE#2327]) -> [SKIP][109] ([Intel XE#6703]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][110] ([Intel XE#6703]) -> [SKIP][111] ([Intel XE#2327]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][112] ([Intel XE#1124]) -> [SKIP][113] ([Intel XE#6703]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][114] ([Intel XE#6703]) -> [SKIP][115] ([Intel XE#1124]) +8 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][116] ([Intel XE#610]) -> [SKIP][117] ([Intel XE#6703])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][118] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][119] ([Intel XE#6703]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][120] ([Intel XE#6703]) -> [SKIP][121] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][122] ([Intel XE#6703]) -> [SKIP][123] ([Intel XE#367])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][124] ([Intel XE#367]) -> [SKIP][125] ([Intel XE#6703]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][126] ([Intel XE#2887]) -> [SKIP][127] ([Intel XE#6557] / [Intel XE#6703])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][128] ([Intel XE#6703]) -> [SKIP][129] ([Intel XE#2887]) +11 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][130] ([Intel XE#3432]) -> [SKIP][131] ([Intel XE#6703]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][132] ([Intel XE#6703]) -> [SKIP][133] ([Intel XE#3432])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][134] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][135] ([Intel XE#6703])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][136] ([Intel XE#2887]) -> [SKIP][137] ([Intel XE#6703]) +9 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][138] ([Intel XE#6703]) -> [SKIP][139] ([Intel XE#2724])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_cdclk@plane-scaling.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][140] ([Intel XE#6703]) -> [SKIP][141] ([Intel XE#2325])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_chamelium_color@ctm-green-to-red.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][142] ([Intel XE#2325]) -> [SKIP][143] ([Intel XE#6703])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_chamelium_color@gamma.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          [SKIP][144] ([Intel XE#6703]) -> [SKIP][145] ([Intel XE#2252]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          [SKIP][146] ([Intel XE#2252]) -> [SKIP][147] ([Intel XE#6703]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][148] ([Intel XE#1178]) -> [SKIP][149] ([Intel XE#6703])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][150] ([Intel XE#2341]) -> [SKIP][151] ([Intel XE#6703]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_content_protection@content-type-change.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][152] ([Intel XE#6703]) -> [SKIP][153] ([Intel XE#2390])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][154] ([Intel XE#2321]) -> [SKIP][155] ([Intel XE#6703])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][156] ([Intel XE#6703]) -> [SKIP][157] ([Intel XE#2320]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][158] ([Intel XE#2320]) -> [SKIP][159] ([Intel XE#6703]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_cursor_crc@cursor-random-32x32.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          [SKIP][160] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][161] ([Intel XE#2320])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][162] ([Intel XE#2291]) -> [SKIP][163] ([Intel XE#6703]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][164] ([Intel XE#6703]) -> [SKIP][165] ([Intel XE#4354])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][166] ([Intel XE#2244]) -> [SKIP][167] ([Intel XE#6703]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][168] ([Intel XE#6703]) -> [SKIP][169] ([Intel XE#4156])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][170] ([Intel XE#776]) -> [SKIP][171] ([Intel XE#6703])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_fbcon_fbt@psr.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][172] ([Intel XE#6703]) -> [SKIP][173] ([Intel XE#776])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][174] ([Intel XE#2372]) -> [SKIP][175] ([Intel XE#6703])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_feature_discovery@chamelium.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][176] ([Intel XE#6703]) -> [SKIP][177] ([Intel XE#2374])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_feature_discovery@psr2.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [SKIP][178] ([Intel XE#2316]) -> [SKIP][179] ([Intel XE#6703])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [SKIP][180] ([Intel XE#6703]) -> [SKIP][181] ([Intel XE#2316])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][182] ([Intel XE#6703]) -> [SKIP][183] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][184] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][185] ([Intel XE#6703]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][186] ([Intel XE#2312]) -> [SKIP][187] ([Intel XE#2311]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][188] ([Intel XE#2311]) -> [SKIP][189] ([Intel XE#2312]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][190] ([Intel XE#6703]) -> [SKIP][191] ([Intel XE#2311]) +15 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][192] ([Intel XE#6703]) -> [SKIP][193] ([Intel XE#4141]) +8 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][194] ([Intel XE#4141]) -> [SKIP][195] ([Intel XE#2312])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][196] ([Intel XE#4141]) -> [SKIP][197] ([Intel XE#6703]) +6 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][198] ([Intel XE#2312]) -> [SKIP][199] ([Intel XE#4141]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][200] ([Intel XE#6703]) -> [SKIP][201] ([Intel XE#2312]) +10 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][202] ([Intel XE#2311]) -> [SKIP][203] ([Intel XE#6703]) +17 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          [SKIP][204] ([Intel XE#2311]) -> [SKIP][205] ([Intel XE#6557] / [Intel XE#6703])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][206] ([Intel XE#2312]) -> [SKIP][207] ([Intel XE#2313]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][208] ([Intel XE#2312]) -> [SKIP][209] ([Intel XE#6703]) +7 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][210] ([Intel XE#6703]) -> [SKIP][211] ([Intel XE#2313]) +19 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][212] ([Intel XE#2313]) -> [SKIP][213] ([Intel XE#6557] / [Intel XE#6703])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][214] ([Intel XE#2313]) -> [SKIP][215] ([Intel XE#6703]) +17 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][216] ([Intel XE#2313]) -> [SKIP][217] ([Intel XE#2312]) +4 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [ABORT][218] ([Intel XE#6740]) -> [SKIP][219] ([Intel XE#6703])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-1/igt@kms_hdr@bpc-switch-dpms.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][220] ([Intel XE#6901]) -> [SKIP][221] ([Intel XE#6703])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_joiner@basic-big-joiner.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][222] ([Intel XE#6703]) -> [SKIP][223] ([Intel XE#6911])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][224] ([Intel XE#6703]) -> [SKIP][225] ([Intel XE#2393])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][226] ([Intel XE#5021]) -> [SKIP][227] ([Intel XE#4596])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][228] ([Intel XE#6886]) -> [SKIP][229] ([Intel XE#6703])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][230] ([Intel XE#6703]) -> [SKIP][231] ([Intel XE#2938])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][232] ([Intel XE#6703]) -> [SKIP][233] ([Intel XE#2391])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][234] ([Intel XE#6703]) -> [SKIP][235] ([Intel XE#3309])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][236] ([Intel XE#2499]) -> [SKIP][237] ([Intel XE#6703])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][238] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][239] ([Intel XE#6693])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][240] ([Intel XE#6693]) -> [SKIP][241] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][242] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][243] ([Intel XE#1406] / [Intel XE#1489]) +6 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][244] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][245] ([Intel XE#1406] / [Intel XE#6703]) +4 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][246] ([Intel XE#1406] / [Intel XE#2387]) -> [SKIP][247] ([Intel XE#1406] / [Intel XE#6703])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-bmg:          [SKIP][248] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][249] ([Intel XE#1406] / [Intel XE#6703]) +7 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_psr@fbc-psr-basic.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][250] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][251] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][252] ([Intel XE#1406] / [Intel XE#2234]) -> [SKIP][253] ([Intel XE#1406] / [Intel XE#6703])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_psr@psr2-primary-render.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][254] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][255] ([Intel XE#1406] / [Intel XE#2414])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][256] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][257] ([Intel XE#6703])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-270.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][258] ([Intel XE#1435]) -> [SKIP][259] ([Intel XE#6703]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_setmode@basic-clone-single-crtc.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          [SKIP][260] ([Intel XE#6703]) -> [SKIP][261] ([Intel XE#6503]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][262] ([Intel XE#2426]) -> [SKIP][263] ([Intel XE#6703])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][264] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][265] ([Intel XE#2450])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][266] ([Intel XE#6703]) -> [SKIP][267] ([Intel XE#1499])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          [SKIP][268] ([Intel XE#6703]) -> [SKIP][269] ([Intel XE#4837]) +6 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          [SKIP][270] ([Intel XE#4837]) -> [SKIP][271] ([Intel XE#6703]) +6 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-1/igt@xe_eudebug@vm-bind-clear.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-bmg:          [SKIP][272] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][273] ([Intel XE#6703]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@xe_eudebug_online@basic-breakpoint.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][274] ([Intel XE#6703]) -> [SKIP][275] ([Intel XE#4837] / [Intel XE#6665]) +3 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][276] ([Intel XE#6703]) -> [SKIP][277] ([Intel XE#5793])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][278] ([Intel XE#5793]) -> [SKIP][279] ([Intel XE#6703])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][280] ([Intel XE#6321]) -> [SKIP][281] ([Intel XE#6703])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][282] ([Intel XE#2322]) -> [SKIP][283] ([Intel XE#6703]) +7 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][284] ([Intel XE#6703]) -> [SKIP][285] ([Intel XE#2322]) +5 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-execs-basic-smem:
    - shard-bmg:          [SKIP][286] ([Intel XE#6874]) -> [SKIP][287] ([Intel XE#6703]) +20 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-basic-smem.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-basic-smem.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:
    - shard-bmg:          [SKIP][288] ([Intel XE#6703]) -> [SKIP][289] ([Intel XE#6874]) +21 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][290] ([Intel XE#4943]) -> [SKIP][291] ([Intel XE#6703]) +14 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          [SKIP][292] ([Intel XE#6703]) -> [SKIP][293] ([Intel XE#4943]) +18 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][294] ([Intel XE#6703]) -> [SKIP][295] ([Intel XE#6281])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][296] ([Intel XE#2248]) -> [SKIP][297] ([Intel XE#6703])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][298] ([Intel XE#6703]) -> [SKIP][299] ([Intel XE#2284]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_pm@d3cold-mocs.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][300] ([Intel XE#6703]) -> [SKIP][301] ([Intel XE#5742])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_pm@d3hot-i2c.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][302] ([Intel XE#2284]) -> [SKIP][303] ([Intel XE#6703])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][304] ([Intel XE#6703]) -> [SKIP][305] ([Intel XE#579])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          [SKIP][306] ([Intel XE#4733]) -> [SKIP][307] ([Intel XE#6703]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@xe_pxp@display-pxp-fb.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          [SKIP][308] ([Intel XE#6703]) -> [SKIP][309] ([Intel XE#4733])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          [SKIP][310] ([Intel XE#6703]) -> [SKIP][311] ([Intel XE#944]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_query@multigpu-query-engines.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][312] ([Intel XE#944]) -> [SKIP][313] ([Intel XE#6703]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6515]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6515
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6576
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6907
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6913]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6913
  [Intel XE#6914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6914
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb -> xe-pw-159034v8

  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb: 84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb
  xe-pw-159034v8: 159034v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/index.html

--===============3412892266804619077==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: All patches to make PREEMPT_RT work on i915 + xe. (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159034/">https://patchwork.freedesktop.org/series/159034/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb_FULL -&gt; xe-pw-159034v8_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159034v8_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-159034v8_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-159034v8_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_psr@fbc-psr-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-1/igt@kms_psr@fbc-psr-suspend@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-8/igt@kms_psr@fbc-psr-suspend@edp-1.html">INCOMPLETE</a> +9 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@prefetch-benchmark:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@xe_exec_system_allocator@prefetch-benchmark.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@xe_exec_system_allocator@prefetch-benchmark.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159034v8_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@core_getversion@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@core_getversion@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6914">Intel XE#6914</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-3/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-2/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912">Intel XE#4912</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +424 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-10/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_psr@psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-1/igt@kms_sharpness_filter@filter-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-4/igt@kms_sharpness_filter@filter-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6907">Intel XE#6907</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-10/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_exec_compute_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-8/igt@xe_exec_reset@cm-gt-reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6515">Intel XE#6515</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-madvise:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-madvise.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +98 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6913">Intel XE#6913</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-3/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-5/igt@xe_pm@s2idle-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>) +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-1/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6576">Intel XE#6576</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_render0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_render0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_render0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674">Intel XE#4674</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815">Intel XE#6815</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@device_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@fbdev@unaligned-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_addfb_basic@unused-handle.html">PASS</a> +434 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-9/igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-7/igt@testdisplay.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-10/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6913">Intel XE#6913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-1/igt@kms_hdr@bpc-switch-dpms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-1/igt@xe_eudebug@vm-bind-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@xe_eudebug@vm-bind-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-basic-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-7/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-9/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-4/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-5/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-3/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v8/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb -&gt; xe-pw-159034v8</li>
</ul>
<p>IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4270-84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb: 84b93f7cc4ceb1c0bee1e478b652db7bbc40c7bb<br />
  xe-pw-159034v8: 159034v8</p>

</body>
</html>

--===============3412892266804619077==--
