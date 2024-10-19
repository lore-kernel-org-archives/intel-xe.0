Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF057D3C92C
	for <intel-xe@archiver.kernel.org>; Sat, 19 Oct 2024 21:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CFF10E244;
	Sat, 19 Oct 2024 21:06:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F0D10E244;
 Sat, 19 Oct 2024 21:06:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1251243796406844295=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Fix_non-contiguous_VRAM_BO_acce?=
 =?utf-8?q?ss_in_Xe_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 19 Oct 2024 21:06:12 -0000
Message-ID: <172937197246.1302594.7211810786508017336@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241019192030.1505020-1-matthew.brost@intel.com>
In-Reply-To: <20241019192030.1505020-1-matthew.brost@intel.com>
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

--===============1251243796406844295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix non-contiguous VRAM BO access in Xe (rev3)
URL   : https://patchwork.freedesktop.org/series/140200/
State : failure

== Summary ==

CI Bug Log - changes from xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124_full -> xe-pw-140200v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140200v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140200v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140200v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-6/igt@kms_flip@basic-flip-vs-modeset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-7/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +3 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-4/igt@kms_pm_rpm@legacy-planes.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][5] ([Intel XE#1231]) -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][7] ([Intel XE#1178]) -> [TIMEOUT][8] +1 other test timeout
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-466/igt@kms_content_protection@atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-463/igt@kms_content_protection@atomic.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     [SKIP][9] ([Intel XE#2935]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-render.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-render.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
    - {shard-bmg}:        [PASS][11] -> [INCOMPLETE][12] +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html

  
Known issues
------------

  Here are the changes found in xe-pw-140200v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#873])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#1701]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1124]) +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#610])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#367]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2907]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][22] ([Intel XE#616]) +8 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][24] ([Intel XE#1195])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +55 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#306])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#373]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#307])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][29] ([Intel XE#1178]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#308])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#1475]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#455])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1138])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1135])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#310])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#886]) +9 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#651]) +20 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#658])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#653]) +17 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#653]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][43] -> [SKIP][44] ([Intel XE#455])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-435/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][45] -> [FAIL][46] ([Intel XE#616]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-464/igt@kms_plane_cursor@viewport.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#2763]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#870])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@kms_pm_backlight@fade.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1489]) +6 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#2948]) +5 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#2850] / [Intel XE#929])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#327])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#455]) +13 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#1729])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1500])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#756])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#2905]) +8 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][62] -> [TIMEOUT][63] ([Intel XE#1473] / [Intel XE#402])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][64] -> [TIMEOUT][65] ([Intel XE#1473])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#261] / [Intel XE#688])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1392])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - shard-lnl:          [PASS][68] -> [DMESG-WARN][69] ([Intel XE#2687])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-5/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#288]) +14 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][71] ([Intel XE#2105])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#2541]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-lnl:          NOTRUN -> [FAIL][73] ([Intel XE#2514])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [PASS][74] -> [ABORT][75] ([Intel XE#1358])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-436/igt@xe_pm@s4-basic.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-432/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][76] -> [ABORT][77] ([Intel XE#1794])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-dg2-set2:     [PASS][78] -> [INCOMPLETE][79] ([Intel XE#1195]) +1 other test incomplete
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-436/igt@xe_pm_residency@idle-residency-on-exec.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@xe_pm_residency@idle-residency-on-exec.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#944])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@xe_query@multigpu-query-invalid-query.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][81] -> [PASS][82] +2 other tests pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][83] ([Intel XE#1701]) -> [PASS][84] +1 other test pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - {shard-bmg}:        [FAIL][85] ([Intel XE#1426]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][87] ([Intel XE#1426]) -> [PASS][88] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][89] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][91] ([Intel XE#1195]) -> [PASS][92] +4 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][93] -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][95] ([Intel XE#1195] / [Intel XE#2692]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][97] ([Intel XE#3113]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - {shard-bmg}:        [DMESG-WARN][99] ([Intel XE#877]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [FAIL][101] ([Intel XE#1475]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][103] ([Intel XE#301]) -> [PASS][104] +3 other tests pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][105] ([Intel XE#1204]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - {shard-bmg}:        [FAIL][107] ([Intel XE#301]) -> [PASS][108] +4 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][109] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - {shard-bmg}:        [FAIL][111] ([Intel XE#3098]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     [ABORT][113] ([Intel XE#2625]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][115] -> [PASS][116] +1 other test pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-466/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-463/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        [SKIP][117] ([Intel XE#1503]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-59:
    - shard-lnl:          [DMESG-WARN][119] -> [PASS][120] +3 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [DMESG-WARN][121] ([Intel XE#2042]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][123] ([Intel XE#899]) -> [PASS][124] +3 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [FAIL][125] ([Intel XE#2443]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-3/igt@kms_vrr@max-min.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-7/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-beng-threads-large:
    - {shard-bmg}:        [INCOMPLETE][127] ([Intel XE#1473]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][129] ([Intel XE#1600]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_reset@parallel-close-fd:
    - {shard-bmg}:        [FAIL][131] -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-1/igt@xe_exec_reset@parallel-close-fd.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-5/igt@xe_exec_reset@parallel-close-fd.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][133] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][135] ([Intel XE#958]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-3/igt@xe_pm_residency@toggle-gt-c6.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][137] -> [FAIL][138] ([Intel XE#1231])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][139] ([Intel XE#1195] / [Intel XE#1727]) -> [INCOMPLETE][140] ([Intel XE#1195] / [Intel XE#1727] / [Intel XE#2692])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][141] ([Intel XE#1035]) -> [INCOMPLETE][142] ([Intel XE#1035] / [Intel XE#1195])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-3/igt@kms_plane@pixel-format.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-1/igt@kms_plane@pixel-format.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2935
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124 -> xe-pw-140200v3

  IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124: 38b97dc95877282bd4ddd58864f2b5f29c6cd124
  xe-pw-140200v3: 140200v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/index.html

--===============1251243796406844295==
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
<tr><td><b>Series:</b></td><td>Fix non-contiguous VRAM BO access in Xe (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140200/">https://patchwork.freedesktop.org/series/140200/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124_full -&gt; xe-pw-140200v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140200v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140200v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140200v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-6/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-7/igt@kms_flip@basic-flip-vs-modeset.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-4/igt@kms_pm_rpm@legacy-planes.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-466/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-463/igt@kms_content_protection@atomic.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2935">Intel XE#2935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140200v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-464/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-466/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-5/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-436/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-432/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-436/igt@xe_pm_residency@idle-residency-on-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@xe_pm_residency@idle-residency-on-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-466/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-463/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-lnl-3/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-lnl-7/igt@kms_vrr@max-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-close-fd:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-bmg-1/igt@xe_exec_reset@parallel-close-fd.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-bmg-5/igt@xe_exec_reset@parallel-close-fd.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-3/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140200v3/shard-adlp-1/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124 -&gt; xe-pw-140200v3</li>
</ul>
<p>IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2097-38b97dc95877282bd4ddd58864f2b5f29c6cd124: 38b97dc95877282bd4ddd58864f2b5f29c6cd124<br />
  xe-pw-140200v3: 140200v3</p>

</body>
</html>

--===============1251243796406844295==--
