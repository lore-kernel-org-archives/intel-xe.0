Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3605C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 17:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B3C112716;
	Mon, 15 Apr 2024 17:01:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80651112716;
 Mon, 15 Apr 2024 17:01:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2056381889733347450=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5BCI-only?=
 =?utf-8?q?=2C1/8=5D_drm=3A_Add_drm=5Fvblank=5Fwork=5Fflush=5Fall=28=29=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 17:01:46 -0000
Message-ID: <171320050650.1404431.13973643117387419472@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412130946.13148-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240412130946.13148-1-maarten.lankhorst@linux.intel.com>
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

--===============2056381889733347450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI-only,1/8] drm: Add drm_vblank_work_flush_all().
URL   : https://patchwork.freedesktop.org/series/132373/
State : failure

== Summary ==

CI Bug Log - changes from xe-1084-85eef611f85be84edeabab83debdbb1fabeba066_full -> xe-pw-132373v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132373v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132373v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132373v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +6 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-dg2-set2:     [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_rotation_crc@multiplane-rotation.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][5] +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-end:
    - shard-adlp:         [PASS][6] -> [DMESG-FAIL][7] +1 other test dmesg-fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-inval-many-end.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-6/igt@xe_vm@munmap-style-unbind-userptr-inval-many-end.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][8] ([Intel XE#1231]) -> [DMESG-FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-adlp:         [FAIL][10] ([Intel XE#616]) -> [DMESG-FAIL][11] +1 other test dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2-set2:     [FAIL][12] ([Intel XE#616]) -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-suspend.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - {shard-lnl}:        [SKIP][14] ([Intel XE#1407]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - {shard-lnl}:        [SKIP][16] ([Intel XE#1124]) -> [SKIP][17] +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - {shard-lnl}:        [SKIP][18] ([Intel XE#1399]) -> [SKIP][19] +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * {igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-edp-1}:
    - {shard-lnl}:        [DMESG-WARN][20] ([Intel XE#1330]) -> [DMESG-WARN][21] +1 other test dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-edp-1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-edp-1.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - {shard-lnl}:        [SKIP][22] ([Intel XE#373]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@lic-type-0:
    - {shard-lnl}:        [SKIP][24] ([Intel XE#1446]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_content_protection@lic-type-0.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - {shard-lnl}:        [SKIP][26] ([Intel XE#1413]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x512.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - {shard-lnl}:        [SKIP][28] ([Intel XE#309]) -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - {shard-lnl}:        [DMESG-WARN][30] ([Intel XE#1595]) -> [DMESG-WARN][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-4/igt@kms_fbcon_fbt@psr-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-plain-flip:
    - {shard-lnl}:        [SKIP][32] ([Intel XE#1421]) -> [SKIP][33] +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_flip@2x-plain-flip.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - {shard-lnl}:        [SKIP][34] ([Intel XE#1401]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - {shard-lnl}:        [SKIP][36] ([Intel XE#656]) -> [SKIP][37] +7 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - {shard-lnl}:        [PASS][38] -> [DMESG-FAIL][39] +86 other tests dmesg-fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - {shard-lnl}:        [SKIP][40] ([Intel XE#651]) -> [SKIP][41] +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - {shard-lnl}:        [DMESG-WARN][42] -> [DMESG-FAIL][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][44] +17 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - {shard-lnl}:        [PASS][45] -> [DMESG-WARN][46] +110 other tests dmesg-warn
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - {shard-lnl}:        [SKIP][47] ([Intel XE#356]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b:
    - {shard-lnl}:        NOTRUN -> [DMESG-FAIL][49] +11 other tests dmesg-fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-edp-1:
    - {shard-lnl}:        [TIMEOUT][50] ([Intel XE#1558]) -> [INCOMPLETE][51] +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-edp-1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:
    - {shard-lnl}:        [PASS][52] -> [FAIL][53] +6 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html

  * igt@xe_evict@evict-small-multi-vm:
    - {shard-lnl}:        [SKIP][54] ([Intel XE#688]) -> [SKIP][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@xe_evict@evict-small-multi-vm.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@xe_evict@evict-small-multi-vm.html

  * {igt@xe_exec_basic@multigpu-once-null-defer-bind}:
    - {shard-lnl}:        [SKIP][56] ([Intel XE#1392]) -> [SKIP][57] +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_basic@once-basic-defer-mmap:
    - {shard-lnl}:        [PASS][58] -> [SKIP][59] +37 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@xe_exec_basic@once-basic-defer-mmap.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@xe_exec_basic@once-basic-defer-mmap.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
    - {shard-lnl}:        [INCOMPLETE][60] ([Intel XE#1617]) -> [ABORT][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-1/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@many-rebind:
    - {shard-lnl}:        [PASS][62] -> [ABORT][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-8/igt@xe_exec_compute_mode@many-rebind.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-1/igt@xe_exec_compute_mode@many-rebind.html

  * igt@xe_exec_threads@threads-userptr-rebind-err:
    - {shard-lnl}:        NOTRUN -> [SKIP][64] +42 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@xe_exec_threads@threads-userptr-rebind-err.html

  * igt@xe_pat@pat-index-xehpc:
    - {shard-lnl}:        [SKIP][65] ([Intel XE#1420]) -> [SKIP][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html

  
Known issues
------------

  Here are the changes found in xe-pw-132373v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         NOTRUN -> [ABORT][67] ([Intel XE#1538])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@core_hotunplug@hotreplug.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#316])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][69] -> [FAIL][70] ([Intel XE#1231])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][71] ([Intel XE#1204]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [PASS][72] -> [FAIL][73] ([Intel XE#1231])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-adlp:         [PASS][74] -> [DMESG-FAIL][75] ([Intel XE#1033])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][76] -> [DMESG-WARN][77] ([Intel XE#1033] / [Intel XE#1214])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#367])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#650]) +3 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][82] -> [FAIL][83] ([Intel XE#616]) +40 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#787]) +85 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][86] -> [DMESG-WARN][87] ([Intel XE#1214]) +5 other tests dmesg-warn
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][92] ([Intel XE#1178]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][94] ([Intel XE#1195] / [Intel XE#927])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][95] ([Intel XE#1195])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg2-set2:     NOTRUN -> [FAIL][96] ([Intel XE#581])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#455] / [i915#3804])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-xtiled:
    - shard-dg2-set2:     NOTRUN -> [FAIL][98] ([Intel XE#616]) +4 other tests fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-xtiled.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][99] -> [DMESG-WARN][100] ([Intel XE#1200] / [Intel XE#1214])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-dpms-vs-vblank-race@bd-hdmi-a6-hdmi-a7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][101] ([Intel XE#1214])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race@bd-hdmi-a6-hdmi-a7.html

  * igt@kms_flip@2x-flip-vs-modeset@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][102] -> [DMESG-WARN][103] ([Intel XE#1033] / [Intel XE#1214]) +217 other tests dmesg-warn
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-436/igt@kms_flip@2x-flip-vs-modeset@cd-hdmi-a6-dp4.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-modeset@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-hdmi-a7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][104] ([Intel XE#1033] / [Intel XE#1214]) +26 other tests dmesg-warn
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-hdmi-a7.html

  * igt@kms_flip@basic-plain-flip@d-hdmi-a2:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][105] ([Intel XE#1214]) +2 other tests dmesg-warn
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_flip@basic-plain-flip@d-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][106] -> [DMESG-FAIL][107] ([Intel XE#1033] / [Intel XE#324]) +25 other tests dmesg-fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][108] ([Intel XE#1033] / [Intel XE#324]) +3 other tests dmesg-fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][109] -> [DMESG-WARN][110] ([Intel XE#1214]) +7 other tests dmesg-warn
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][111] -> [FAIL][112] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [PASS][114] -> [DMESG-FAIL][115] ([Intel XE#324]) +1 other test dmesg-fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][116] -> [DMESG-FAIL][117] ([Intel XE#1033]) +98 other tests dmesg-fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][118] ([Intel XE#1033]) +11 other tests dmesg-fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-adlp:         [PASS][119] -> [INCOMPLETE][120] ([Intel XE#1195]) +2 other tests incomplete
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-adlp:         [PASS][121] -> [FAIL][122] ([Intel XE#616]) +5 other tests fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#656]) +6 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1151] / [Intel XE#1201])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#1201] / [Intel XE#417])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][130] -> [SKIP][131] ([Intel XE#1201] / [Intel XE#455])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][132] ([Intel XE#361])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][133] -> [FAIL][134] ([Intel XE#361]) +1 other test fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-dg2-set2:     [PASS][135] -> [DMESG-WARN][136] ([Intel XE#1214] / [Intel XE#324]) +18 other tests dmesg-warn
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][137] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][138] ([Intel XE#904] / [Intel XE#909])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#1201]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][140] -> [DMESG-WARN][141] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) +5 other tests dmesg-warn
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-463/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a-hdmi-a-6.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-466/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#1201] / [Intel XE#870])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2-set2:     [PASS][145] -> [SKIP][146] ([Intel XE#1201] / [Intel XE#1211])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-436/igt@kms_pm_rpm@cursor.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-434/igt@kms_pm_rpm@cursor.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#1201])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_psr@psr-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][151] ([Intel XE#1174])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_sysfs_edid_timing.html
    - shard-dg2-set2:     [PASS][152] -> [FAIL][153] ([Intel XE#1174])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@kms_sysfs_edid_timing.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][154] -> [FAIL][155] ([Intel XE#899])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][156] ([Intel XE#899]) +1 other test fail
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#1201] / [Intel XE#756])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#1201] / [Intel XE#756])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#1201] / [Intel XE#1447])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][161] -> [FAIL][162] ([Intel XE#1259])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][163] -> [TIMEOUT][164] ([Intel XE#1473] / [Intel XE#931])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - shard-dg2-set2:     [PASS][165] -> [INCOMPLETE][166] ([Intel XE#1033] / [Intel XE#1195] / [Intel XE#1473])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-small.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-small.html

  * igt@xe_evict@evict-beng-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#1201] / [Intel XE#261])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@xe_evict@evict-beng-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][168] -> [TIMEOUT][169] ([Intel XE#1473])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][171] ([Intel XE#1619])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-rebind:
    - shard-adlp:         [PASS][174] -> [FAIL][175] ([Intel XE#1069]) +1 other test fail
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-6/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html

  * igt@xe_pm@d3-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [FAIL][176] ([Intel XE#1221])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@xe_pm@d3-mmap-system.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#1201] / [Intel XE#944])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
#### Possible fixes ####

  * igt@kms_async_flips@crc:
    - shard-adlp:         [DMESG-FAIL][178] ([Intel XE#1033] / [Intel XE#358]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-1/igt@kms_async_flips@crc.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-8/igt@kms_async_flips@crc.html

  * igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1:
    - {shard-lnl}:        [DMESG-WARN][180] ([Intel XE#324]) -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-4/igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-2/igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][182] ([Intel XE#1231]) -> [PASS][183] +2 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [FAIL][184] ([Intel XE#616]) -> [PASS][185] +5 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][186] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][187] +26 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [DMESG-WARN][188] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_cursor_legacy@single-move.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@kms_cursor_legacy@single-move.html

  * igt@kms_cursor_legacy@single-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][190] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][192] ([Intel XE#616]) -> [PASS][193] +22 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1:
    - {shard-lnl}:        [DMESG-WARN][194] ([Intel XE#1330]) -> [PASS][195] +5 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-5/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - {shard-lnl}:        [INCOMPLETE][196] -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-5/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-2/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - {shard-lnl}:        [INCOMPLETE][198] ([Intel XE#1616]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-dg2-set2:     [FAIL][200] ([Intel XE#1204]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@kms_pm_dc@dc9-dpms.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - {shard-lnl}:        [FAIL][204] -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][206] ([Intel XE#899]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [INCOMPLETE][208] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][210] ([Intel XE#1473] / [Intel XE#821]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_threads@threads-fd-basic:
    - shard-dg2-set2:     [TIMEOUT][212] ([Intel XE#1261] / [Intel XE#1356]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@xe_exec_threads@threads-fd-basic.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@xe_exec_threads@threads-fd-basic.html

  * igt@xe_exec_threads@threads-hang-basic:
    - {shard-lnl}:        [FAIL][214] ([Intel XE#1256]) -> [PASS][215] +1 other test pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-8/igt@xe_exec_threads@threads-hang-basic.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-5/igt@xe_exec_threads@threads-hang-basic.html

  * igt@xe_exec_threads@threads-hang-fd-userptr:
    - shard-dg2-set2:     [INCOMPLETE][216] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [FAIL][218] ([Intel XE#1256]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_gt_freq@freq_low_max:
    - shard-dg2-set2:     [FAIL][220] ([Intel XE#1045] / [Intel XE#1204]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@xe_gt_freq@freq_low_max.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-dg2-set2:     [FAIL][222] ([Intel XE#355]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@xe_pm@d3hot-basic-exec.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
    - {shard-lnl}:        [FAIL][224] ([Intel XE#1440]) -> [PASS][225] +1 other test pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-5/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-5/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html

  
#### Warnings ####

  * igt@kms_async_flips@test-cursor:
    - shard-dg2-set2:     [DMESG-WARN][226] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][227] ([Intel XE#1033] / [Intel XE#1214]) +11 other tests dmesg-warn
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@kms_async_flips@test-cursor.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         [FAIL][228] ([Intel XE#616]) -> [INCOMPLETE][229] ([Intel XE#1195])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][230] ([Intel XE#650]) -> [DMESG-FAIL][231] ([Intel XE#1033]) +10 other tests dmesg-fail
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][232] ([Intel XE#616]) -> [DMESG-WARN][233] ([Intel XE#1214]) +2 other tests dmesg-warn
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1201] / [Intel XE#455]) -> [DMESG-FAIL][235] ([Intel XE#1033])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@kms_content_protection@atomic.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][236] ([Intel XE#1188]) -> [DMESG-FAIL][237] ([Intel XE#1033]) +1 other test dmesg-fail
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@kms_content_protection@uevent.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-FAIL][238] ([Intel XE#1162]) -> [DMESG-FAIL][239] ([Intel XE#1033]) +1 other test dmesg-fail
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][240] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][241] ([Intel XE#1033] / [Intel XE#1214])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][242] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][243] ([Intel XE#1195] / [Intel XE#927])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@basic-plain-flip:
    - shard-adlp:         [INCOMPLETE][244] ([Intel XE#1150] / [Intel XE#1195] / [Intel XE#1330]) -> [DMESG-WARN][245] ([Intel XE#1088] / [Intel XE#1214] / [Intel XE#1330])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-9/igt@kms_flip@basic-plain-flip.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_flip@basic-plain-flip.html

  * igt@kms_flip@basic-plain-flip@a-hdmi-a2:
    - shard-adlp:         [INCOMPLETE][246] ([Intel XE#1195] / [Intel XE#1330]) -> [DMESG-WARN][247] ([Intel XE#1088] / [Intel XE#1214] / [Intel XE#1330])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-9/igt@kms_flip@basic-plain-flip@a-hdmi-a2.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_flip@basic-plain-flip@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][248] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][249] ([Intel XE#1195] / [Intel XE#927])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][250] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][251] ([Intel XE#1195])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][252] ([Intel XE#324] / [Intel XE#358]) -> [FAIL][253] ([Intel XE#422] / [Intel XE#616]) +3 other tests fail
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][254] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-FAIL][255] ([Intel XE#1033] / [Intel XE#1191])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][256] ([Intel XE#1214]) -> [DMESG-WARN][257] ([Intel XE#1033] / [Intel XE#1214]) +2 other tests dmesg-warn
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [FAIL][258] ([Intel XE#616]) -> [DMESG-FAIL][259] ([Intel XE#1033]) +2 other tests dmesg-fail
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-dg2-set2:     [DMESG-FAIL][260] ([Intel XE#324]) -> [DMESG-WARN][261] ([Intel XE#1033] / [Intel XE#1214]) +1 other test dmesg-warn
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@kms_plane_lowres@tiling-x.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-466/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][262] ([Intel XE#1214] / [Intel XE#324]) -> [DMESG-WARN][263] ([Intel XE#1033] / [Intel XE#1214]) +3 other tests dmesg-warn
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-6.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-466/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][264] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][265] ([Intel XE#1148] / [Intel XE#1204])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][266] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][267] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][268] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][269] ([Intel XE#1214] / [Intel XE#1608])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][270] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][271] ([Intel XE#1034] / [Intel XE#1195] / [Intel XE#927])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][272] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][273] ([Intel XE#1034] / [Intel XE#1195])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][274] ([Intel XE#1259] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][275] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [DMESG-FAIL][276] ([Intel XE#821]) -> [FAIL][277] ([Intel XE#1041])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][278] ([Intel XE#1473] / [Intel XE#392]) -> [DMESG-WARN][279] ([Intel XE#1033] / [Intel XE#1214])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-dg2-set2:     [FAIL][280] ([Intel XE#1068]) -> [DMESG-FAIL][281] ([Intel XE#1033])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@xe_exec_reset@cm-gt-reset.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_threads@threads-hang-fd-rebind:
    - shard-dg2-set2:     [INCOMPLETE][282] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376]) -> [INCOMPLETE][283] ([Intel XE#1033] / [Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-rebind.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-rebind.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [DMESG-WARN][284] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][285] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-2/igt@xe_pm@s2idle-multiple-execs.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-9/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][286] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][287] ([Intel XE#1033] / [Intel XE#1162] / [Intel XE#1214]) +2 other tests dmesg-warn
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         [INCOMPLETE][288] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][289] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-9/igt@xe_pm@s3-multiple-execs.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [DMESG-FAIL][290] ([Intel XE#1162] / [Intel XE#1551]) -> [DMESG-FAIL][291] ([Intel XE#1033] / [Intel XE#1162] / [Intel XE#1551])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@xe_pm@s4-basic.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [FAIL][292] ([Intel XE#1043] / [Intel XE#845]) -> [DMESG-FAIL][293] ([Intel XE#1033] / [Intel XE#1162])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@xe_pm@s4-basic-exec.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [FAIL][294] ([Intel XE#1043] / [Intel XE#845]) -> [DMESG-FAIL][295] ([Intel XE#1033])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1148]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1148
  [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1200]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1200
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440
  [Intel XE#1444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1444
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
  [Intel XE#1495]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1495
  [Intel XE#1537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1617]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1617
  [Intel XE#1619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/931
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804


Build changes
-------------

  * Linux: xe-1084-85eef611f85be84edeabab83debdbb1fabeba066 -> xe-pw-132373v1

  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1084-85eef611f85be84edeabab83debdbb1fabeba066: 85eef611f85be84edeabab83debdbb1fabeba066
  xe-pw-132373v1: 132373v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/index.html

--===============2056381889733347450==
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
<tr><td><b>Series:</b></td><td>series starting with [CI-only,1/8] drm: Add =
drm_vblank_work_flush_all().</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/132373/">https://patchwork.freedesktop.org/series/132373/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-132373v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-132373v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1084-85eef611f85be84edeabab83debdbb1fa=
beba066_full -&gt; xe-pw-132373v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132373v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-132373v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1323=
73v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">FAIL</=
a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_ro=
tation_crc@multiplane-rotation.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@kms_rotation=
_crc@multiplane-rotation.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_universal_plane@cursor-f=
b-leak@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-end:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@xe_vm@m=
unmap-style-unbind-userptr-inval-many-end.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-6/igt@xe=
_vm@munmap-style-unbind-userptr-inval-many-end.html">DMESG-FAIL</a> +1 othe=
r test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel=
 XE#1231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-132373v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate=
-180-hflip-async-flip.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_big=
_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-6/igt@kms=
_big_fb@y-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> +1 other test dmesg-f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-suspend.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@=
kms_frontbuffer_tracking@fbc-suspend.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_big_=
fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_=
big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@km=
s_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_ccs@=
crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-=
7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-edp-1}:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-edp-1.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel =
XE#1330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-132373v1/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs=
@pipe-c-edp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_cham=
elium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/=
igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1446">Intel XE#1446</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_curs=
or_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@km=
s_cursor_crc@cursor-random-512x512.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/ig=
t@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-4/igt@kms_fbco=
n_fbt@psr-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1595">Intel XE#1595</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_fbc=
on_fbt@psr-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_flip=
@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@kms_flip@2x-plai=
n-flip.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">I=
ntel XE#1401</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-132373v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13237=
3v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-dra=
w-blt.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-1/igt@k=
ms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">DMESG-FAIL</a> +86=
 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373=
v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-m=
ove.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">DMESG-WARN=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13237=
3v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-d=
raw-mmap-wc.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-=
1p-pri-indfb-multidraw.html">DMESG-WARN</a> +17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-2=
/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html">DMESG-=
WARN</a> +110 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_mult=
ipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-=
7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-lnl-2/igt@kms_plane@pixel-format-source=
-clamping@pipe-b.html">DMESG-FAIL</a> +11 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-=
a-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-2/igt@kms_plan=
e_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-edp-1.html">T=
IMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1558">Intel XE#1558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-132373v1/shard-lnl-8/igt@kms_plane_scaling@plane-scaler-unit=
y-scaling-with-pixel-format@pipe-a-edp-1.html">INCOMPLETE</a> +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-4/igt@kms_psr@=
fbc-psr2-cursor-plane-move@edp-1.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-2/igt@kms_psr@fbc-=
psr2-cursor-plane-move@edp-1.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@xe_evict=
@evict-small-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@xe_evict@ev=
ict-small-multi-vm.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@multigpu-once-null-defer-bind}:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@xe_exec_=
basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7=
/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@xe_exec_=
basic@once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@xe_exec_basic@onc=
e-basic-defer-mmap.html">SKIP</a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-3/igt@xe_exec_=
compute_mode@many-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1617">Intel XE#1617</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/s=
hard-lnl-1/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">ABORT<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-rebind:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-8/igt@xe_exec_=
compute_mode@many-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-1/igt@xe_exec_compute_mode=
@many-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr-rebind-err:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@xe_exec_threads@threads-userp=
tr-rebind-err.html">SKIP</a> +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@xe_pat@p=
at-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-7/igt@xe_pat@pat-index=
-xehpc.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132373v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@core_hotunplug@hotreplug.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1538">Intel XE#1538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adl=
p-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231=
">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/=
shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-a=
sync-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_big=
_fb@y-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-1/igt@kms_big_fb@y-tile=
d-32bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/s=
hard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_bw@linear-tiling-3-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-t=
iled-dg2-mc-ccs@pipe-a-hdmi-a-7.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +3 other tests f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@kms_cc=
s@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/sha=
rd-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-=
a-6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/616">Intel XE#616</a>) +40 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
">Intel XE#787</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-43=
4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214=
">Intel XE#1214</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_chamelium_edid@hdmi-edid=
-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_chamelium_frames@hdmi-c=
mp-planes-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_cursor_crc@cursor-onscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspen=
d.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspen=
d@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_cursor_edge_walk@256x25=
6-top-bottom.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-xtiled:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_draw_crc@draw-method-mm=
ap-wc@xrgb2101010-xtiled.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@kms_fl=
ip@2x-dpms-vs-vblank-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_flip@2x-dpms-=
vs-vblank-race.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1200">Intel XE#1200</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@bd-hdmi-a6-hdmi-a7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-=
race@bd-hdmi-a6-hdmi-a7.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-modeset@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-modeset@cd-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE=
#1214</a>) +217 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-hdmi-a6-hdmi-a7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning=
-interruptible@cd-hdmi-a6-hdmi-a7.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#12=
14</a>) +26 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-hdmi-a2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_flip@basic-plain-flip@d-=
hdmi-a2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/sha=
rd-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscal=
ing.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +25 other tests dmesg-fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32=
bpp-4tile-to-64bpp-4tile-upscaling.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#32=
4</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-132373v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64b=
pp-linear-upscaling@pipe-a-valid-mode.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +7=
 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-1/igt@kms_fli=
p_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-132373v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bp=
p-ytile-downscaling@pipe-a-valid-mode.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</=
a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_fl=
ip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-132373v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bp=
p-xtile-upscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 oth=
er test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-d=
g2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1033">Intel XE#1033</a>) +98 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
c-1p-primscrn-pri-shrfb-draw-render.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +11 =
other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-6=
/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195=
">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbc-1p-rte.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_frontbuffer=
_tracking@fbc-1p-rte.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/616">Intel XE#616</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651<=
/a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)=
 +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
drrs-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1151">Intel XE#1151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_hdmi_inject@inject-audio=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-466/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@kms_pl=
ane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-466/=
igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#=
361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-436/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-5-with-modifiers.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-d=
g2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/324">Intel XE#324</a>) +18 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">In=
tel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#90=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/909"=
>Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_plane_scaling@plane-sca=
ler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-463/igt@kms_pl=
ane_scaling@plane-upscale-20x20-with-modifiers@pipe-a-hdmi-a-6.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v=
1/shard-dg2-466/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pi=
pe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) =
+5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-=
hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">=
Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_pm_backlight@fade-with-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-436/igt@kms_pm=
_rpm@cursor.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-132373v1/shard-dg2-434/igt@kms_pm_rpm@cursor.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Int=
el XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_psr2_sf@overlay-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_psr@fbc-psr2-primary-ren=
der.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_psr@psr-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_sysfs_edid_timing.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
74">Intel XE#1174</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@kms_sy=
sfs_edid_timing.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_sysfs_edid_timing.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_un=
iversal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/=
igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#89=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@kms_universal_plane@cursor-f=
b-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@kms_vrr@flip-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_writeback@writeback-che=
ck-output.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@kms_writeback@writeback-inva=
lid-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@xe_compute@ccs-mode-compute-=
kernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@xe_evi=
ct@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@xe_evict@evi=
ct-beng-cm-threads-large.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-463/igt@xe_evi=
ct@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-466/igt@xe_evict@=
evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/931">Intel XE#931</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@xe_evi=
ct@evict-beng-mixed-threads-small.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@xe_evict@=
evict-beng-mixed-threads-small.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"=
>Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@xe_evict@evict-beng-threads-=
small-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-463/igt@xe_evi=
ct@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-466/igt@xe_evict@=
evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@xe_evict@evict-small-multi-v=
m-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@xe_exec_basic@many-execqueue=
s-many-vm-userptr-invalidate.html">DMESG-FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@xe_exec_fault_mode@many-exe=
cqueues-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-adlp-2/igt@xe_exec_fault_mode@twice-use=
rptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-6/igt@xe_exec=
_threads@threads-cm-fd-userptr-rebind.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-4/igt@xe_exe=
c_threads@threads-cm-fd-userptr-rebind.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/igt@xe_pm@d3-mmap-system.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
21">Intel XE#1221</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@xe_query@multigpu-query-inv=
alid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-1/igt@kms_asy=
nc_flips@crc.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-8/i=
gt@kms_async_flips@crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-4/igt@kms_atom=
ic_interruptible@legacy-cursor@pipe-a-edp-1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373=
v1/shard-lnl-2/igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel X=
E#1231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-132373v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0=
-hflip-async-flip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel =
XE#616</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-132373v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc=
-ccs-cc@pipe-c-dp-4.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@kms_cu=
rsor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373=
v1/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a> +=
26 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_cu=
rsor_legacy@single-move.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#8=
77</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
2373v1/shard-dg2-435/igt@kms_cursor_legacy@single-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_cu=
rsor_legacy@single-move@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373=
v1/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373=
v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to=
-y.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_hdr@=
bpc-switch-suspend@pipe-a-edp-1.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl=
-5/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html">PASS</a> +5 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-5/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-2/igt@km=
s_plane@plane-panning-bottom-right-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-5/igt@kms_plan=
e@plane-panning-bottom-right-suspend@pipe-b.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1323=
73v1/shard-lnl-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@kms_pm=
_dc@dc9-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@kms_pm_dc@dc9-dp=
ms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_pm=
_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/=
igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-1/igt@kms_psr@=
fbc-psr2-cursor-render@edp-1.html">FAIL</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-3/igt@kms_psr@fbc-psr2=
-cursor-render@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_un=
iversal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg=
2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-463/igt@xe_evi=
ct@evict-beng-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel=
 XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-132373v1/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large-multi-v=
m.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@xe_evi=
ct@evict-beng-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shar=
d-dg2-463/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@xe_exe=
c_threads@threads-fd-basic.html">TIMEOUT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/sha=
rd-dg2-435/igt@xe_exec_threads@threads-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-basic:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-8/igt@xe_exec_=
threads@threads-hang-basic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-lnl-5/igt@xe_e=
xec_threads@threads-hang-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@xe_exe=
c_threads@threads-hang-fd-userptr.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#11=
95</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/135=
6">Intel XE#1356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1376">Intel XE#1376</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@xe_exec_threads@thread=
s-hang-fd-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@xe_exe=
c_threads@threads-hang-fd-userptr-rebind.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-=
dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@xe_gt_=
freq@freq_low_max.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1045">Intel XE#1045</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/=
igt@xe_gt_freq@freq_low_max.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@xe_pm@=
d3hot-basic-exec.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/355">Intel XE#355</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/igt@xe_pm@d3hot-ba=
sic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-lnl-5/igt@xe_vm@mu=
nmap-style-unbind-many-either-side-partial-hammer.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1440">Intel XE#1440=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1323=
73v1/shard-lnl-5/igt@xe_vm@munmap-style-unbind-many-either-side-partial-ham=
mer.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@kms_as=
ync_flips@test-cursor.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-d=
g2-463/igt@kms_async_flips@test-cursor.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel =
XE#1214</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_big=
_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-1/igt@kms=
_big_fb@x-tiled-64bpp-rotate-180.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Inte=
l XE#650</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-132373v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2=
-mc-ccs@pipe-a-hdmi-a-6.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +10 other tests =
dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">In=
tel XE#616</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-132373v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg=
2-rc-ccs-cc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tes=
ts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@kms_co=
ntent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-4=
63/igt@kms_content_protection@atomic.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-466/igt@kms_co=
ntent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@kms_c=
ontent_protection@uevent.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test d=
mesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/s=
hard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
33">Intel XE#1033</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@kms_cu=
rsor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">=
Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/282">Intel XE#282</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@kms_cursor_lega=
cy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#=
1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-2/igt@kms_fbc=
on_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-ad=
lp-9/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#92=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-9/igt@kms_fli=
p@basic-plain-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1150">Intel XE#1150</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#133=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132=
373v1/shard-adlp-2/igt@kms_flip@basic-plain-flip.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1=
088</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
14">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a2:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-9/igt@kms_fli=
p@basic-plain-flip@a-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v=
1/shard-adlp-2/igt@kms_flip@basic-plain-flip@a-hdmi-a2.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Inte=
l XE#1088</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608"=
>Intel XE#1608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-132373v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Int=
el XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1608">Intel XE#1608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-132373v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-inte=
rruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-8/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Int=
el XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/358">Intel XE#358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-132373v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-16bpp-xtile-downscaling.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 o=
ther tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1323=
73v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">=
Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1191">Intel XE#1191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-463/igt@kms_pi=
pe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-4=
63/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">In=
tel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-463/igt@kms_pl=
ane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/sha=
rd-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1033">Intel XE#1033</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@kms_pl=
ane_lowres@tiling-x.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-466/igt@kms_p=
lane_lowres@tiling-x.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 ot=
her test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@kms_pl=
ane_lowres@tiling-x@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#3=
24</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
2373v1/shard-dg2-466/igt@kms_plane_lowres@tiling-x@pipe-a-hdmi-a-6.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_pm_=
dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-adlp-8/igt@kms_pm=
_dc@dc9-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1148">Intel XE#1148</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_vbl=
ank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#121=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132=
373v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
91">Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1214">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-4/igt@kms_vbl=
ank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1=
191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
14">Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-132373v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-susp=
end@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-6/igt@kms_vbl=
ank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Int=
el XE#1608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-132373v1/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1034">Intel XE#1034</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1195">Intel XE#1195</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-6/igt@kms_vbl=
ank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"=
>Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-132373v1/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend@pipe=
-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@xe_evi=
ct@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#=
1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
92">Intel XE#392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-132373v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threa=
ds-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1041">Intel XE#1041</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@xe_evi=
ct@evict-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435/=
igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@xe_evi=
ct@evict-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/sha=
rd-dg2-436/igt@xe_evict@evict-mixed-threads-large.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#=
1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@xe_exe=
c_reset@cm-gt-reset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1068">Intel XE#1068</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@xe_exec_r=
eset@cm-gt-reset.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@xe_exe=
c_threads@threads-hang-fd-rebind.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#119=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356=
">Intel XE#1356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1376">Intel XE#1376</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@xe_exec_threads@threads=
-hang-fd-rebind.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356"=
>Intel XE#1356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1376">Intel XE#1376</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-2/igt@xe_pm@s=
2idle-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1=
608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
32373v1/shard-adlp-9/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel =
XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-435/igt@xe_pm@=
s3-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-435=
/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel =
XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-adlp-9/igt@xe_pm@s=
3-multiple-execs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1323=
73v1/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"=
>Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-464/igt@xe_pm@=
s4-basic.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-463/igt@=
xe_pm@s4-basic.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@xe_pm@=
s4-basic-exec.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1043">Intel XE#1043</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-464/igt@xe_=
pm@s4-basic-exec.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1084-85eef611f85be84edeabab83debdbb1fabeba066/shard-dg2-434/igt@xe_pm@=
s4-d3hot-basic-exec.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132373v1/shard-dg2-436/=
igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1084-85eef611f85be84edeabab83debdbb1fabeba066 -&gt; xe-pw-132=
373v1</li>
</ul>
<p>IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-1084-85eef611f85be84edeabab83debdbb1fabeba066: 85eef611f85be84edeabab8=
3debdbb1fabeba066<br />
  xe-pw-132373v1: 132373v1</p>

</body>
</html>

--===============2056381889733347450==--
