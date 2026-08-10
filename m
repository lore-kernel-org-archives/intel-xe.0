Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7615C5AD55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 15:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F1A10E492;
	Mon, 10 Aug 2026 15:16:42 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA52210E0A9;
 Mon, 10 Aug 2026 15:16:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1009961492139107584=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Add_drm=5Fras_netlink_erro?=
 =?utf-8?q?r_event_support_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Aug 2026 15:16:41 -0000
Message-ID: <178637500182.35122.13723659244419046693@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260810112008.1858731-4-riana.tauro@intel.com>
In-Reply-To: <20260810112008.1858731-4-riana.tauro@intel.com>
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

--===============1009961492139107584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add drm_ras netlink error event support (rev7)
URL   : https://patchwork.freedesktop.org/series/166765/
State : failure

== Summary ==

CI Bug Log - changes from xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92_FULL -> xe-pw-166765v7_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166765v7_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166765v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166765v7_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
    - shard-bmg:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html

  
Known issues
------------

  Here are the changes found in xe-pw-166765v7_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2652]) +7 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
    - shard-lnl:          [PASS][5] -> [INCOMPLETE][6] ([Intel XE#7084]) +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2252])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2311]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#4141])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#1503])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_pm_backlight@fade.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1499])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_vrr@flip-dpms.html

  * igt@xe_exec_fault_mode@many-multi-queue-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#8374])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#8378])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [PASS][17] -> [ABORT][18] ([Intel XE#8007])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][19] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [FAIL][21] ([Intel XE#6078]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][23] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][24] +1 other test pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [DMESG-FAIL][25] ([Intel XE#7774]) -> [PASS][26] +1 other test pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][27] ([Intel XE#301]) -> [PASS][28] +3 other tests pass
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][29] ([Intel XE#8399]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_exec_basic@many-rebind:
    - shard-bmg:          [SKIP][31] ([Intel XE#8589]) -> [PASS][32] +48 other tests pass
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_basic@many-rebind.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_exec_basic@many-rebind.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-bmg:          [SKIP][33] ([Intel XE#8589]) -> [SKIP][34] ([Intel XE#2327])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][35] ([Intel XE#8589]) -> [SKIP][36] ([Intel XE#1124])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][37] ([Intel XE#8589]) -> [SKIP][38] ([Intel XE#7679])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][39] ([Intel XE#8589]) -> [SKIP][40] ([Intel XE#2652])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          [SKIP][41] ([Intel XE#8589]) -> [SKIP][42] ([Intel XE#7358])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][43] ([Intel XE#8589]) -> [SKIP][44] ([Intel XE#2321] / [Intel XE#7355])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][45] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][46] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][47] ([Intel XE#8589]) -> [SKIP][48] ([Intel XE#2311]) +6 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][49] ([Intel XE#8589]) -> [SKIP][50] ([Intel XE#2313]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][51] ([Intel XE#3544]) -> [SKIP][52] ([Intel XE#3374] / [Intel XE#3544])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-bmg:          [SKIP][53] ([Intel XE#8589]) -> [SKIP][54] ([Intel XE#7283])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][55] ([Intel XE#8589]) -> [SKIP][56] ([Intel XE#7794])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr@psr-primary-blt:
    - shard-bmg:          [SKIP][57] ([Intel XE#8589]) -> [SKIP][58] ([Intel XE#2234] / [Intel XE#2850])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_psr@psr-primary-blt.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_psr@psr-primary-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][59] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][60] ([Intel XE#1729] / [Intel XE#7424])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][61] ([Intel XE#8589]) -> [SKIP][62] ([Intel XE#2322] / [Intel XE#7372])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic:
    - shard-bmg:          [SKIP][63] ([Intel XE#8589]) -> [SKIP][64] ([Intel XE#8364])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic.html

  * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
    - shard-bmg:          [SKIP][65] ([Intel XE#8589]) -> [SKIP][66] ([Intel XE#8378]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-bmg:          [SKIP][67] ([Intel XE#8589]) -> [SKIP][68] ([Intel XE#7793])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_page_reclaim@pde-vs-pd.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          [SKIP][69] ([Intel XE#8589]) -> [SKIP][70] ([Intel XE#944])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_query@multigpu-query-engines.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_query@multigpu-query-engines.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92 -> xe-pw-166765v7

  IGT_9047: 9047
  xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92: 64945e34f2f3505d1def53d6752c04ddca144a92
  xe-pw-166765v7: 166765v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/index.html

--===============1009961492139107584==
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
<tr><td><b>Series:</b></td><td>Add drm_ras netlink error event support (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166765/">https://patchwork.freedesktop.org/series/166765/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92_FULL -&gt; xe-pw-166765v7_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166765v7_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-166765v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166765v7_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166765v7_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_basic@many-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_exec_basic@many-rebind.html">PASS</a> +48 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166765v7/shard-bmg-2/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92 -&gt; xe-pw-166765v7</li>
</ul>
<p>IGT_9047: 9047<br />
  xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92: 64945e34f2f3505d1def53d6752c04ddca144a92<br />
  xe-pw-166765v7: 166765v7</p>

</body>
</html>

--===============1009961492139107584==--
