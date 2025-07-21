Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5032FC83F25
	for <intel-xe@archiver.kernel.org>; Mon, 21 Jul 2025 13:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1164410E54A;
	Mon, 21 Jul 2025 13:56:55 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9230010E546;
 Mon, 21 Jul 2025 13:56:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4745374992611100112=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/vf=3A_Post-migratio?=
 =?utf-8?q?n_recovery_of_queues_and_jobs_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Jul 2025 13:56:54 -0000
Message-ID: <175310621458.177010.11885984006717480822@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250719073745.74251-1-tomasz.lis@intel.com>
In-Reply-To: <20250719073745.74251-1-tomasz.lis@intel.com>
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

--===============4745374992611100112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Post-migration recovery of queues and jobs (rev8)
URL   : https://patchwork.freedesktop.org/series/148982/
State : success

== Summary ==

CI Bug Log - changes from xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2_FULL -> xe-pw-148982v8_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-148982v8_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][1] ([Intel XE#1124]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][2] -> [SKIP][3] ([Intel XE#2314] / [Intel XE#2894])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#787]) +146 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][6] -> [INCOMPLETE][7] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][8] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#787]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][11] ([Intel XE#1178])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-435/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][12] ([Intel XE#1188])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-464/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2291])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#3009])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-4/igt@kms_dp_aux_dev.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#4294])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#455]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#2316]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][22] -> [FAIL][23] ([Intel XE#3098]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][24] -> [DMESG-WARN][25] ([Intel XE#4543])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][26] ([Intel XE#4543]) +3 other tests dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#656]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#651])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_invalid_mode@zero-clock:
    - shard-adlp:         [PASS][29] -> [DMESG-WARN][30] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-6/igt@kms_invalid_mode@zero-clock.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-9/igt@kms_invalid_mode@zero-clock.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#4596])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1489])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#2850] / [Intel XE#929])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_setmode@basic@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][35] -> [FAIL][36] ([Intel XE#2883]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-434/igt@kms_setmode@basic@pipe-b-dp-4.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-463/igt@kms_setmode@basic@pipe-b-dp-4.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#1435])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#4459]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#4837] / [Intel XE#5565])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1392] / [Intel XE#5575])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][43] -> [SKIP][44] ([Intel XE#1392]) +4 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#288] / [Intel XE#5561]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [PASS][46] -> [DMESG-WARN][47] ([Intel XE#4812])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-4/igt@xe_exec_reset@gt-reset-stress.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-dontunmap:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#4915] / [Intel XE#5560]) +12 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-dontunmap.html

  * igt@xe_oa@mi-rpc:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#3573])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@xe_oa@mi-rpc.html

  * igt@xe_pat@pat-index-xe2:
    - shard-bmg:          [PASS][50] -> [FAIL][51] ([Intel XE#5507]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-1/igt@xe_pat@pat-index-xe2.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-2/igt@xe_pat@pat-index-xe2.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][52] ([Intel XE#4543]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][54] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][56] ([Intel XE#3124]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][58] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][60] ([Intel XE#4633]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][62] ([Intel XE#4302]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][64] ([Intel XE#2316]) -> [PASS][65] +2 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][66] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][68] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-3/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][70] ([Intel XE#4543]) -> [PASS][71] +2 other tests pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][72] ([Intel XE#1503]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
    - shard-adlp:         [DMESG-WARN][74] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][75] +5 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [FAIL][76] ([Intel XE#2883]) -> [PASS][77] +2 other tests pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-8/igt@kms_setmode@basic.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][78] ([Intel XE#2883]) -> [PASS][79] +2 other tests pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][80] ([Intel XE#2883]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-434/igt@kms_setmode@basic@pipe-b-hdmi-a-6.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-463/igt@kms_setmode@basic@pipe-b-hdmi-a-6.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][82] ([Intel XE#1392]) -> [PASS][83] +9 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [DMESG-WARN][84] ([Intel XE#3876]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-8/igt@xe_exec_reset@parallel-gt-reset.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     [DMESG-WARN][86] ([Intel XE#3876]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind-err.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-436/igt@xe_exec_threads@threads-hang-rebind-err.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][88] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][89] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][90] ([Intel XE#1178]) -> [SKIP][91] ([Intel XE#2341])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-4/igt@kms_content_protection@atomic.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][92] ([Intel XE#2291]) -> [DMESG-WARN][93] ([Intel XE#5354])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][94] ([Intel XE#4543]) -> [DMESG-WARN][95] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][96] ([Intel XE#2312]) -> [SKIP][97] ([Intel XE#2311]) +13 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][98] ([Intel XE#2311]) -> [SKIP][99] ([Intel XE#2312]) +6 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][100] ([Intel XE#5390]) -> [SKIP][101] ([Intel XE#2312]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][102] ([Intel XE#2312]) -> [SKIP][103] ([Intel XE#5390]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][104] ([Intel XE#2313]) -> [SKIP][105] ([Intel XE#2312]) +8 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][106] ([Intel XE#2312]) -> [SKIP][107] ([Intel XE#2313]) +11 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-adlp:         [ABORT][108] -> [SKIP][109] ([Intel XE#836])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         [SKIP][110] ([Intel XE#2939]) -> [SKIP][111] ([Intel XE#2939] / [Intel XE#5585]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#362]) -> [FAIL][113] ([Intel XE#1729])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1500]) -> [SKIP][115] ([Intel XE#362])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         [SKIP][116] ([Intel XE#1447]) -> [SKIP][117] ([Intel XE#1447] / [Intel XE#5596])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-3/igt@xe_compute@ccs-mode-compute-kernel.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-8/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-adlp:         [SKIP][118] ([Intel XE#2229]) -> [SKIP][119] ([Intel XE#2229] / [Intel XE#5488])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - shard-adlp:         [SKIP][120] ([Intel XE#1008]) -> [SKIP][121] ([Intel XE#1008] / [Intel XE#5591])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-9/igt@xe_mmap@vram.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-4/igt@xe_mmap@vram.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-adlp:         [SKIP][122] ([Intel XE#4733]) -> [SKIP][123] ([Intel XE#4733] / [Intel XE#5594]) +13 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-3/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-6/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4812
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5585]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5596
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2 -> xe-pw-148982v8

  IGT_8468: 8468
  xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2: 17cc1a17481ab5481b6cd9f01eb073a254b7a3b2
  xe-pw-148982v8: 148982v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/index.html

--===============4745374992611100112==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Post-migration recovery of queues=
 and jobs (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148982/">https://patchwork.freedesktop.org/series/148982/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148982v8/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148982v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3442-17cc1a17481ab5481b6cd9f01eb073a25=
4b7a3b2_FULL -&gt; xe-pw-148982v8_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148982v8_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +146 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
24">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-ti=
led-gen12-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-ti=
led-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-dg2-435/igt@kms_content_protection@lega=
cy@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-dg2-464/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/ig=
t@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#=
2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-4/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-8/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_dp_linktrai=
n_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_dsc@dsc-fractional-bpp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-panning.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_flip@2x-flip-vs-panni=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-4/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms=
_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-9/igt@kms_fli=
p@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-ad=
lp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a1.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_flip@plain-flip-ts-check=
-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
drrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-6/igt@kms_inv=
alid_mode@zero-clock.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-9/igt@kms_invalid_mode@zero-c=
lock.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +5 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_plane_multiple@=
2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-plane-m=
ove-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_psr@fbc-pr-primary-blt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-434/igt@kms_se=
tmode@basic@pipe-b-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-463/igt@kms_setmode@basic@p=
ipe-b-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2883">Intel XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-4/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-lnl-5/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148982v8/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@xe_eudebug_online@writes-cac=
hing-sram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@xe_exec_basic@multigpu-no-ex=
ec-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@xe_exec_fault_mode@once-bind=
execqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-4/igt@xe_exec=
_reset@gt-reset-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-9/igt@xe_exec_reset@gt-rese=
t-stress.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4812">Intel XE#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-remap-don=
tunmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-large-mmap-remap-dontunmap.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Inte=
l XE#5560</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@xe_oa@mi-rpc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel=
 XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-1/igt@xe_pat@p=
at-index-xe2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148982v8/shard-bmg-2/igt@xe_pat@pat-index-xe2.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">I=
ntel XE#5507</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">I=
ntel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-148982v8/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-ro=
tate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148982v8/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel X=
E#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148982v8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148982v8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-3/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-8/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-6/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-4/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-=
bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shar=
d-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-6/igt@kms_fli=
p@flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-3=
/igt@kms_flip@flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-6/=
igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +2 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-5/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-2/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-8/igt@kms_pla=
ne_scaling@planes-upscale-factor-0-25@pipe-d.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173"=
>Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-factor=
-0-25@pipe-d.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-8/igt@kms_set=
mode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_setmode@basic.h=
tml">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-lnl-3/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-lnl-5/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-434/igt@kms_se=
tmode@basic@pipe-b-hdmi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-463/igt@k=
ms_setmode@basic@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148982v8/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqu=
eues-many-vm-bindexecqueue-userptr-rebind.html">PASS</a> +9 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-8/igt@xe_exec=
_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/i=
gt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-435/igt@xe_exe=
c_threads@threads-hang-rebind-err.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-d=
g2-436/igt@xe_exec_threads@threads-hang-rebind-err.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-433/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-4/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-bmg-6/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148982v8/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-trans=
itions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adl=
p-3/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#295=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173=
">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148982v8/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148982v8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
82v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8982v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5390">Intel XE#5390</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
82v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v=
8/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-8/igt@kms_pm_=
rpm@modeset-non-lpsp.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-1/igt@kms_pm_rpm@modeset-non=
-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-6/igt@kms_psr=
_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/sh=
ard-adlp-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939=
">Intel XE#2939</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5585">Intel XE#5585</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-dg2-436/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-dg2-433/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-3/igt@xe_comp=
ute@ccs-mode-compute-kernel.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-8/igt@xe=
_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5596">Intel XE#5596</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-3/igt@xe_live=
_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-a=
dlp-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE=
#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5488">Intel XE#5488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-9/igt@xe_mmap=
@vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1008">Intel XE#1008</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-148982v8/shard-adlp-4/igt@xe_mmap@vram.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">I=
ntel XE#1008</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5591">Intel XE#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2/shard-adlp-3/igt@xe_pxp@=
pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v8/shard-ad=
lp-6/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4=
733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/55=
94">Intel XE#5594</a>) +13 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2 -&gt; xe-pw-148=
982v8</li>
</ul>
<p>IGT_8468: 8468<br />
  xe-3442-17cc1a17481ab5481b6cd9f01eb073a254b7a3b2: 17cc1a17481ab5481b6cd9f=
01eb073a254b7a3b2<br />
  xe-pw-148982v8: 148982v8</p>

</body>
</html>

--===============4745374992611100112==--
