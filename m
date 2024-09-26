Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF32CCF9E9
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 08:23:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F3010E88C;
	Thu, 26 Sep 2024 08:23:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F2510E88C;
 Thu, 26 Sep 2024 08:23:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5654649016479428987=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5B1/2=5D_?=
 =?utf-8?q?drm/xe=3A_Add_XE=5FBO=5FFLAG=5FNEEDS=5FWC=5FCPU_and_unify_mapping?=
 =?utf-8?q?_for_page_tables=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 08:23:11 -0000
Message-ID: <172733899138.1105372.5765259279799450767@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920190107.156914-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240920190107.156914-1-maarten.lankhorst@linux.intel.com>
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

--===============5654649016479428987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Add XE_BO_FLAG_NEEDS_WC_CPU and unify mapping for page tables. (rev2)
URL   : https://patchwork.freedesktop.org/series/138932/
State : failure

== Summary ==

CI Bug Log - changes from xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b_full -> xe-pw-138932v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138932v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138932v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138932v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Warnings ####

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][4] ([Intel XE#1201]) -> [SKIP][5] +25 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - {shard-bmg}:        [DMESG-WARN][6] ([Intel XE#1033]) -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - {shard-bmg}:        [FAIL][8] ([Intel XE#1659]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - {shard-bmg}:        [SKIP][10] ([Intel XE#2327]) -> [SKIP][11] +5 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - {shard-bmg}:        [SKIP][12] ([Intel XE#610]) -> [SKIP][13] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - {shard-bmg}:        [SKIP][14] ([Intel XE#1124]) -> [SKIP][15] +11 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - {shard-bmg}:        [SKIP][16] ([Intel XE#367]) -> [SKIP][17] +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - {shard-bmg}:        [SKIP][18] ([Intel XE#2251]) -> [SKIP][19] +22 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@content-type-change:
    - {shard-bmg}:        [SKIP][20] ([Intel XE#2341]) -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_content_protection@content-type-change.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - {shard-bmg}:        [SKIP][22] ([Intel XE#2390]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - {shard-bmg}:        [FAIL][24] ([Intel XE#1178]) -> [SKIP][25] +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - {shard-bmg}:        [SKIP][26] ([Intel XE#2320]) -> [SKIP][27] +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - {shard-bmg}:        [PASS][28] -> [INCOMPLETE][29] +3 other tests incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - {shard-bmg}:        [SKIP][30] ([Intel XE#1508]) -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - {shard-bmg}:        [SKIP][32] ([Intel XE#2244]) -> [SKIP][33] +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - {shard-bmg}:        [FAIL][34] ([Intel XE#1695]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@psr1:
    - {shard-bmg}:        NOTRUN -> [SKIP][36] +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-3/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-nonexisting-fb:
    - {shard-bmg}:        [PASS][37] -> [SKIP][38] +152 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - {shard-bmg}:        [FAIL][39] ([Intel XE#886]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - {shard-bmg}:        [SKIP][41] ([Intel XE#2380]) -> [SKIP][42] +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - {shard-bmg}:        [SKIP][43] ([Intel XE#2311]) -> [SKIP][44] +45 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - {shard-bmg}:        [FAIL][45] -> [SKIP][46] +7 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - {shard-bmg}:        [FAIL][47] ([Intel XE#2333]) -> [SKIP][48] +13 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - {shard-bmg}:        [SKIP][49] ([Intel XE#2352]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - {shard-bmg}:        [SKIP][51] ([Intel XE#2313]) -> [SKIP][52] +44 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_plane_lowres@tiling-yf:
    - {shard-bmg}:        [SKIP][53] ([Intel XE#2393]) -> [SKIP][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - {shard-bmg}:        [SKIP][55] ([Intel XE#2763]) -> [SKIP][56] +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - {shard-bmg}:        [SKIP][57] ([Intel XE#2499]) -> [SKIP][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - {shard-bmg}:        [SKIP][59] ([Intel XE#1489]) -> [SKIP][60] +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - {shard-bmg}:        [SKIP][61] ([Intel XE#2850]) -> [SKIP][62] +24 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - {shard-bmg}:        [SKIP][63] ([Intel XE#2329]) -> [SKIP][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - {shard-bmg}:        [SKIP][65] ([Intel XE#2426]) -> [SKIP][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - {shard-bmg}:        [SKIP][67] ([Intel XE#1499]) -> [SKIP][68] +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - {shard-bmg}:        [SKIP][69] ([Intel XE#756]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-7/igt@kms_writeback@writeback-check-output.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_writeback@writeback-check-output.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - {shard-bmg}:        [SKIP][71] ([Intel XE#2849]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@sriov_basic@enable-vfs-autoprobe-off.html

  
Known issues
------------

  Here are the changes found in xe-pw-138932v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][73] -> [INCOMPLETE][74] ([Intel XE#1195]) +1 other test incomplete
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#1659])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1124]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#2191])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#367])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#367])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#787]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#787]) +20 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#314]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#306])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#373])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#373])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#308])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#308])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#309])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][96] ([Intel XE#1195])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][98] -> [INCOMPLETE][99] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][100] -> [INCOMPLETE][101] ([Intel XE#1195] / [Intel XE#2049])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][102] -> [FAIL][103] ([Intel XE#886]) +5 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#455]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#651])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#651]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#656]) +6 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#653]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#653])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:
    - shard-lnl:          [PASS][111] -> [DMESG-WARN][112] ([Intel XE#324]) +2 other tests dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1489])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1201]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1201]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#2850]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1127] / [Intel XE#1201])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][118] -> [FAIL][119] ([Intel XE#899])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vrr@flip-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#455])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_vrr@flip-suspend.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#2849])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][123] ([Intel XE#1473])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][124] -> [TIMEOUT][125] ([Intel XE#1473] / [Intel XE#402])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][126] -> [INCOMPLETE][127] ([Intel XE#1195] / [Intel XE#1473])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@xe_evict@evict-threads-large.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#688])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [PASS][129] -> [FAIL][130] ([Intel XE#1069]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-8/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#288])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#288])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_oa@oa-exponents:
    - shard-lnl:          [PASS][133] -> [FAIL][134] ([Intel XE#2723])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-1/igt@xe_oa@oa-exponents.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-8/igt@xe_oa@oa-exponents.html

  * igt@xe_oa@oa-exponents@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][135] ([Intel XE#2723])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-8/igt@xe_oa@oa-exponents@ccs-0.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#366])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][137] -> [ABORT][138] ([Intel XE#1358] / [Intel XE#1607])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-3/igt@xe_pm@s4-exec-after.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         NOTRUN -> [FAIL][139] ([Intel XE#958])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][140] ([Intel XE#1033]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][142] ([Intel XE#1426]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][144] ([Intel XE#1426]) -> [PASS][145] +3 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-436/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [FAIL][146] ([Intel XE#1659]) -> [PASS][147] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][148] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - {shard-bmg}:        [FAIL][150] -> [PASS][151] +5 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@single-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][152] ([Intel XE#877]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-a.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-adlp:         [DMESG-WARN][154] ([Intel XE#877]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-8/igt@kms_cursor_legacy@torture-move.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-2/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][156] ([Intel XE#1195]) -> [PASS][157] +2 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][158] ([Intel XE#886]) -> [PASS][159] +6 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-lnl:          [FAIL][160] ([Intel XE#2631]) -> [PASS][161] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-8/igt@kms_flip@absolute-wf_vblank.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-2/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1:
    - shard-lnl:          [FAIL][162] -> [PASS][163] +1 other test pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][164] ([Intel XE#886]) -> [PASS][165] +4 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
    - shard-lnl:          [DMESG-FAIL][166] ([Intel XE#324]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-2:
    - shard-lnl:          [DMESG-WARN][168] ([Intel XE#324]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][170] ([Intel XE#616]) -> [PASS][171] +3 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_cursor@viewport:
    - {shard-bmg}:        [DMESG-WARN][172] ([Intel XE#877]) -> [PASS][173] +11 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_plane_cursor@viewport.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-2/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - {shard-bmg}:        [DMESG-WARN][174] ([Intel XE#2566]) -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:
    - {shard-bmg}:        [DMESG-WARN][176] -> [PASS][177] +7 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - {shard-bmg}:        [INCOMPLETE][178] ([Intel XE#2870]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][180] ([Intel XE#1473]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [DMESG-WARN][182] -> [PASS][183] +2 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-4/igt@xe_pm@s2idle-multiple-execs.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-2/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][184] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#316]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][189] ([Intel XE#316]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1124]) -> [SKIP][191] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][193] ([Intel XE#610])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][195] ([Intel XE#1124]) +6 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#610]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#610])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#367]) -> [SKIP][199] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][201] ([Intel XE#2191]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][203] ([Intel XE#367]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][205] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][207] ([Intel XE#787]) +62 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1252]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#787]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][215] ([Intel XE#314]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][217] ([Intel XE#306]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#306]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#306])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][221] ([Intel XE#373]) +6 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#373]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][225] ([Intel XE#308])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#308]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#323]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#323])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#307]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#307])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#776]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#776])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#701]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#701])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-436/igt@kms_feature_discovery@chamelium.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][237] ([Intel XE#651]) +26 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#658]) -> [SKIP][239] ([Intel XE#1201])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#651]) -> [SKIP][241] ([Intel XE#1201] / [Intel XE#651]) +14 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#653]) -> [SKIP][243] ([Intel XE#1201] / [Intel XE#653]) +15 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][245] ([Intel XE#653]) +24 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201]) -> [SKIP][247] ([Intel XE#2763]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][248] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][249] ([Intel XE#1204])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#1489]) -> [SKIP][251] ([Intel XE#1201]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1201]) -> [SKIP][253] ([Intel XE#1489]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#2850]) -> [SKIP][255] ([Intel XE#1201]) +7 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-render.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@psr-basic:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1201]) -> [SKIP][257] ([Intel XE#2850]) +11 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_psr@psr-basic.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][259] ([Intel XE#327]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#455]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][263] ([Intel XE#1729])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][265] ([Intel XE#1500])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][267] ([Intel XE#455]) +18 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_vrr@flipline.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#1201] / [Intel XE#2849]) -> [SKIP][269] ([Intel XE#2849])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][270] -> [SKIP][271] ([Intel XE#1201]) +20 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][273] ([Intel XE#288]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#288]) -> [SKIP][275] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][277] ([Intel XE#1337])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][279] ([Intel XE#366]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2631]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2631
  [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2870
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b -> xe-pw-138932v2

  IGT_8032: 8032
  xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b: 88d592f72f7bc508d6a027b1f96aa2e53f803e1b
  xe-pw-138932v2: 138932v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/index.html

--===============5654649016479428987==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Add XE_BO_FLAG_NEEDS_WC_CPU and unify mapping for page tables. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138932/">https://patchwork.freedesktop.org/series/138932/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b_full -&gt; xe-pw-138932v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138932v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138932v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138932v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@once-bindexecqueue-imm:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_async_flips@async-flip-with-page-flip-events.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251">Intel XE#2251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_content_protection@content-type-change.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-3/igt@kms_feature_discovery@psr1.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> +152 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-7/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@kms_writeback@writeback-check-output.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-6/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138932v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-466/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-8/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-1/igt@xe_oa@oa-exponents.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-8/igt@xe_oa@oa-exponents.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-8/igt@xe_oa@oa-exponents@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-3/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-436/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-8/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-2/igt@kms_cursor_legacy@torture-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-8/igt@kms_flip@absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2631">Intel XE#2631</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-2/igt@kms_flip@absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_plane_cursor@viewport.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-2/igt@kms_plane_cursor@viewport.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2870">Intel XE#2870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-4/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-2/igt@xe_pm@s2idle-multiple-execs.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-6/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-436/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138932v2/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b -&gt; xe-pw-138932v2</li>
</ul>
<p>IGT_8032: 8032<br />
  xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b: 88d592f72f7bc508d6a027b1f96aa2e53f803e1b<br />
  xe-pw-138932v2: 138932v2</p>

</body>
</html>

--===============5654649016479428987==--
