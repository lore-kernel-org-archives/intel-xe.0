Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5392FCD98CE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 23:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46BC10E68A;
	Mon, 15 Jun 2026 23:22:23 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485C010E563;
 Mon, 15 Jun 2026 23:22:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6815464242880970544=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/display=3A_All_pa?=
 =?utf-8?q?tches_to_make_PREEMPT=5FRT_work_on_i915_+_xe=2E_=28rev16=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Jun 2026 23:22:22 -0000
Message-ID: <178156574228.81567.13693051535816757428@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260615201846.307297-1-dev@lankhorst.se>
In-Reply-To: <20260615201846.307297-1-dev@lankhorst.se>
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

--===============6815464242880970544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: All patches to make PREEMPT_RT work on i915 + xe. (rev16)
URL   : https://patchwork.freedesktop.org/series/159034/
State : failure

== Summary ==

CI Bug Log - changes from xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360_FULL -> xe-pw-159034v16_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159034v16_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159034v16_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159034v16_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-lnl:          NOTRUN -> ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-7/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-5/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-5/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-2/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-3/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-3/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-3/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-2/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-1/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-1/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-6/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-2/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-7/igt@runner@aborted.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][14] -> [FAIL][15] +5 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-10/igt@xe_module_load@reload-no-display.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_module_load@reload-no-display.html

  
Known issues
------------

  Here are the changes found in xe-pw-159034v16_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#5177] / [Intel XE#6703])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-1/igt@intel_hwmon@hwmon-read.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][18] -> [FAIL][19] ([Intel XE#3718] / [Intel XE#6078]) +3 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#6078]) +10 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2327]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-10/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-10/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#3432])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2320]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#8265])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][29] -> [FAIL][30] ([Intel XE#3149] / [Intel XE#3321]) +3 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][31] -> [FAIL][32] ([Intel XE#3321]) +15 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7178] / [Intel XE#7351])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2311]) +13 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4141]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2313]) +11 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1503])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7922]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#7915]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-5/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6901])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7283])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#5021] / [Intel XE#7377])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1489])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-1/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2330] / [Intel XE#5813])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7636]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_eudebug@vma-ufence.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][49] -> [INCOMPLETE][50] ([Intel XE#6321])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#7136]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#6874]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#6703]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_exec_system_allocator@many-large-execqueues-mmap-prefetch.html

  * igt@xe_exec_system_allocator@process-many-new-nomemset:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#6703]) +56 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-1/igt@xe_exec_system_allocator@process-many-new-nomemset.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_exec_system_allocator@process-many-new-nomemset.html

  * igt@xe_exec_system_allocator@twice-large-mmap:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#6557] / [Intel XE#6703])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-10/igt@xe_exec_system_allocator@twice-large-mmap.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_exec_system_allocator@twice-large-mmap.html

  * igt@xe_exec_threads@threads-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#7138]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-rebind.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#6964])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-4/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  * igt@xe_oa@non-zero-reason-all@oag-0:
    - shard-bmg:          [PASS][61] -> [FAIL][62] ([Intel XE#7334]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-1/igt@xe_oa@non-zero-reason-all@oag-0.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-10/igt@xe_oa@non-zero-reason-all@oag-0.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2245] / [Intel XE#7590])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_pat@pat-index-xelp.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7599])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#944]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_query@multigpu-query-hwconfig.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
    - shard-bmg:          [FAIL][66] ([Intel XE#3149] / [Intel XE#3321]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [FAIL][68] ([Intel XE#6569]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@default-enabled-fair-scheduling:
    - shard-bmg:          [FAIL][70] ([Intel XE#7992]) -> [PASS][71] +1 other test pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-6/igt@xe_sriov_scheduling@default-enabled-fair-scheduling.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-5/igt@xe_sriov_scheduling@default-enabled-fair-scheduling.html

  * igt@xe_sriov_scheduling@default-enabled-fair-scheduling@numvfs-random-gt1-vcs0:
    - shard-bmg:          [SKIP][72] -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-6/igt@xe_sriov_scheduling@default-enabled-fair-scheduling@numvfs-random-gt1-vcs0.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-5/igt@xe_sriov_scheduling@default-enabled-fair-scheduling@numvfs-random-gt1-vcs0.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [ABORT][74] ([Intel XE#8007]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-9/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][76] ([Intel XE#2327]) -> [SKIP][77] ([Intel XE#6703])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][78] ([Intel XE#1124]) -> [SKIP][79] ([Intel XE#6703])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][80] ([Intel XE#367]) -> [SKIP][81] ([Intel XE#6703])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-9/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][82] ([Intel XE#2652]) -> [SKIP][83] ([Intel XE#6703])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][84] ([Intel XE#6507]) -> [SKIP][85] ([Intel XE#6703])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          [SKIP][86] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][87] ([Intel XE#6703])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_dsc@dsc-with-formats-ultrajoiner:
    - shard-bmg:          [SKIP][88] ([Intel XE#8265]) -> [SKIP][89] ([Intel XE#6703])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-6/igt@kms_dsc@dsc-with-formats-ultrajoiner.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_dsc@dsc-with-formats-ultrajoiner.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][90] ([Intel XE#3149] / [Intel XE#3321]) -> [FAIL][91] ([Intel XE#3321])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][92] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][93] ([Intel XE#6703])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][94] ([Intel XE#4141]) -> [SKIP][95] ([Intel XE#6703]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][96] ([Intel XE#2311]) -> [SKIP][97] ([Intel XE#6703]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][98] ([Intel XE#7061]) -> [SKIP][99] ([Intel XE#6703])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][100] ([Intel XE#2313]) -> [SKIP][101] ([Intel XE#6703]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][102] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916]) -> [SKIP][103] ([Intel XE#6703])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          [SKIP][104] ([Intel XE#7283]) -> [SKIP][105] ([Intel XE#6703])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][106] ([Intel XE#1489]) -> [SKIP][107] ([Intel XE#6703])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-bmg:          [SKIP][108] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][109] ([Intel XE#6703]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-1/igt@kms_psr@fbc-pr-basic.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_sharpness_filter@filter-dpms:
    - shard-bmg:          [SKIP][110] ([Intel XE#6503]) -> [SKIP][111] ([Intel XE#6703])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-8/igt@kms_sharpness_filter@filter-dpms.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_sharpness_filter@filter-dpms.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][112] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][113] ([Intel XE#2426] / [Intel XE#5848])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          [SKIP][114] ([Intel XE#1499]) -> [SKIP][115] ([Intel XE#6703])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-7/igt@kms_vrr@flip-basic.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_vrr@flip-basic.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          [SKIP][116] ([Intel XE#7636]) -> [SKIP][117] ([Intel XE#6703]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-5/igt@xe_eudebug@basic-exec-queues.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:
    - shard-bmg:          [SKIP][118] ([Intel XE#7136]) -> [SKIP][119] ([Intel XE#6703])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-dyn-priority:
    - shard-bmg:          [SKIP][120] ([Intel XE#6874]) -> [SKIP][121] ([Intel XE#6703]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-dyn-priority.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_exec_multi_queue@many-execs-dyn-priority.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic:
    - shard-bmg:          [SKIP][122] ([Intel XE#7138]) -> [SKIP][123] ([Intel XE#6703])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-bmg:          [SKIP][124] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][125] ([Intel XE#6703])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-3/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8963 -> IGT_8964
  * Linux: xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360 -> xe-pw-159034v16

  IGT_8963: b19a1c7c50adbf0e090be48d9cbc90596a3434bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8964: 8964
  xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360: 0984dfdee2a4f9e1922fe919a6b469e115e23360
  xe-pw-159034v16: 159034v16

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/index.html

--===============6815464242880970544==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: All patches to make PREEMP=
T_RT work on i915 + xe. (rev16)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/159034/">https://patchwork.freedesktop.org/series/159034/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159034v16/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-159034v16/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5260-0984dfdee2a4f9e1922fe919a6b469e11=
5e23360_FULL -&gt; xe-pw-159034v16_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159034v16_FULL absolutely need=
 to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-159034v16_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1590=
34v16_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159034v16/shard-lnl-7/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/sh=
ard-lnl-5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-5/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15903=
4v16/shard-lnl-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-3/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-159034v16/shard-lnl-3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-3/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-159034v16/shard-lnl-2/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-1/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-159034v16/shard-lnl-1/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-=
lnl-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-159034v16/shard-lnl-2/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16=
/shard-lnl-7/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-10/igt@xe_modu=
le_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_module_load@rel=
oad-no-display.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159034v16_FULL that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-1/igt@intel_hw=
mon@hwmon-read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@intel_hwmon@hwmon-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/51=
77">Intel XE#5177</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-3/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-3/igt@kms=
_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel=
 XE#6078</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-3/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/sha=
rd-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a=
-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6078">Intel XE#6078</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-10/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-st=
ride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-10/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd-w=
ith-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-10/igt@kms_cursor_crc@cursor-slidi=
ng-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-9/igt@kms_dsc@dsc-with-output-form=
ats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-10/igt@kms_fli=
p@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-4/igt@km=
s_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Inte=
l XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-10/igt@kms_fli=
p@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/sha=
rd-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3321">Intel XE#3321</a>) +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32b=
pp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-10/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc=
psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-4/igt@kms_frontbuffer_tracking@psr=
hdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503=
">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-h=
dmi-a-3-xrgb16161616f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-5/igt@kms_hdr@=
static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/i=
gt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel X=
E#7915</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-8/igt@kms_joiner@basic-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-7/igt@kms_plane@pixel-format-4-til=
ed-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-9/igt@kms_plane_multiple@2x-tiling=
-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-1/igt@kms_psr@fbc-psr2-sprite-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-1/igt@kms_rotation_crc@primary-y-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_eudebug@vma-ufence.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/76=
36">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-7/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-3/igt@xe_evic=
t@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE=
#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-2/igt@xe_exec_fault_mode@once-mult=
i-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-4/igt@xe_exec_multi_queue@few-exec=
s-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_exec_system_allocator@man=
y-large-execqueues-mmap-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-1/igt@xe_exec_=
system_allocator@process-many-new-nomemset.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@x=
e_exec_system_allocator@process-many-new-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-10/igt@xe_exec=
_system_allocator@twice-large-mmap.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_exec_s=
ystem_allocator@twice-large-mmap.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-1/igt@xe_exec_threads@threads-mult=
i-queue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-4/igt@xe_multigpu_svm@mgpu-xgpu-ac=
cess-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all@oag-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-1/igt@xe_oa@no=
n-zero-reason-all@oag-0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-10/igt@xe_oa@non-zero-reas=
on-all@oag-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7334">Intel XE#7334</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_pat@pat-index-xelp.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
45">Intel XE#2245</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-2/igt@xe_prefetch_fault@prefetch-f=
ault-svm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_query@multigpu-query-hwco=
nfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Int=
el XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-159034v16/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-2/igt@xe_sriov=
_flr@flr-twice.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-4/igt@xe_sriov_flr@fl=
r-twice.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@default-enabled-fair-scheduling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-6/igt@xe_sriov=
_scheduling@default-enabled-fair-scheduling.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/sh=
ard-bmg-5/igt@xe_sriov_scheduling@default-enabled-fair-scheduling.html">PAS=
S</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@default-enabled-fair-scheduling@numvfs-random-gt=
1-vcs0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-6/igt@xe_sriov=
_scheduling@default-enabled-fair-scheduling@numvfs-random-gt1-vcs0.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
034v16/shard-bmg-5/igt@xe_sriov_scheduling@default-enabled-fair-scheduling@=
numvfs-random-gt1-vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-7/igt@xe_wedge=
d@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-9/igt@xe_wedge=
d@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-4/igt@kms_big_=
fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms=
_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-10/igt@kms_big=
_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1590=
34v16/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hf=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-9/igt@kms_bw@l=
inear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-=
bmg-6/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-5/igt@kms_ccs@=
random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/i=
gt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-2/igt@kms_cham=
elium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-=
6/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-4/igt@kms_curs=
or_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1590=
34v16/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultrajoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-6/igt@kms_dsc@=
dsc-with-formats-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@k=
ms_dsc@dsc-with-formats-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1590=
34v16/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/332=
1">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-2/igt@kms_flip=
_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Inte=
l XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp=
-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
59034v16/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">In=
tel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-159034v16/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-pri=
mscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v=
16/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel=
 XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-159034v16/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-=
pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1=
6/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-7/igt@kms_plan=
e@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v=
16/shard-bmg-6/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-9/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel X=
E#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-159034v16/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuo=
us-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-1/igt@kms_psr@=
fbc-pr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms=
_psr@fbc-pr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-8/igt@kms_shar=
pness_filter@filter-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_s=
harpness_filter@filter-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-4/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/sha=
rd-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848"=
>Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-7/igt@kms_vrr@=
flip-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@kms_vrr@flip-basic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-5/igt@xe_eudeb=
ug@basic-exec-queues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-6/igt@xe_eudebu=
g@basic-exec-queues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-2/igt@xe_exec_=
fault_mode@many-execqueues-multi-queue-prefetch.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1=
6/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-dyn-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-5/igt@xe_exec_=
multi_queue@many-execs-dyn-priority.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v16/shard-bmg-=
6/igt@xe_exec_multi_queue@many-execs-dyn-priority.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-5/igt@xe_exec_=
threads@threads-multi-queue-mixed-shared-vm-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1590=
34v16/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360/shard-bmg-3/igt@xe_pxp@r=
egular-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159034v1=
6/shard-bmg-6/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8963 -&gt; IGT_8964</li>
<li>Linux: xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360 -&gt; xe-pw-159=
034v16</li>
</ul>
<p>IGT_8963: b19a1c7c50adbf0e090be48d9cbc90596a3434bf @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8964: 8964<br />
  xe-5260-0984dfdee2a4f9e1922fe919a6b469e115e23360: 0984dfdee2a4f9e1922fe91=
9a6b469e115e23360<br />
  xe-pw-159034v16: 159034v16</p>

</body>
</html>

--===============6815464242880970544==--
