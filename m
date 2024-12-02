Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBB1D7833E
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 17:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B785910E110;
	Mon,  2 Dec 2024 17:47:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3E310E818;
 Mon,  2 Dec 2024 17:47:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0718845018924341631=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/display=3A_fix_ttm?=
 =?utf-8?q?=5Fbo=5Faccess=28=29_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Dec 2024 17:47:22 -0000
Message-ID: <173316164270.1712299.7636904659424957564@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241202154123.76887-2-matthew.auld@intel.com>
In-Reply-To: <20241202154123.76887-2-matthew.auld@intel.com>
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

--===============0718845018924341631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: fix ttm_bo_access() usage
URL   : https://patchwork.freedesktop.org/series/141996/
State : failure

== Summary ==

CI Bug Log - changes from xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325_full -> xe-pw-141996v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141996v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141996v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141996v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +5 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-3/igt@kms_plane_alpha_blend@alpha-7efc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-3/igt@kms_plane_alpha_blend@alpha-7efc.html

  
Known issues
------------

  Here are the changes found in xe-pw-141996v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][3] ([Intel XE#2705] / [Intel XE#3468])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#3432])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2325])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2252]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2341])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2321])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [PASS][11] -> [DMESG-WARN][12] ([Intel XE#877])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2316]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][15] ([Intel XE#3468]) +12 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][16] -> [DMESG-WARN][17] ([Intel XE#2953] / [Intel XE#3086]) +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-dp2:
    - shard-bmg:          [PASS][18] -> [FAIL][19] ([Intel XE#2882]) +2 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate@a-dp2.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-7/igt@kms_flip@plain-flip-fb-recreate@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-bmg:          [PASS][20] -> [DMESG-FAIL][21] ([Intel XE#3468]) +1 other test dmesg-fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2293]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-bmg:          [PASS][24] -> [DMESG-WARN][25] ([Intel XE#3468]) +8 other tests dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@kms_force_connector_basic@force-connector-state.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2311]) +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#2333])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][28] ([Intel XE#3468])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2313]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][30] ([Intel XE#1727] / [Intel XE#3468])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1489])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#3414])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2905]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [PASS][35] -> [TIMEOUT][36] ([Intel XE#1473] / [Intel XE#2472])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@xe_evict@evict-threads-large.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2322])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][38] ([Intel XE#3467])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-adlp:         [PASS][39] -> [DMESG-WARN][40] ([Intel XE#3086]) +4 other tests dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_intel_bb@intel-bb-blit-x:
    - shard-bmg:          [PASS][41] -> [DMESG-WARN][42] ([Intel XE#1727]) +3 other tests dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-6/igt@xe_intel_bb@intel-bb-blit-x.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@xe_intel_bb@intel-bb-blit-x.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#2229]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2229])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#586])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_mmap@small-bar.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2236])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][47] -> [ABORT][48] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2284])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#944])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_vm@munmap-style-unbind-many-end:
    - shard-adlp:         [PASS][51] -> [DMESG-WARN][52] ([Intel XE#1033] / [Intel XE#1727])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-1/igt@xe_vm@munmap-style-unbind-many-end.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-4/igt@xe_vm@munmap-style-unbind-many-end.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-adlp:         [DMESG-WARN][53] ([Intel XE#3086]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-8/igt@core_hotunplug@hotrebind-lateclose.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-3/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][55] ([Intel XE#1426]) -> [PASS][56] +1 other test pass
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][57] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [DMESG-WARN][59] ([Intel XE#3468] / [Intel XE#877]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][61] ([Intel XE#3321]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][63] ([Intel XE#2882]) -> [PASS][64] +1 other test pass
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [SKIP][65] ([Intel XE#2316]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-FAIL][67] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][68] +2 other tests pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][69] ([Intel XE#3468]) -> [PASS][70] +2 other tests pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-bmg:          [DMESG-WARN][71] ([Intel XE#1727] / [Intel XE#2566]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:
    - shard-bmg:          [DMESG-WARN][73] ([Intel XE#1727]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-bmg:          [DMESG-WARN][75] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [TIMEOUT][77] ([Intel XE#1473]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_balancer@many-parallel-rebind:
    - shard-bmg:          [INCOMPLETE][79] ([Intel XE#2594]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-4/igt@xe_exec_balancer@many-parallel-rebind.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_exec_balancer@many-parallel-rebind.html

  * igt@xe_exec_balancer@once-cm-virtual-userptr:
    - shard-bmg:          [DMESG-WARN][81] -> [PASS][82] +4 other tests pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-7/igt@xe_exec_balancer@once-cm-virtual-userptr.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_exec_balancer@once-cm-virtual-userptr.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0:
    - shard-bmg:          [DMESG-WARN][83] ([Intel XE#3468]) -> [PASS][84] +20 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [DMESG-WARN][85] ([Intel XE#3343]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [DMESG-WARN][87] ([Intel XE#3467]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         [SKIP][89] ([Intel XE#1192]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-4/igt@xe_live_ktest@xe_bo.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-1/igt@xe_live_ktest@xe_bo.html
    - shard-bmg:          [SKIP][91] ([Intel XE#1192]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@xe_live_ktest@xe_bo.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [DMESG-WARN][93] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [DMESG-WARN][95] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@xe_pm@s4-mocs.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@xe_pm@s4-mocs.html

  * igt@xe_vm@large-userptr-binds-134217728:
    - shard-adlp:         [DMESG-WARN][97] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-4/igt@xe_vm@large-userptr-binds-134217728.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-1/igt@xe_vm@large-userptr-binds-134217728.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [DMESG-FAIL][99] ([Intel XE#3468]) -> [DMESG-WARN][100] ([Intel XE#3468]) +2 other tests dmesg-warn
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][101] ([Intel XE#2882]) -> [DMESG-FAIL][102] ([Intel XE#3468])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][103] ([Intel XE#3640]) -> [DMESG-FAIL][104] ([Intel XE#3468])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][105] ([Intel XE#3321]) -> [DMESG-WARN][106] ([Intel XE#3468])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][107] ([Intel XE#3468]) -> [DMESG-FAIL][108] ([Intel XE#3468])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][109] -> [FAIL][110] ([Intel XE#2882])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check@ab-dp2-hdmi-a3.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check@ab-dp2-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][111] ([Intel XE#2312]) -> [SKIP][112] ([Intel XE#2311])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [DMESG-FAIL][113] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][114] ([Intel XE#1861])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         [FAIL][115] ([Intel XE#1861]) -> [DMESG-FAIL][116] ([Intel XE#1033] / [Intel XE#1727])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [DMESG-FAIL][117] ([Intel XE#3468]) -> [INCOMPLETE][118] ([Intel XE#1727])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][119] ([Intel XE#2312]) -> [INCOMPLETE][120] ([Intel XE#2050])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [DMESG-FAIL][121] ([Intel XE#3468]) -> [FAIL][122] ([Intel XE#2333])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [DMESG-FAIL][123] ([Intel XE#3468]) -> [SKIP][124] ([Intel XE#2312])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [FAIL][125] ([Intel XE#2333]) -> [SKIP][126] ([Intel XE#2312]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][127] ([Intel XE#2311]) -> [SKIP][128] ([Intel XE#2312]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][129] ([Intel XE#2312]) -> [SKIP][130] ([Intel XE#2313]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][131] ([Intel XE#2313]) -> [SKIP][132] ([Intel XE#2312]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_plane@pixel-format@pipe-a-plane-3:
    - shard-bmg:          [SKIP][133] -> [DMESG-WARN][134] ([Intel XE#3468])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-3/igt@kms_plane@pixel-format@pipe-a-plane-3.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-3/igt@kms_plane@pixel-format@pipe-a-plane-3.html

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
    - shard-bmg:          [DMESG-FAIL][135] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][136] ([Intel XE#1727] / [Intel XE#3468])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-5/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [INCOMPLETE][137] ([Intel XE#1727]) -> [INCOMPLETE][138] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@kms_vblank@ts-continuation-suspend.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind:
    - shard-bmg:          [DMESG-WARN][139] ([Intel XE#2705]) -> [DMESG-WARN][140] ([Intel XE#3468])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-5/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [DMESG-WARN][141] ([Intel XE#3467]) -> [DMESG-WARN][142] ([Intel XE#3467] / [Intel XE#3468])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [DMESG-WARN][143] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][144] ([Intel XE#3467]) +1 other test dmesg-warn
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-bmg:          [ABORT][145] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468]) -> [ABORT][146] ([Intel XE#1616])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@xe_pm@s2idle-basic-exec.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [DMESG-WARN][147] ([Intel XE#2919]) -> [DMESG-WARN][148] ([Intel XE#2919] / [Intel XE#3086])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-3/igt@xe_wedged@basic-wedged.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-3/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3640]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3640
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325 -> xe-pw-141996v1

  IGT_8132: 7675e070cb74c6808050764367f978f6b74ebc36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325: 4ca0f09b17f7d61413bc13bff715747419c5d325
  xe-pw-141996v1: 141996v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/index.html

--===============0718845018924341631==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: fix ttm_bo_access() usage</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141996/">https://patchwork.freedesktop.org/series/141996/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325_full -&gt; xe-pw-141996v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141996v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141996v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141996v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_alpha_blend@alpha-7efc:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-3/igt@kms_plane_alpha_blend@alpha-7efc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-3/igt@kms_plane_alpha_blend@alpha-7efc.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141996v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-7/igt@kms_flip@plain-flip-fb-recreate@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-6/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@xe_intel_bb@intel-bb-blit-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-1/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-end:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-1/igt@xe_vm@munmap-style-unbind-many-end.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-4/igt@xe_vm@munmap-style-unbind-many-end.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-8/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-3/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-4/igt@xe_exec_balancer@many-parallel-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_exec_balancer@many-parallel-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-7/igt@xe_exec_balancer@once-cm-virtual-userptr.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-2/igt@xe_exec_balancer@once-cm-virtual-userptr.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-4/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-1/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-7/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-134217728:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-4/igt@xe_vm@large-userptr-binds-134217728.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-1/igt@xe_vm@large-userptr-binds-134217728.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3640">Intel XE#3640</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check@ab-dp2-hdmi-a3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-3/igt@kms_plane@pixel-format@pipe-a-plane-3.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-3/igt@kms_plane@pixel-format@pipe-a-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-5/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-5/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-bmg-2/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-bmg-8/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325/shard-adlp-3/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v1/shard-adlp-3/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325 -&gt; xe-pw-141996v1</li>
</ul>
<p>IGT_8132: 7675e070cb74c6808050764367f978f6b74ebc36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2301-4ca0f09b17f7d61413bc13bff715747419c5d325: 4ca0f09b17f7d61413bc13bff715747419c5d325<br />
  xe-pw-141996v1: 141996v1</p>

</body>
</html>

--===============0718845018924341631==--
