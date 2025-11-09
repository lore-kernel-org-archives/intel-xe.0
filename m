Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7E3CCFA13
	for <intel-xe@archiver.kernel.org>; Sun,  9 Nov 2025 01:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8561F10E05F;
	Sun,  9 Nov 2025 01:31:27 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8A310E05F;
 Sun,  9 Nov 2025 01:31:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2823534810862542135=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_VF_double_migration_=28rev?=
 =?utf-8?q?3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 09 Nov 2025 01:31:26 -0000
Message-ID: <176265188638.33229.9206424884738907386@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251107141015.29051-4-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251107141015.29051-4-satyanarayana.k.v.p@intel.com>
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

--===============2823534810862542135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VF double migration (rev3)
URL   : https://patchwork.freedesktop.org/series/156339/
State : failure

== Summary ==

CI Bug Log - changes from xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160_FULL -> xe-pw-156339v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156339v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156339v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156339v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1:
    - shard-adlp:         NOTRUN -> [ABORT][1] +6 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-3/igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1.html

  * igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-3/igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a1.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race:
    - shard-adlp:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-9/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [ABORT][5] +2 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-463/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset:
    - shard-bmg:          NOTRUN -> [ABORT][6] +3 other tests abort
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-race:
    - shard-lnl:          NOTRUN -> [ABORT][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-mmap-new-race.html

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr:
    - shard-dg2-set2:     [PASS][8] -> [ABORT][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-464/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-436/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-lnl:          [PASS][10] -> [ABORT][11] +1 other test abort
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-lnl-7/igt@xe_oa@mmio-triggered-reports-read.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-lnl-1/igt@xe_oa@mmio-triggered-reports-read.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][12] ([Intel XE#455] / [Intel XE#787]) -> [ABORT][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][14] ([Intel XE#787]) -> [ABORT][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          [SKIP][16] ([Intel XE#651]) -> [ABORT][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][18] ([Intel XE#2312]) -> [ABORT][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-adlp:         [SKIP][20] ([Intel XE#653]) -> [ABORT][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][22] -> [ABORT][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-436/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-4.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-463/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-4.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-bmg:          [SKIP][24] ([Intel XE#4837]) -> [ABORT][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-7/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-bmg-1/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset:
    - shard-lnl:          [SKIP][26] ([Intel XE#4943]) -> [ABORT][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset.html

  
Known issues
------------

  Here are the changes found in xe-pw-156339v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#787]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#310])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#656])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#651])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2311])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#651]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#653]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1406] / [Intel XE#1489])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1406] / [Intel XE#2939] / [Intel XE#5585])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#4837])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-463/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1392] / [Intel XE#5575])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_system_allocator@many-stride-mmap-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#4915]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-3/igt@xe_exec_system_allocator@many-stride-mmap-prefetch.html

  * igt@xe_exec_system_allocator@twice-large-mmap-prefetch-shared:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#4915]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-433/igt@xe_exec_system_allocator@twice-large-mmap-prefetch-shared.html

  
#### Possible fixes ####

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - shard-dg2-set2:     [ABORT][43] -> [PASS][44] +2 other tests pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-436/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-463/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after:
    - shard-lnl:          [ABORT][45] -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-lnl-4/igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after.html

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr:
    - shard-adlp:         [ABORT][47] -> [PASS][48] +5 other tests pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-1/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-8/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html

  * igt@xe_vm@mixed-userptr-binds-3145728:
    - shard-bmg:          [ABORT][49] -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-1/igt@xe_vm@mixed-userptr-binds-3145728.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-bmg-6/igt@xe_vm@mixed-userptr-binds-3145728.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         [ABORT][51] -> [DMESG-FAIL][52] ([Intel XE#4543])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-adlp:         [ABORT][53] -> [SKIP][54] ([Intel XE#6507])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-8/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-1/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [ABORT][55] -> [SKIP][56] ([Intel XE#2311])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5585]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787


Build changes
-------------

  * Linux: xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160 -> xe-pw-156339v3

  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160: 35cd059ed9ec8f39c25a160137ba85a150349160
  xe-pw-156339v3: 156339v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/index.html

--===============2823534810862542135==
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
<tr><td><b>Series:</b></td><td>VF double migration (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156339/">https://patchwork.freedesktop.org/series/156339/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160_FULL -&gt; xe-pw-156339v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156339v3_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156339v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156339v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-3/igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1.html">ABORT</a> +6 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-3/igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a1.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-9/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-463/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset.html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-mmap-new-race.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-464/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-436/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-lnl-7/igt@xe_oa@mmio-triggered-reports-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-lnl-1/igt@xe_oa@mmio-triggered-reports-read.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-6.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-slowdraw.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-436/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-4.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-463/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-4.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-7/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-bmg-1/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156339v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585">Intel XE#5585</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-463/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-3/igt@xe_exec_system_allocator@many-stride-mmap-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-prefetch-shared:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-433/igt@xe_exec_system_allocator@twice-large-mmap-prefetch-shared.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-dg2-436/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-dg2-463/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-lnl-4/igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-stride-malloc-fork-read-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-1/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-8/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-userptr-binds-3145728:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-1/igt@xe_vm@mixed-userptr-binds-3145728.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-bmg-6/igt@xe_vm@mixed-userptr-binds-3145728.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-adlp-8/igt@kms_chamelium_sharpness_filter@filter-basic.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-adlp-1/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160 -&gt; xe-pw-156339v3</li>
</ul>
<p>IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4068-35cd059ed9ec8f39c25a160137ba85a150349160: 35cd059ed9ec8f39c25a160137ba85a150349160<br />
  xe-pw-156339v3: 156339v3</p>

</body>
</html>

--===============2823534810862542135==--
