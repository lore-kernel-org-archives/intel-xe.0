Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B702BC79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 15:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F63110E1D5;
	Fri,  4 Sep 2026 15:21:59 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5BE10E1D5;
 Fri,  4 Sep 2026 15:21:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4810667558439614782=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_CPU_binds_and_ULLS_on_migr?=
 =?utf-8?q?ation_queue_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Sep 2026 15:21:57 -0000
Message-ID: <178853531776.124366.6128429103591621161@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260904022207.3490018-1-matthew.brost@intel.com>
In-Reply-To: <20260904022207.3490018-1-matthew.brost@intel.com>
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

--===============4810667558439614782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CPU binds and ULLS on migration queue (rev7)
URL   : https://patchwork.freedesktop.org/series/149888/
State : failure

== Summary ==

CI Bug Log - changes from xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623_FULL -> xe-pw-149888v7_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149888v7_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149888v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149888v7_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_vm@bind-array-enobufs:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-3/igt@xe_vm@bind-array-enobufs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@xe_vm@bind-array-enobufs.html
    - shard-bmg:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-3/igt@xe_vm@bind-array-enobufs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-2/igt@xe_vm@bind-array-enobufs.html

  
New tests
---------

  New tests have been introduced between xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623_FULL and xe-pw-149888v7_FULL:

### New IGT tests (17) ###

  * igt@kms_flip@basic-flip-vs-modeset@d-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp2:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [2.78] s

  * igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [2.78] s

  * igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [2.87] s

  * igt@xe_drm_fdinfo@basic-mem:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_drm_fdinfo@basic-utilization:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_drm_fdinfo@mem-active:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_drm_fdinfo@mem-shared:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_drm_fdinfo@mem-total-resident:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_drm_fdinfo@utilization-all-full-load:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - Statuses : 2 pass(s)
    - Exec time: [5.20, 7.18] s

  * igt@xe_drm_fdinfo@utilization-others-idle:
    - Statuses : 2 pass(s)
    - Exec time: [5.15, 7.12] s

  * igt@xe_drm_fdinfo@utilization-single-full-load:
    - Statuses : 2 pass(s)
    - Exec time: [5.11, 7.12] s

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - Statuses : 2 pass(s)
    - Exec time: [5.12, 7.12] s

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_drm_fdinfo@utilization-single-idle:
    - Statuses : 2 pass(s)
    - Exec time: [5.10, 7.10] s

  

Known issues
------------

  Here are the changes found in xe-pw-149888v7_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          [PASS][5] -> [ABORT][6] ([Intel XE#8007])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-8/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@pan:
    - shard-lnl:          [PASS][7] -> [SKIP][8] ([Intel XE#2134])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@fbdev@pan.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@fbdev@pan.html

  * igt@fbdev@read:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#2134])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@fbdev@read.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#3157])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#3658] / [Intel XE#7360])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1407]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#7059] / [Intel XE#7085])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#9125]) +32 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7679])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#367])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#3432])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +7 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2252])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#306] / [Intel XE#7358])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7358])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#373]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2252])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#307] / [Intel XE#6974])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][30] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2320])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2321] / [Intel XE#7355])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1424]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-lnl:          [PASS][34] -> [SKIP][35] ([Intel XE#9125]) +25 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][37] -> [FAIL][38] ([Intel XE#7809])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#8265]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#4422] / [Intel XE#7442]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1138] / [Intel XE#7344])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1421]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#2482]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_flip@busy-flip:
    - shard-lnl:          [PASS][44] -> [SKIP][45] ([Intel XE#2482]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_flip@busy-flip.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_flip@busy-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7178] / [Intel XE#7349])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1745] / [Intel XE#9144])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#7178] / [Intel XE#7351])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2311]) +9 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#6312]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4141]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-lnl:          [PASS][54] -> [SKIP][55] ([Intel XE#2548] / [Intel XE#7779]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1469] / [Intel XE#7399])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#6312] / [Intel XE#651]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7061]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2313]) +9 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#7865]) +10 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#7061])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#7905]) +23 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#2548] / [Intel XE#7779]) +19 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#656] / [Intel XE#7905]) +14 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#7779]) +23 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#6911] / [Intel XE#7466])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#6900] / [Intel XE#7362])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7283]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7250] / [Intel XE#9128])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-lnl:          [PASS][72] -> [SKIP][73] ([Intel XE#9128])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#599] / [Intel XE#7382]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-lnl:          [PASS][75] -> [SKIP][76] ([Intel XE#3307] / [Intel XE#7687] / [Intel XE#9125])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_plane_scaling@invalid-num-scalers.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-lnl:          [PASS][78] -> [SKIP][79] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-lnl:          [PASS][80] -> [SKIP][81] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-lnl:          [PASS][83] -> [SKIP][84] ([Intel XE#7760])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_pm_backlight@brightness-with-dpms.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#7794])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][86] -> [SKIP][87] ([Intel XE#7794])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [PASS][88] -> [INCOMPLETE][89] ([Intel XE#6819])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][90] -> [SKIP][91] ([Intel XE#4886])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#9126])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#2893] / [Intel XE#7304])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1489])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#4608]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#4608] / [Intel XE#7304]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#1489])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1122] / [Intel XE#7429])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2234] / [Intel XE#2850])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1406]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-no-drrs:
    - shard-lnl:          [PASS][104] -> [SKIP][105] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_psr@psr-no-drrs.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr@psr-no-drrs.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#6503])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#8866])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_ccs@vm-bind-decompress:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#7644])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@xe_ccs@vm-bind-decompress.html

  * igt@xe_compute@eu-busy-10s:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#6592] / [Intel XE#6645] / [Intel XE#7391])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_compute@eu-busy-10s.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#6540] / [Intel XE#688]) +8 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][112] -> [INCOMPLETE][113] ([Intel XE#6321] / [Intel XE#8355])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#7482]) +14 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2322] / [Intel XE#7372])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1392]) +5 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#8374]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#8374]) +8 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#8364]) +22 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#8364]) +9 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#8369])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_reset@multi-queue-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#8369])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_exec_reset@multi-queue-close-fd.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#6196])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#8378]) +7 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#8378]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#2229])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_madvise@atomic-global:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#7980])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@xe_madvise@atomic-global.html

  * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#6964]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#6964])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#7793]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_page_reclaim@prl-invalidate-full:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#7793])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_page_reclaim@prl-invalidate-full.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#7590] / [Intel XE#977])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#7590] / [Intel XE#979])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#7599])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-5/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-topology:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#944]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#4130] / [Intel XE#7366]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#8339])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_sriov_vram@vf-access-provisioned.html

  * igt@xe_vm@overcommit-fault-vram-lr:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#7892])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_vm@overcommit-fault-vram-lr.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][143] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_color@deep-color:
    - shard-lnl:          [SKIP][145] ([Intel XE#1511] / [Intel XE#3297]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_color@deep-color.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_color@deep-color.html

  * igt@kms_color@legacy-gamma-reset:
    - shard-lnl:          [SKIP][147] ([Intel XE#3297]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_color@legacy-gamma-reset.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_color@legacy-gamma-reset.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d:
    - shard-lnl:          [SKIP][149] ([Intel XE#7006]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-lut1d.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-lnl:          [SKIP][151] -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_fb_coherency@memset-crc.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-lnl:          [SKIP][153] ([Intel XE#2482]) -> [PASS][154] +2 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip@basic-flip-vs-modeset.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-lnl:          [SKIP][155] ([Intel XE#9132]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on-nop.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          [SKIP][157] ([Intel XE#1745] / [Intel XE#9144]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          [SKIP][159] ([Intel XE#7779]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][161] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][162] +12 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][163] ([Intel XE#1503]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_lease@lease-unleased-crtc:
    - shard-lnl:          [SKIP][165] ([Intel XE#9125]) -> [PASS][166] +35 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_lease@lease-unleased-crtc.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_lease@lease-unleased-crtc.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-lnl:          [SKIP][167] ([Intel XE#7780] / [Intel XE#9125]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane@planar-pixel-format-settings.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-lnl:          [SKIP][169] ([Intel XE#9128]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane@plane-panning-top-left.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-lnl:          [SKIP][171] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][172] +5 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:
    - shard-lnl:          [SKIP][173] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][174] +5 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-lnl:          [SKIP][175] ([Intel XE#6927] / [Intel XE#8854]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_pm_dc@dc5-pageflip-negative.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-lnl:          [SKIP][177] ([Intel XE#7106]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][179] ([Intel XE#1489]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr-dpms:
    - shard-lnl:          [SKIP][181] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][182] +4 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr@psr-dpms.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [SKIP][183] ([Intel XE#7795]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [SKIP][185] ([Intel XE#1435] / [Intel XE#9142]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_setmode@basic.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_setmode@basic.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][187] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          [SKIP][189] ([Intel XE#9125]) -> [SKIP][190] ([Intel XE#3279])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][191] ([Intel XE#9125]) -> [SKIP][192] ([Intel XE#1407]) +5 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-lnl:          [SKIP][193] ([Intel XE#1407]) -> [SKIP][194] ([Intel XE#9125]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [SKIP][195] ([Intel XE#9125]) -> [SKIP][196] ([Intel XE#7059] / [Intel XE#7085])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-lnl:          [SKIP][197] ([Intel XE#1124]) -> [SKIP][198] ([Intel XE#9125]) +4 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          [SKIP][199] ([Intel XE#9125]) -> [SKIP][200] ([Intel XE#1124]) +8 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][201] ([Intel XE#1428] / [Intel XE#7387]) -> [SKIP][202] ([Intel XE#9125])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][203] ([Intel XE#7679]) -> [SKIP][204] ([Intel XE#9125])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][205] ([Intel XE#9125]) -> [SKIP][206] ([Intel XE#7679])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][207] ([Intel XE#9125]) -> [SKIP][208] ([Intel XE#8365]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][209] ([Intel XE#8365]) -> [SKIP][210] ([Intel XE#9125]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:
    - shard-lnl:          [SKIP][211] ([Intel XE#9125]) -> [SKIP][212] ([Intel XE#367])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][213] ([Intel XE#9125]) -> [SKIP][214] ([Intel XE#2887]) +11 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][215] ([Intel XE#2669] / [Intel XE#7389]) -> [SKIP][216] ([Intel XE#9125])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          [SKIP][217] ([Intel XE#9125]) -> [SKIP][218] ([Intel XE#3432]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          [SKIP][219] ([Intel XE#3432]) -> [SKIP][220] ([Intel XE#9125])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][221] ([Intel XE#2887]) -> [SKIP][222] ([Intel XE#9125]) +6 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-lnl:          [SKIP][223] ([Intel XE#6969] / [Intel XE#7006]) -> [SKIP][224] ([Intel XE#7006])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          [SKIP][225] ([Intel XE#9125]) -> [SKIP][226] ([Intel XE#307] / [Intel XE#6974])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-lnl:          [SKIP][227] ([Intel XE#6974]) -> [SKIP][228] ([Intel XE#9125])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          [SKIP][229] ([Intel XE#9125]) -> [SKIP][230] ([Intel XE#7642])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_content_protection@srm.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][231] ([Intel XE#7642]) -> [SKIP][232] ([Intel XE#9125]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_content_protection@uevent.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          [SKIP][233] ([Intel XE#1424]) -> [SKIP][234] ([Intel XE#9125]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          [SKIP][235] ([Intel XE#9125]) -> [SKIP][236] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-lnl:          [SKIP][237] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][238] ([Intel XE#9125])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_cursor_crc@cursor-random-512x512.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          [SKIP][239] ([Intel XE#9125]) -> [SKIP][240] ([Intel XE#1424])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][241] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][242] ([Intel XE#9125]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][243] ([Intel XE#9125]) -> [SKIP][244] ([Intel XE#323] / [Intel XE#6035])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          [SKIP][245] ([Intel XE#1508]) -> [SKIP][246] ([Intel XE#9125])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          [SKIP][247] ([Intel XE#9125]) -> [SKIP][248] ([Intel XE#4354] / [Intel XE#7386])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_dp_link_training@uhbr-mst.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-lnl:          [SKIP][249] ([Intel XE#8265]) -> [SKIP][250] ([Intel XE#9125])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-lnl:          [SKIP][251] ([Intel XE#9125]) -> [SKIP][252] ([Intel XE#8265]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][253] ([Intel XE#1745] / [Intel XE#9144]) -> [SKIP][254] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          [SKIP][255] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) -> [SKIP][256] ([Intel XE#1745] / [Intel XE#9144])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][257] ([Intel XE#7779]) -> [SKIP][258] ([Intel XE#6312]) +5 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][259] ([Intel XE#7779]) -> [SKIP][260] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          [SKIP][261] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][262] ([Intel XE#2548] / [Intel XE#7779]) +8 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          [SKIP][263] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][264] ([Intel XE#2548] / [Intel XE#7779]) +21 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][265] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][266] ([Intel XE#656] / [Intel XE#7905]) +33 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][267] ([Intel XE#6312]) -> [SKIP][268] ([Intel XE#7779]) +6 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][269] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][270] ([Intel XE#6312] / [Intel XE#651]) +9 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][271] ([Intel XE#7779]) -> [SKIP][272] ([Intel XE#7905]) +33 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][273] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][274] ([Intel XE#7779]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-lnl:          [SKIP][275] ([Intel XE#1469] / [Intel XE#7399]) -> [SKIP][276] ([Intel XE#2548] / [Intel XE#7779])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][277] ([Intel XE#7779]) -> [SKIP][278] ([Intel XE#7865]) +22 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-lnl:          [SKIP][279] ([Intel XE#7865]) -> [SKIP][280] ([Intel XE#7779]) +12 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          [SKIP][281] ([Intel XE#7905]) -> [SKIP][282] ([Intel XE#7779]) +24 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-render.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:
    - shard-lnl:          [SKIP][283] ([Intel XE#7779]) -> [SKIP][284] ([Intel XE#7061]) +4 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          [SKIP][285] ([Intel XE#1503]) -> [SKIP][286] ([Intel XE#9125]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_hdr@static-toggle.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-lnl:          [SKIP][287] ([Intel XE#8348]) -> [SKIP][288] ([Intel XE#9125])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_mst@mst-suspend-read-crc.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-lnl:          [SKIP][289] ([Intel XE#9125]) -> [SKIP][290] ([Intel XE#599] / [Intel XE#7382])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_lowres@tiling-none.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-lnl:          [SKIP][291] ([Intel XE#599] / [Intel XE#7382]) -> [SKIP][292] ([Intel XE#9125])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_plane_lowres@tiling-x.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          [SKIP][293] ([Intel XE#599]) -> [SKIP][294] ([Intel XE#9125])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_plane_lowres@tiling-y.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-lnl:          [SKIP][295] ([Intel XE#4596] / [Intel XE#5854]) -> [SKIP][296] ([Intel XE#9125]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-y.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-lnl:          [SKIP][297] ([Intel XE#9125]) -> [SKIP][298] ([Intel XE#4596] / [Intel XE#5854])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          [SKIP][299] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][300] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-lnl:          [SKIP][301] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][302] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][303] ([Intel XE#2029] / [Intel XE#7395]) -> [SKIP][304] ([Intel XE#7778])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-lnl:          [SKIP][305] ([Intel XE#1489]) -> [SKIP][306] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][307] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][308] ([Intel XE#1489]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][309] ([Intel XE#1489]) -> [SKIP][310] ([Intel XE#2893] / [Intel XE#7304]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          [SKIP][311] ([Intel XE#1128] / [Intel XE#7413]) -> [SKIP][312] ([Intel XE#1122] / [Intel XE#7429])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_psr2_su@page_flip-xrgb8888.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-lnl:          [SKIP][313] ([Intel XE#1406] / [Intel XE#7345]) -> [SKIP][314] ([Intel XE#2850] / [Intel XE#929])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-page-flip.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-lnl:          [SKIP][315] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][316] ([Intel XE#1406] / [Intel XE#7345])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-blt.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          [SKIP][317] ([Intel XE#1406]) -> [SKIP][318] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_psr@pr-basic.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          [SKIP][319] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][320] ([Intel XE#1406]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr@pr-cursor-plane-move.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          [SKIP][321] ([Intel XE#9125]) -> [SKIP][322] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-270.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][323] ([Intel XE#9125]) -> [SKIP][324] ([Intel XE#1127] / [Intel XE#5813])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-lnl:          [SKIP][325] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][326] ([Intel XE#9125])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][327] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][328] ([Intel XE#2426] / [Intel XE#5848])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [ABORT][329] ([Intel XE#9131] / [Intel XE#9145]) -> [DMESG-WARN][330] ([Intel XE#9130])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-4/igt@xe_exec_reset@gt-reset-fault-injection.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_exec_reset@gt-reset-fault-injection.html
    - shard-lnl:          [ABORT][331] ([Intel XE#9140] / [Intel XE#9145]) -> [ABORT][332] ([Intel XE#9145])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-1/igt@xe_exec_reset@gt-reset-fault-injection.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_exec_reset@gt-reset-fault-injection.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1511]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592
  [Intel XE#6645]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6645
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7391
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7778]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7778
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7780
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854
  [Intel XE#8866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8866
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9126
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131
  [Intel XE#9132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9132
  [Intel XE#9140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9140
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623 -> xe-pw-149888v7

  IGT_9084: 9084
  xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623: 71bc3b7cc55631a9b3807da98e2b2880838b9623
  xe-pw-149888v7: 149888v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/index.html

--===============4810667558439614782==
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
<tr><td><b>Series:</b></td><td>CPU binds and ULLS on migration queue (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149888/">https://patchwork.freedesktop.org/series/149888/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623_FULL -&gt; xe-pw-149888v7_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149888v7_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149888v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-149888v7_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_vm@bind-array-enobufs:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-3/igt@xe_vm@bind-array-enobufs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@xe_vm@bind-array-enobufs.html">FAIL</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-3/igt@xe_vm@bind-array-enobufs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-2/igt@xe_vm@bind-array-enobufs.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623_FULL and xe-pw-149888v7_FULL:</p>
<h3>New IGT tests (17)</h3>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.87] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@basic-mem:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@basic-utilization:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@mem-active:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@mem-shared:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@mem-total-resident:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-all-full-load:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.20, 7.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-idle:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.15, 7.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.11, 7.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.12, 7.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-isolation:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-idle:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.10, 7.10] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149888v7_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-8/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_content_protection@legacy-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_cursor_edge_walk@256x256-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_cursor_edge_walk@256x256-right-edge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_flip@blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_flip@busy-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_plane_scaling@invalid-num-scalers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_pm_backlight@brightness-with-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_properties@colorop-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9126">Intel XE#9126</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_psr@psr-no-drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@sriov_basic@pf-unbind-with-vf-probed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8866">Intel XE#8866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-decompress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@xe_ccs@vm-bind-decompress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592">Intel XE#6592</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6645">Intel XE#6645</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7391">Intel XE#7391</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_exec_reset@multi-queue-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-global:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@xe_madvise@atomic-global.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-conflict:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_page_reclaim@binds-large-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-invalidate-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_page_reclaim@prl-invalidate-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-5/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_sriov_vram@vf-access-provisioned.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-1/igt@xe_vm@overcommit-fault-vram-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511">Intel XE#1511</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_color@deep-color.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_color@legacy-gamma-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_color@legacy-gamma-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_color_pipeline@plane-lut1d-lut1d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_fb_coherency@memset-crc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_fb_coherency@memset-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9132">Intel XE#9132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_flip@flip-vs-dpms-on-nop.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_lease@lease-unleased-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_lease@lease-unleased-crtc.html">PASS</a> +35 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane@planar-pixel-format-settings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7780">Intel XE#7780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_plane@planar-pixel-format-settings.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane@plane-panning-top-left.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_plane@plane-panning-top-left.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927">Intel XE#6927</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854">Intel XE#8854</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_pm_dc@dc5-pageflip-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106">Intel XE#7106</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_psr@psr-dpms.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_setmode@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348">Intel XE#8348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_lowres@tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_plane_lowres@tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_plane_lowres@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_lowres@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7778">Intel XE#7778</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-4/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131">Intel XE#9131</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-bmg-6/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-1/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9140">Intel XE#9140</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v7/shard-lnl-5/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623 -&gt; xe-pw-149888v7</li>
</ul>
<p>IGT_9084: 9084<br />
  xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623: 71bc3b7cc55631a9b3807da98e2b2880838b9623<br />
  xe-pw-149888v7: 149888v7</p>

</body>
</html>

--===============4810667558439614782==--
