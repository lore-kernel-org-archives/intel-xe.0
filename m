Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA28CD4F3C
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 15:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DAD10F0DF;
	Wed, 20 May 2026 15:34:50 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A92710F0DF;
 Wed, 20 May 2026 15:34:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8302093994223810438=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Fix_return_type_?=
 =?utf-8?q?of_disable=5Flate=5Fbinding=5Fset=28=29_in_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohanram Meenakshisundaram" <mohanram.meenakshisundaram@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 May 2026 15:34:49 -0000
Message-ID: <177929128909.92320.8961802809952423196@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260520070255.2021100-1-mohanram.meenakshisundaram@intel.com>
In-Reply-To: <20260520070255.2021100-1-mohanram.meenakshisundaram@intel.com>
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

--===============8302093994223810438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix return type of disable_late_binding_set() in debugfs
URL   : https://patchwork.freedesktop.org/series/166914/
State : failure

== Summary ==

CI Bug Log - changes from xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe_FULL -> xe-pw-166914v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166914v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166914v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166914v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-race:
    - shard-bmg:          ([PASS][1], [PASS][2]) -> [INCOMPLETE][3]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-race.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-free-race.html

  
Known issues
------------

  Here are the changes found in xe-pw-166914v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          ([PASS][4], [PASS][5]) -> [FAIL][6] ([Intel XE#7445])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@intel_hwmon@hwmon-write.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@intel_hwmon@hwmon-write.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-10/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          ([PASS][7], [PASS][8]) -> [FAIL][9] ([Intel XE#3718] / [Intel XE#6078])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:
    - shard-bmg:          ([PASS][10], [PASS][11]) -> [FAIL][12] ([Intel XE#6078])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-9/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2325] / [Intel XE#7358])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2252])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-5/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2390] / [Intel XE#6974])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2321] / [Intel XE#7355])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#301])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#4141]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#656] / [Intel XE#7905])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2311]) +10 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2313]) +11 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7905])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7061])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#7915]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7130]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7283])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1489]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-9/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1406])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-lnl-4/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@psr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_psr@psr-sprite-render.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7636])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7136])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-6/igt@xe_exec_fault_mode@once-multi-queue.html

  * igt@xe_exec_multi_queue@max-queues-basic:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#6874]) +6 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-basic.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7866]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - shard-lnl:          [PASS][41] -> [ABORT][42] ([Intel XE#8007])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-8/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-lnl-1/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7138]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6964])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_page_reclaim@pat-index-xd:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7793])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@xe_page_reclaim@pat-index-xd.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#944])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-10/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          ([PASS][47], [FAIL][48]) -> [PASS][49]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@core_getversion@all-cards.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@core_getversion@all-cards.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@core_getversion@all-cards.html

  * igt@fbdev@read:
    - shard-bmg:          ([PASS][50], [FAIL][51]) ([Intel XE#7859]) -> [PASS][52]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@fbdev@read.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@fbdev@read.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-8/igt@fbdev@read.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][53] ([Intel XE#7084]) -> [PASS][54] +1 other test pass
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          ([PASS][55], [FAIL][56]) ([Intel XE#7949]) -> [PASS][57]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-4/igt@kms_fbcon_fbt@psr-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          ([DMESG-FAIL][58], [PASS][59]) -> [PASS][60]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          ([DMESG-FAIL][61], [PASS][62]) ([Intel XE#5545] / [Intel XE#7774]) -> [PASS][63] +1 other test pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][64] ([Intel XE#301]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][66] ([Intel XE#7308]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          ([SKIP][68], [SKIP][69]) ([Intel XE#2685] / [Intel XE#3307]) -> [PASS][70]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_plane_scaling@intel-max-src-size.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          ([FAIL][71], [FAIL][72]) ([Intel XE#7340]) -> [PASS][73]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-bmg:          ([PASS][74], [DMESG-FAIL][75]) ([Intel XE#7129] / [Intel XE#7774]) -> [PASS][76]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_sequence@queue-idle:
    - shard-bmg:          ([PASS][77], [INCOMPLETE][78]) -> [PASS][79] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@kms_sequence@queue-idle.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_sequence@queue-idle.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@kms_sequence@queue-idle.html

  * igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap:
    - shard-lnl:          ([ABORT][80], [ABORT][81]) ([Intel XE#8044]) -> [PASS][82]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-1/igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-7/igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-lnl-2/igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap.html

  * igt@xe_exec_system_allocator@threads-many-large-new:
    - shard-bmg:          ([SKIP][83], [PASS][84]) ([Intel XE#6703]) -> [PASS][85] +271 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-new.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-new.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-large-new.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          ([FAIL][86], [FAIL][87]) ([Intel XE#6569]) -> [PASS][88]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16:
    - shard-bmg:          ([FAIL][89], [FAIL][90]) ([Intel XE#7992]) -> [PASS][91] +24 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-bmg:          ([SKIP][92], [PASS][93]) ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][94] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_vm@large-split-binds-536870912.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_vm@large-split-binds-536870912.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-9/igt@xe_vm@large-split-binds-536870912.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          ([SKIP][95], [SKIP][96]) ([Intel XE#2327] / [Intel XE#6703]) -> [SKIP][97] ([Intel XE#2327])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          ([SKIP][98], [SKIP][99]) ([Intel XE#1124] / [Intel XE#6703]) -> [SKIP][100] ([Intel XE#1124]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          ([SKIP][101], [SKIP][102]) ([Intel XE#6703] / [Intel XE#7679]) -> [SKIP][103] ([Intel XE#7679])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          ([SKIP][104], [SKIP][105]) ([Intel XE#2887] / [Intel XE#6703]) -> [SKIP][106] ([Intel XE#2887]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          ([SKIP][107], [SKIP][108]) ([Intel XE#3432] / [Intel XE#6703]) -> [SKIP][109] ([Intel XE#3432])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          ([SKIP][110], [SKIP][111]) ([Intel XE#2325] / [Intel XE#6703] / [Intel XE#7358]) -> [SKIP][112] ([Intel XE#2325] / [Intel XE#7358])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_chamelium_color@ctm-0-50.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          ([SKIP][113], [SKIP][114]) ([Intel XE#2252] / [Intel XE#6703]) -> [SKIP][115] ([Intel XE#2252]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-10/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          ([SKIP][116], [SKIP][117]) ([Intel XE#2390] / [Intel XE#6703] / [Intel XE#6974]) -> [SKIP][118] ([Intel XE#2390] / [Intel XE#6974]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_content_protection@dp-mst-type-1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          ([SKIP][119], [SKIP][120]) ([Intel XE#2320] / [Intel XE#6703]) -> [SKIP][121] ([Intel XE#2320]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          ([SKIP][122], [SKIP][123]) ([Intel XE#2321] / [Intel XE#6703] / [Intel XE#7355]) -> [SKIP][124] ([Intel XE#2321] / [Intel XE#7355])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          ([SKIP][125], [SKIP][126]) ([Intel XE#4354] / [Intel XE#5870] / [Intel XE#6703]) -> [SKIP][127] ([Intel XE#4354] / [Intel XE#5870])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          ([SKIP][128], [SKIP][129]) ([Intel XE#4156] / [Intel XE#6703] / [Intel XE#7425]) -> [SKIP][130] ([Intel XE#4156] / [Intel XE#7425])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_fbcon_fbt@fbc.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          ([SKIP][131], [SKIP][132]) ([Intel XE#2373] / [Intel XE#6703] / [Intel XE#7448]) -> [SKIP][133] ([Intel XE#2373] / [Intel XE#7448])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_feature_discovery@display-3x.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_feature_discovery@display-3x.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-bmg:          ([SKIP][134], [SKIP][135]) ([Intel XE#6703] / [Intel XE#7179]) -> [SKIP][136] ([Intel XE#7179])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          ([SKIP][137], [SKIP][138]) ([Intel XE#6703] / [Intel XE#7178] / [Intel XE#7351]) -> [SKIP][139] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          ([SKIP][140], [SKIP][141]) ([Intel XE#2311] / [Intel XE#6557] / [Intel XE#6703]) -> [SKIP][142] ([Intel XE#2311]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          ([SKIP][143], [SKIP][144]) ([Intel XE#2311] / [Intel XE#6703]) -> [SKIP][145] ([Intel XE#2311]) +22 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          ([SKIP][146], [SKIP][147]) ([Intel XE#4141] / [Intel XE#6703]) -> [SKIP][148] ([Intel XE#4141]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:
    - shard-bmg:          ([SKIP][149], [SKIP][150]) ([Intel XE#6703] / [Intel XE#7061] / [Intel XE#7356]) -> [SKIP][151] ([Intel XE#7061] / [Intel XE#7356])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:
    - shard-bmg:          ([SKIP][152], [SKIP][153]) ([Intel XE#6703] / [Intel XE#7061]) -> [SKIP][154] ([Intel XE#7061]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          ([SKIP][155], [SKIP][156]) ([Intel XE#2313] / [Intel XE#6703]) -> [SKIP][157] ([Intel XE#2313]) +19 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          ([SKIP][158], [PASS][159]) ([Intel XE#1503]) -> [SKIP][160] ([Intel XE#1503])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_hdr@invalid-hdr.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          ([SKIP][161], [PASS][162]) ([Intel XE#7922]) -> [SKIP][163] ([Intel XE#7922]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          ([SKIP][164], [SKIP][165]) ([Intel XE#2486] / [Intel XE#6703]) -> [SKIP][166] ([Intel XE#2486]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_panel_fitting@legacy.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_panel_fitting@legacy.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-bmg:          ([SKIP][167], [SKIP][168]) ([Intel XE#6703] / [Intel XE#7283]) -> [SKIP][169] ([Intel XE#7283]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          ([SKIP][170], [SKIP][171]) ([Intel XE#6703] / [Intel XE#7794]) -> [SKIP][172] ([Intel XE#7794])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          ([SKIP][173], [SKIP][174]) ([Intel XE#1489] / [Intel XE#6703]) -> [SKIP][175] ([Intel XE#1489]) +3 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          ([SKIP][176], [SKIP][177]) ([Intel XE#2234] / [Intel XE#2850] / [Intel XE#6703]) -> [SKIP][178] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          ([SKIP][179], [SKIP][180]) ([Intel XE#2330] / [Intel XE#5813] / [Intel XE#6703]) -> [SKIP][181] ([Intel XE#2330] / [Intel XE#5813])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          ([SKIP][182], [SKIP][183]) ([Intel XE#6503] / [Intel XE#6703]) -> [SKIP][184] ([Intel XE#6503])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-4/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][185] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][186] ([Intel XE#1729] / [Intel XE#7424])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          ([SKIP][187], [SKIP][188]) ([Intel XE#6703] / [Intel XE#7636]) -> [SKIP][189] ([Intel XE#7636]) +5 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_eudebug_online@single-step-one.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_eudebug_online@single-step-one.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-9/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-bmg:          ([SKIP][190], [SKIP][191]) ([Intel XE#2322] / [Intel XE#6703] / [Intel XE#7372]) -> [SKIP][192] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@twice-multi-queue:
    - shard-bmg:          ([SKIP][193], [SKIP][194]) ([Intel XE#6703] / [Intel XE#7136]) -> [SKIP][195] ([Intel XE#7136]) +4 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@xe_exec_fault_mode@twice-multi-queue.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue.html

  * igt@xe_exec_multi_queue@two-queues-userptr:
    - shard-bmg:          ([SKIP][196], [SKIP][197]) ([Intel XE#6703] / [Intel XE#6874]) -> [SKIP][198] ([Intel XE#6874]) +13 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-userptr.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-userptr.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-fd-basic:
    - shard-bmg:          ([SKIP][199], [SKIP][200]) ([Intel XE#6703] / [Intel XE#7138]) -> [SKIP][201] ([Intel XE#7138]) +4 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-basic.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-fd-basic.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-fd-basic.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          ([SKIP][202], [SKIP][203]) ([Intel XE#6703] / [Intel XE#7793]) -> [SKIP][204] ([Intel XE#7793])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_page_reclaim@binds-1g-partial.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_page_reclaim@binds-1g-partial.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          ([SKIP][205], [SKIP][206]) ([Intel XE#4733] / [Intel XE#6703] / [Intel XE#7417]) -> [SKIP][207] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          ([ABORT][208], [ABORT][209]) ([Intel XE#7914]) -> [ABORT][210] ([Intel XE#8007])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-8/igt@xe_wedged@wedged-mode-toggle.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7129
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7859]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7859
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7949
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8044
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8921 -> IGT_8922
  * Linux: xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe -> xe-pw-166914v1

  IGT_8921: 8921
  IGT_8922: 8922
  xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe: 81e61a51364beae8f6e63a2d89c776a6b4b323fe
  xe-pw-166914v1: 166914v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/index.html

--===============8302093994223810438==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix return type of disable_late_bind=
ing_set() in debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/166914/">https://patchwork.freedesktop.org/series/166914/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-166914v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-166914v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5099-81e61a51364beae8f6e63a2d89c776a6b=
4b323fe_FULL -&gt; xe-pw-166914v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166914v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-166914v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1669=
14v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-fr=
ee-race:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@xe_exec=
_system_allocator@threads-shared-vm-many-large-execqueues-free-race.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61=
a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@xe_exec_system_allocato=
r@threads-shared-vm-many-large-execqueues-free-race.html">PASS</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bm=
g-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-fr=
ee-race.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166914v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@intel_h=
wmon@hwmon-write.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt=
@intel_hwmon@hwmon-write.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-10/igt@intel_hwmon@hwmon-=
write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7445">Intel XE#7445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_asy=
nc_flips@alternate-sync-async-flip.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323=
fe/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1=
/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel =
XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_asy=
nc_flips@alternate-sync-async-flip@pipe-c-dp-2.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89=
c776a6b4b323fe/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pi=
pe-c-dp-2.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-166914v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-asy=
nc-flip@pipe-c-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-9/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@kms_chamelium_color@ctm-green=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-5/igt@kms_chamelium_frames@hdmi-cmp=
-planar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-4/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-10/igt@kms_cursor_crc@cursor-onscre=
en-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-lnl-8/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
srhdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcp=
srhdr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-=
argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_hdr@=
invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bm=
g-3/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/79=
15">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tile=
d-bmg-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tile=
d-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-9/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-lnl-4/igt@kms_psr@fbc-pr-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_psr@psr-sprite-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-vm-d=
estroy-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#=
2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-6/igt@xe_exec_fault_mode@once-multi=
-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-10/igt@xe_exec_multi_queue@max-queu=
es-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6874">Intel XE#6874</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-=
cat-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7866">Intel XE#7866</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-8/igt@xe_exec_=
threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-lnl-1/igt@xe_exec_thread=
s@threads-mixed-fd-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-9/igt@xe_exec_threads@threads-multi=
-queue-cm-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@xe_multigpu_svm@mgpu-concurre=
nt-access-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pat-index-xd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@xe_page_reclaim@pat-index-xd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166914v1/shard-bmg-10/igt@xe_query@multigpu-query-uc-f=
w-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@core_ge=
tversion@all-cards.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/i=
gt@core_getversion@all-cards.html">FAIL</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@core_getversion=
@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@fbdev@r=
ead.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@fbdev@read.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7859">Intel XE#7859</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-166914v1/shard-bmg-8/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard=
-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-8/igt@kms_fbc=
on_fbt@psr-suspend.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-4/i=
gt@kms_fbcon_fbt@psr-suspend.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7949">Intel XE#7949</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-lnl-2/igt@k=
ms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:=
</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fli=
p@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">DMESG-FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a=
51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_flip@2x-flip-vs-abso=
lute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-5/ig=
t@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fli=
p@2x-plain-flip-ts-check-interruptible.html">DMESG-FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c7=
76a6b4b323fe/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5545">Intel XE#5545</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-5/igt@kms_flip@2x-plai=
n-flip-ts-check-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shar=
d-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@kms_hdmi=
_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-8/igt@kms_hdmi_i=
nject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_pla=
ne_scaling@intel-max-src-size.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/sh=
ard-bmg-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#2685=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307"=
>Intel XE#3307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-3/igt@kms_pm_=
dc@dc6-psr.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-2/igt@kms_p=
m_dc@dc6-psr.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_rot=
ation_crc@multiplane-rotation-cropping-top.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776=
a6b4b323fe/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-to=
p.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7129">Intel XE#7129</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_rota=
tion_crc@multiplane-rotation-cropping-top.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@kms_seq=
uence@queue-idle.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt=
@kms_sequence@queue-idle.html">INCOMPLETE</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@kms_sequence@=
queue-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-1/igt@xe_exec=
_system_allocator@many-stride-mmap-shared-remap-dontunmap.html">ABORT</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364bea=
e8f6e63a2d89c776a6b4b323fe/shard-lnl-7/igt@xe_exec_system_allocator@many-st=
ride-mmap-shared-remap-dontunmap.html">ABORT</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8044">Intel XE#8044</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-lnl-2/=
igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec=
_system_allocator@threads-many-large-new.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6=
b4b323fe/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-new.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-166914v1/shard-bmg-7/igt@xe_exec_system_allocator@threads=
-many-large-new.html">PASS</a> +271 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@xe_srio=
v_flr@flr-vfs-parallel.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg=
-10/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bm=
g-7/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@xe_srio=
v_vfio@bind-unbind-vfs@numvfs-16.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe=
/shard-bmg-9/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel X=
E#7992</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-166914v1/shard-bmg-1/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html">PA=
SS</a> +24 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_vm@l=
arge-split-binds-536870912.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard=
-bmg-9/igt@xe_vm@large-split-binds-536870912.html">PASS</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-166914v1/shard-bmg-9/igt@xe_vm@large-split-binds-536870912.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_big=
_fb@4-tiled-32bpp-rotate-270.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/sha=
rd-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-166914v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_big=
_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shar=
d-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-166914v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_bw@=
connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e6=
3a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displ=
ays-target-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-=
7/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679"=
>Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_ccs=
@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89=
c776a6b4b323fe/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen=
12-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>=
) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_ccs=
@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b=
4b323fe/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3432">Intel XE#3432</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-7/igt@kms_ccs@crc-primary-=
suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_cha=
melium_color@ctm-0-50.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-=
2/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358"=
>Intel XE#7358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">I=
ntel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_cha=
melium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c=
776a6b4b323fe/shard-bmg-9/igt@kms_chamelium_edid@hdmi-edid-change-during-hi=
bernate.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2252">Intel XE#2252</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-10/igt@kms_cha=
melium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_con=
tent_protection@dp-mst-type-1.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/sh=
ard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6974">Intel XE#6974</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_content_protection@dp-=
mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_cur=
sor_crc@cursor-offscreen-128x42.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/=
shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#=
2320</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-166914v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x=
42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_cur=
sor_crc@cursor-sliding-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/s=
hard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#23=
21</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3">Intel XE#6703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7355">Intel XE#7355</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-10/igt@kms_cursor_crc@cursor-s=
liding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_dp_=
link_training@uhbr-sst.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg=
-2/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870">Intel XE#5870=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_dp_link_training@uhbr-sst.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">=
Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fbc=
on_fbt@fbc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_f=
bcon_fbt@fbc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard=
-bmg-3/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_fea=
ture_discovery@display-3x.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-=
bmg-2/igt@kms_feature_discovery@display-3x.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel X=
E#6703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7448">Intel XE#7448</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@kms_feature_discovery@display-3x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2373">Intel XE#2373</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_fli=
p_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8=
f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-lin=
ear-to-32bpp-linear-reflect-x.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/sh=
ard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect=
-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fli=
p_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae=
8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-upscaling.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Inte=
l XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-166914v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64=
bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae=
8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-=
primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-166914v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri=
-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_fro=
ntbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63=
a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndsc=
rn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-8/=
igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">In=
tel XE#2311</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6=
e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-prim=
scrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-=
bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@fbcpsr-argb161616f-draw-blt.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c=
776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-d=
raw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-=
1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel =
XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63=
a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr=
161616f-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-3/=
igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">In=
tel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364bea=
e8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v=
1/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-dra=
w-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2313">Intel XE#2313</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_hd=
r@invalid-hdr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@km=
s_hdr@invalid-hdr.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_hdr@inva=
lid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_hd=
r@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a=
6b4b323fe/shard-bmg-3/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7922">Intel XE#7922</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_hdr@invalid-hdr@pipe-a-hdmi=
-a-3-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7922">Intel XE#7922</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_pan=
el_fitting@legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/ig=
t@kms_panel_fitting@legacy.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard=
-bmg-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_pla=
ne@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c77=
6a6b4b323fe/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modif=
ier.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-7/igt@kms_plane@pi=
xel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_pm_=
dc@dc3co-vpb-simulation.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bm=
g-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#77=
94</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
6914v1/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#77=
94</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_psr=
2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c7=
76a6b4b323fe/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg=
-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1489">Intel XE#1489</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@kms_psr2_s=
f@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_psr=
@fbc-pr-cursor-plane-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard=
-bmg-9/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel=
 XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-166914v1/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_rot=
ation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b=
4b323fe/shard-bmg-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5813">Intel XE#5813</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5=
813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_sha=
rpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89=
c776a6b4b323fe/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-sca=
ling-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6503">Intel XE#6503</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-4/igt@kms_sh=
arpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shar=
d-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">In=
tel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_eude=
bug_online@single-step-one.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard=
-bmg-2/igt@xe_eudebug_online@single-step-one.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel=
 XE#7636</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-166914v1/shard-bmg-9/igt@xe_eudebug_online@single-step-one.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">In=
tel XE#7636</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec=
_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6=
b4b323fe/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@xe_e=
xec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel X=
E#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@xe_exec=
_fault_mode@twice-multi-queue.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/sh=
ard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136"=
>Intel XE#7136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-166914v1/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7136">Intel XE#7136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-userptr:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec=
_multi_queue@two-queues-userptr.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/=
shard-bmg-9/igt@xe_exec_multi_queue@two-queues-userptr.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
874">Intel XE#6874</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-166914v1/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-userp=
tr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-basic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec=
_threads@threads-multi-queue-fd-basic.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b=
323fe/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-fd-basic.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3">Intel XE#6703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7138">Intel XE#7138</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-1/igt@xe_exec_threads@threads-=
multi-queue-fd-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_page=
_reclaim@binds-1g-partial.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-=
bmg-2/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel X=
E#7793</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-166914v1/shard-bmg-1/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel=
 XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_pxp@=
pxp-termination-key-update-post-suspend.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b=
4b323fe/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-suspend.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg-2/igt@xe_pxp=
@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7=
417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-8/igt@xe_wedg=
ed@wedged-mode-toggle.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg=
-4/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7914">Intel XE#7914</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166914v1/shard-bmg=
-6/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8921 -&gt; IGT_8922</li>
<li>Linux: xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe -&gt; xe-pw-166=
914v1</li>
</ul>
<p>IGT_8921: 8921<br />
  IGT_8922: 8922<br />
  xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe: 81e61a51364beae8f6e63a2=
d89c776a6b4b323fe<br />
  xe-pw-166914v1: 166914v1</p>

</body>
</html>

--===============8302093994223810438==--
