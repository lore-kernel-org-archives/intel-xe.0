Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29F2D277D1
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 08:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AD810E1BA;
	Sat, 10 Jan 2026 08:10:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFC510E07D;
 Sat, 10 Jan 2026 08:10:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5901214802768932080=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/cri=3A_vram_addr_ra?=
 =?utf-8?q?nge_is_expanded_to_bit=5B17=3A8=5D?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 10 Jan 2026 08:10:10 -0000
Message-ID: <176803261004.143515.17888990889536463358@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260110053650.2241351-1-fei.yang@intel.com>
In-Reply-To: <20260110053650.2241351-1-fei.yang@intel.com>
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

--===============5901214802768932080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/cri: vram addr range is expanded to bit[17:8]
URL   : https://patchwork.freedesktop.org/series/159905/
State : failure

== Summary ==

CI Bug Log - changes from xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80_FULL -> xe-pw-159905v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159905v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159905v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159905v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  
#### Warnings ####

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [ABORT][3] ([Intel XE#5545]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html

  
Known issues
------------

  Here are the changes found in xe-pw-159905v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +5 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2328]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#367]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +9 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2252]) +8 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2341])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#3304]) +3 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][14] ([Intel XE#1178] / [Intel XE#3304]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#6707]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2320]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2321])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2286]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#4354])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2244])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#301])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2293]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2311]) +22 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#4141]) +11 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2313]) +26 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          NOTRUN -> [ABORT][30] ([Intel XE#6740]) +1 other test abort
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-9/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6911])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2501])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2392])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-9/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1406] / [Intel XE#1489]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1406] / [Intel XE#2414])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2330])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#3414] / [Intel XE#3904])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1435]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6503])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2168])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-9/igt@kms_vrr@cmrr.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4837]) +6 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4837] / [Intel XE#6665]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#5793])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2322]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_multi_queue@two-queues-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#6874]) +22 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-basic-smem.html

  * igt@xe_exec_system_allocator@many-64k-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#5007])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_exec_system_allocator@many-64k-mmap-huge.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4943]) +13 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][50] ([Intel XE#6480])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2229])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2833])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65]) -> ([PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [SKIP][78], [PASS][79]) ([Intel XE#2457])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-10/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-2/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-2/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-9/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-1/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-2/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-1/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-9/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-9/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-3/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-1/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-3/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-10/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-3/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-9/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-9/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-9/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-9/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-3/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#6964]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2284]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#4733]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#944]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_query@multigpu-query-pxp-status.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][84] ([Intel XE#6715]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [ABORT][86] ([Intel XE#5545]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][88] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][90] ([Intel XE#301]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][92] ([Intel XE#6361]) -> [PASS][93] +2 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [FAIL][94] ([Intel XE#5625]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][96] ([Intel XE#3544]) -> [SKIP][97] ([Intel XE#3374] / [Intel XE#3544])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80 -> xe-pw-159905v1

  IGT_8694: 8694
  xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80: 070b98e5f13d7b8c95b1f348629cdef8b7aafa80
  xe-pw-159905v1: 159905v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/index.html

--===============5901214802768932080==
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
<tr><td><b>Series:</b></td><td>drm/xe/cri: vram addr range is expanded to b=
it[17:8]</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/159905/">https://patchwork.freedesktop.org/series/159905/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159905v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159905v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4361-070b98e5f13d7b8c95b1f348629cdef8b=
7aafa80_FULL -&gt; xe-pw-159905v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159905v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-159905v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1599=
05v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms=
_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@2x-flip-vs-expired-vblank:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms=
_flip@2x-flip-vs-expired-vblank.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159905v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2328">Intel XE#2328</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_content_protection@lic-t=
ype-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +3 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_content_protection@suspen=
d-resume@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_content_protection@uevent=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6707">Intel XE#6707</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_dp_link_training@uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-lnl-8/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-lnl-8/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +22 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +26 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-9/igt@kms_hdr@static-toggle-suspend=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_joiner@invalid-modeset-f=
orce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6911">Intel XE#6911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_multipipe_modeset@basic-=
max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-9/igt@kms_pm_dc@dc5-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">I=
ntel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_pm_rpm@dpms-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
9">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_psr@fbc-pr-primary-page-=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@kms_sharpness_filter@invalid=
-filter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-9/igt@kms_vrr@cmrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_eudebug@vm-bind-clear.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpo=
int-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@xe_exec_multi_queue@two-queu=
es-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6874">Intel XE#6874</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_exec_system_allocator@many=
-64k-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_exec_system_allocator@many=
-large-execqueues-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +13 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@xe_exec_system_allocator@man=
y-stride-new-prefetch.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6480">Intel XE#6480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-10/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-=
9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-=
bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa8=
0/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7a=
afa80/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629cdef=
8b7aafa80/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f348629=
cdef8b7aafa80/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c95b1f=
348629cdef8b7aafa80/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7b8c9=
5b1f348629cdef8b7aafa80/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4361-070b98e5f13d7=
b8c95b1f348629cdef8b7aafa80/shard-bmg-10/igt@xe_module_load@load.html">PASS=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
905v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-10/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-159905v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
59905v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
59905v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159905v1/shard-bmg-10/igt@xe_module_load@load.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-=
bmg-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-coherenc=
y-fail-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-exec-post=
-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@xe_query@multigpu-query-pxp-s=
tatus.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-10/igt@kms_cur=
sor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6715">Intel XE#6715</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-3/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">ABORT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shar=
d-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1599=
05v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shar=
d-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-lnl-1/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-lnl-8/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-lnl-1/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE=
#5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-159905v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-id=
x-uc-single-vma.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_hdr@brightness-with-hdr:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80/shard-bmg-9/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-159905v1/shard-bmg-1/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80 -&gt; xe-pw-159=
905v1</li>
</ul>
<p>IGT_8694: 8694<br />
  xe-4361-070b98e5f13d7b8c95b1f348629cdef8b7aafa80: 070b98e5f13d7b8c95b1f34=
8629cdef8b7aafa80<br />
  xe-pw-159905v1: 159905v1</p>

</body>
</html>

--===============5901214802768932080==--
