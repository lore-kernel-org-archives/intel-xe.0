Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D4BC5B56A
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 16:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5BE10E92D;
	Mon, 10 Aug 2026 16:40:46 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE1F89369;
 Mon, 10 Aug 2026 16:40:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1717348020064720753=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Fix_xe=5Fdevice?=
 =?utf-8?q?=5Fprobe=28=29_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Aug 2026 16:40:45 -0000
Message-ID: <178638004505.35583.10810612000099741@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260810123821.105605-1-raag.jadav@intel.com>
In-Reply-To: <20260810123821.105605-1-raag.jadav@intel.com>
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

--===============1717348020064720753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix xe_device_probe() failure
URL   : https://patchwork.freedesktop.org/series/171936/
State : success

== Summary ==

CI Bug Log - changes from xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92_FULL -> xe-pw-171936v1_FULL
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

  Here are the changes found in xe-pw-171936v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#1124])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2652]) +7 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2887])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2252])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#301] / [Intel XE#3149])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2311]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#4141])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#1503])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_pm_backlight@fade.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1499])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_vrr@flip-dpms.html

  * igt@xe_exec_fault_mode@many-multi-queue-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#8374])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#8378])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [PASS][15] -> [ABORT][16] ([Intel XE#8007]) +2 other tests abort
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][17] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [FAIL][19] ([Intel XE#6078]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][21] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][22] +1 other test pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [DMESG-FAIL][23] ([Intel XE#7774]) -> [PASS][24] +1 other test pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][25] ([Intel XE#301]) -> [PASS][26] +4 other tests pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][27] ([Intel XE#8399]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_exec_basic@many-rebind:
    - shard-bmg:          [SKIP][29] ([Intel XE#8589]) -> [PASS][30] +48 other tests pass
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_basic@many-rebind.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_exec_basic@many-rebind.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-bmg:          [SKIP][31] ([Intel XE#8589]) -> [SKIP][32] ([Intel XE#2327])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][33] ([Intel XE#8589]) -> [SKIP][34] ([Intel XE#1124])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][35] ([Intel XE#8589]) -> [SKIP][36] ([Intel XE#7679])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][37] ([Intel XE#8589]) -> [SKIP][38] ([Intel XE#2652])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          [SKIP][39] ([Intel XE#8589]) -> [SKIP][40] ([Intel XE#7358])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][41] ([Intel XE#8589]) -> [SKIP][42] ([Intel XE#2321] / [Intel XE#7355])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][43] ([Intel XE#301]) -> [FAIL][44] ([Intel XE#301] / [Intel XE#3149])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][45] ([Intel XE#8589]) -> [SKIP][46] ([Intel XE#2311]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][47] ([Intel XE#8589]) -> [SKIP][48] ([Intel XE#2313]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][49] ([Intel XE#3544]) -> [SKIP][50] ([Intel XE#3374] / [Intel XE#3544])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-bmg:          [SKIP][51] ([Intel XE#8589]) -> [SKIP][52] ([Intel XE#7283])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][53] ([Intel XE#8589]) -> [SKIP][54] ([Intel XE#7794])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr@psr-primary-blt:
    - shard-bmg:          [SKIP][55] ([Intel XE#8589]) -> [SKIP][56] ([Intel XE#2234] / [Intel XE#2850])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_psr@psr-primary-blt.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_psr@psr-primary-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][57] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][58] ([Intel XE#1729] / [Intel XE#7424])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][59] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][60] ([Intel XE#2426] / [Intel XE#5848])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][61] ([Intel XE#8589]) -> [SKIP][62] ([Intel XE#2322] / [Intel XE#7372])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic:
    - shard-bmg:          [SKIP][63] ([Intel XE#8589]) -> [SKIP][64] ([Intel XE#8364])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic.html

  * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
    - shard-bmg:          [SKIP][65] ([Intel XE#8589]) -> [SKIP][66] ([Intel XE#8378]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-bmg:          [SKIP][67] ([Intel XE#8589]) -> [SKIP][68] ([Intel XE#7793])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_page_reclaim@pde-vs-pd.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          [SKIP][69] ([Intel XE#8589]) -> [SKIP][70] ([Intel XE#944])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_query@multigpu-query-engines.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_query@multigpu-query-engines.html

  
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
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
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

  * Linux: xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92 -> xe-pw-171936v1

  IGT_9047: 9047
  xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92: 64945e34f2f3505d1def53d6752c04ddca144a92
  xe-pw-171936v1: 171936v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/index.html

--===============1717348020064720753==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix xe_device_probe() failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171936/">https://patchwork.freedesktop.org/series/171936/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92_FULL -&gt; xe-pw-171936v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-171936v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +2 other tests abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_basic@many-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_exec_basic@many-rebind.html">PASS</a> +48 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92 -&gt; xe-pw-171936v1</li>
</ul>
<p>IGT_9047: 9047<br />
  xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92: 64945e34f2f3505d1def53d6752c04ddca144a92<br />
  xe-pw-171936v1: 171936v1</p>

</body>
</html>

--===============1717348020064720753==--
