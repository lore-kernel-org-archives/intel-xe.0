Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BBDC83036
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 10:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6055C10E35C;
	Thu, 29 Aug 2024 10:46:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB5B10E1A4;
 Thu, 29 Aug 2024 10:46:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6277907759952555206=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_series_starting_with_=5Bv2=2C1/?=
 =?utf-8?q?4=5D_drm/xe/pf=3A_Add_function_to_sanitize_VF_resources?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Aug 2024 10:46:55 -0000
Message-ID: <172492841573.831107.12100518018704381640@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828210809.1528-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240828210809.1528-1-michal.wajdeczko@intel.com>
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

--===============6277907759952555206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/4] drm/xe/pf: Add function to sanitize VF resources
URL   : https://patchwork.freedesktop.org/series/137928/
State : success

== Summary ==

CI Bug Log - changes from xe-1851-bea53d59ff161c65513826ca58e2d81284caba63_full -> xe-pw-137928v1_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137928v1_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - {shard-bmg}:        [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-bmg-8/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-bmg-4/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in xe-pw-137928v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#1033])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#1659]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][7] ([Intel XE#1204])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][8] -> [FAIL][9] ([Intel XE#1231]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#2191])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-9/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#787]) +14 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#1195]) +1 other test incomplete
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-hdmi-a-6.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-dg2-set2:     [PASS][18] -> [DMESG-WARN][19] ([Intel XE#877]) +1 other test dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#886]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][23] -> [DMESG-FAIL][24] ([Intel XE#324]) +3 other tests dmesg-fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][25] -> [FAIL][26] ([Intel XE#1874]) +4 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#656]) +10 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [PASS][29] -> [FAIL][30] ([Intel XE#1861]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [FAIL][31] ([Intel XE#1861])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][33] -> [DMESG-FAIL][34] ([Intel XE#324]) +3 other tests dmesg-fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-7/igt@kms_plane@plane-position-covered.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-7/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [PASS][35] -> [DMESG-WARN][36] ([Intel XE#324]) +5 other tests dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][37] -> [FAIL][38] ([Intel XE#616]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][39] ([Intel XE#1874]) +3 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-4/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#836])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-2/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-primary-blt@edp-1:
    - shard-lnl:          [PASS][42] -> [FAIL][43] ([Intel XE#1649]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-8/igt@kms_psr@psr2-primary-blt@edp-1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-8/igt@kms_psr@psr2-primary-blt@edp-1.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#327])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#362])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#756])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1126] / [Intel XE#1201])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_drm_fdinfo@drm-most-busy-idle-check-all:
    - shard-lnl:          [PASS][49] -> [FAIL][50] ([Intel XE#2623])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-2/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-6/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-9/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#261])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-9/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#688])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][56] -> [TIMEOUT][57] ([Intel XE#2105])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][60] -> [ABORT][61] ([Intel XE#1358] / [Intel XE#1607]) +1 other test abort
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][62] ([Intel XE#911]) -> [PASS][63] +3 other tests pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][64] ([Intel XE#1033]) -> [PASS][65] +1 other test pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][66] ([Intel XE#1426]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][68] ([Intel XE#1426]) -> [PASS][69] +1 other test pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][70] ([Intel XE#1426]) -> [PASS][71] +1 other test pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][72] ([Intel XE#1659]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][74] ([Intel XE#1231]) -> [PASS][75] +1 other test pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][76] ([Intel XE#324]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][78] ([Intel XE#1874]) -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_plane@pixel-format@pipe-b-plane-0:
    - {shard-bmg}:        [DMESG-WARN][80] ([Intel XE#877]) -> [PASS][81] +2 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-bmg-2/igt@kms_plane@pixel-format@pipe-b-plane-0.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-bmg-5/igt@kms_plane@pixel-format@pipe-b-plane-0.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
    - shard-lnl:          [DMESG-WARN][82] ([Intel XE#324]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][84] ([Intel XE#718]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_psr@fbc-psr-cursor-plane-move@edp-1:
    - shard-lnl:          [FAIL][86] -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-5/igt@kms_psr@fbc-psr-cursor-plane-move@edp-1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-6/igt@kms_psr@fbc-psr-cursor-plane-move@edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - {shard-bmg}:        [FAIL][88] ([Intel XE#899]) -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_drm_fdinfo@drm-all-busy-idle-check-all:
    - {shard-bmg}:        [FAIL][90] -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-bmg-8/igt@xe_drm_fdinfo@drm-all-busy-idle-check-all.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-bmg-7/igt@xe_drm_fdinfo@drm-all-busy-idle-check-all.html

  * igt@xe_drm_fdinfo@drm-most-busy-idle-check-all:
    - {shard-bmg}:        [FAIL][92] ([Intel XE#2623]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-bmg-1/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-bmg-1/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - {shard-bmg}:        [FAIL][94] ([Intel XE#2364]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-bmg-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][96] ([Intel XE#1473]) -> [PASS][97] +1 other test pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][98] ([Intel XE#1000]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][100] ([Intel XE#1551] / [Intel XE#569]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][102] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-9/igt@xe_pm@s4-basic.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][104] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][106] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][109] ([Intel XE#316]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#316]) -> [SKIP][111] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][112] ([Intel XE#1496]) -> [FAIL][113] ([Intel XE#1231])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][115] ([Intel XE#1124]) +6 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1124]) -> [SKIP][117] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][119] ([Intel XE#607])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][121] ([Intel XE#2191]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#367]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#367]) +4 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][125] ([Intel XE#787]) +55 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][127] ([Intel XE#1252])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1252]) -> [SKIP][129] ([Intel XE#1201] / [Intel XE#1252])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#787]) -> [SKIP][131] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][133] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][137] ([Intel XE#306]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#373]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][141] ([Intel XE#373]) +5 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][143] ([Intel XE#307])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#308]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#308])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][147] ([Intel XE#308])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#323]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#323])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][150] ([i915#3804]) -> [SKIP][151] ([Intel XE#1201] / [i915#3804])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#455]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][154] ([i915#5274]) -> [SKIP][155] ([Intel XE#1201] / [i915#5274])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#651]) -> [SKIP][157] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][159] ([Intel XE#651]) +20 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#653]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][163] ([Intel XE#653]) +19 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][165] ([Intel XE#658])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][167] ([Intel XE#455]) +10 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@kms_panel_fitting@atomic-fastset.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-WARN][168] ([Intel XE#324]) -> [DMESG-FAIL][169] ([Intel XE#324])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-1/igt@kms_plane@plane-position-hole.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-4/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#2318]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#2318]) +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#870]) -> [SKIP][175] ([Intel XE#1201] / [Intel XE#870])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_pm_backlight@fade.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-463/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][177] ([Intel XE#908])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1489]) -> [SKIP][179] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][181] ([Intel XE#1489])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#929]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_psr@psr2-basic.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@kms_psr@psr2-basic.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][185] ([Intel XE#929]) +10 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-434/igt@kms_psr@psr2-dpms.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_psr@psr2-dpms.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#327]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#1127]) -> [SKIP][189] ([Intel XE#1127] / [Intel XE#1201])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][191] ([Intel XE#327])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#1500])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][195] ([Intel XE#2168])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_vrr@lobf.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][197] ([Intel XE#756]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#756]) -> [SKIP][199] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1091]) -> [SKIP][201] ([Intel XE#1091] / [Intel XE#1201])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1123]) -> [SKIP][205] ([Intel XE#1123] / [Intel XE#1201])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][207] ([Intel XE#1123])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][209] ([Intel XE#1126]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][211] ([Intel XE#288]) +15 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#288]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#2360]) -> [SKIP][215] ([Intel XE#1201] / [Intel XE#2360])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#2229]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#2229])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][219] ([Intel XE#560])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-436/igt@xe_media_fill@media-fill.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#512]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#512])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_mmap@small-bar.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#378]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#378])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-435/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [TIMEOUT][224] ([Intel XE#1961] / [Intel XE#2026]) -> [TIMEOUT][225] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-8/igt@xe_module_load@many-reload.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-9/igt@xe_module_load@many-reload.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][227] ([Intel XE#2541]) +5 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-463/igt@xe_oa@create-destroy-userspace-config.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#2541]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1337]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#1337])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][233] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#944]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-463/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][237] ([Intel XE#944]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@xe_query@multigpu-query-topology.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_query@multigpu-query-topology.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1130] / [Intel XE#1201]) -> [DMESG-WARN][239] ([Intel XE#1760])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1496
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2623
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7994 -> IGT_7995
  * Linux: xe-1851-bea53d59ff161c65513826ca58e2d81284caba63 -> xe-pw-137928v1

  IGT_7994: e63b2671fcdb647c3507ea852cbf616e2c13cff4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7995: 7d4588779db2939a057c2b27d773b09a9a5e7f53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1851-bea53d59ff161c65513826ca58e2d81284caba63: bea53d59ff161c65513826ca58e2d81284caba63
  xe-pw-137928v1: 137928v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/index.html

--===============6277907759952555206==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/4] drm/xe/pf: Add function to sanitize VF resources</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137928/">https://patchwork.freedesktop.org/series/137928/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1851-bea53d59ff161c65513826ca58e2d81284caba63_full -&gt; xe-pw-137928v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137928v1_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-bmg-8/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-bmg-4/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137928v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-9/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-4/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-7/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-7/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-4/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-2/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-8/igt@kms_psr@psr2-primary-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-8/igt@kms_psr@psr2-primary-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-most-busy-idle-check-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-2/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-6/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2623">Intel XE#2623</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-9/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-9/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-bmg-2/igt@kms_plane@pixel-format@pipe-b-plane-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-bmg-5/igt@kms_plane@pixel-format@pipe-b-plane-0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-5/igt@kms_psr@fbc-psr-cursor-plane-move@edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-6/igt@kms_psr@fbc-psr-cursor-plane-move@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-all-busy-idle-check-all:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-bmg-8/igt@xe_drm_fdinfo@drm-all-busy-idle-check-all.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-bmg-7/igt@xe_drm_fdinfo@drm-all-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@drm-most-busy-idle-check-all:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-bmg-1/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2623">Intel XE#2623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-bmg-1/igt@xe_drm_fdinfo@drm-most-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-bmg-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@xe_pm@s3-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-2/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1496">Intel XE#1496</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-lnl-1/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-lnl-4/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-463/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-436/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-434/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-435/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-436/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-466/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-435/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-adlp-8/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-adlp-9/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353">Intel XE#1353</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-463/igt@xe_oa@create-destroy-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_oa@create-destroy-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-463/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-466/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1851-bea53d59ff161c65513826ca58e2d81284caba63/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137928v1/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7994 -&gt; IGT_7995</li>
<li>Linux: xe-1851-bea53d59ff161c65513826ca58e2d81284caba63 -&gt; xe-pw-137928v1</li>
</ul>
<p>IGT_7994: e63b2671fcdb647c3507ea852cbf616e2c13cff4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7995: 7d4588779db2939a057c2b27d773b09a9a5e7f53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1851-bea53d59ff161c65513826ca58e2d81284caba63: bea53d59ff161c65513826ca58e2d81284caba63<br />
  xe-pw-137928v1: 137928v1</p>

</body>
</html>

--===============6277907759952555206==--
