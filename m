Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEAFC83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 19:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4797D10E605;
	Tue,  1 Jul 2025 19:38:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926A210E2E1;
 Tue,  1 Jul 2025 19:38:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5501275575107727363=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe=3A_xe=5Flate=5Fbind?=
 =?utf-8?q?_squash_for_CI_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Jul 2025 19:38:55 -0000
Message-ID: <175139873558.125972.4664519202412121915@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250627145004.653045-1-badal.nilawar@intel.com>
In-Reply-To: <20250627145004.653045-1-badal.nilawar@intel.com>
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

--===============5501275575107727363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: xe_late_bind squash for CI (rev4)
URL   : https://patchwork.freedesktop.org/series/150059/
State : success

== Summary ==

CI Bug Log - changes from xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600_FULL -> xe-pw-150059v4_FULL
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

  Here are the changes found in xe-pw-150059v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][1] -> [FAIL][2] ([Intel XE#3908]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#1124]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#4543]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#367])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#787]) +230 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#455] / [Intel XE#787]) +34 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +5 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][14] -> [INCOMPLETE][15] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#4416]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#306])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2325]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#373]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2252]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][21] ([Intel XE#1178])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2341])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2320]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#4494] / [i915#3804])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#3009])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-7/igt@kms_dp_aux_dev.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2244]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2316]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#4543]) +3 other tests dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-adlp-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2380]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2293]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][36] -> [FAIL][37] ([Intel XE#1874])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2311]) +11 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4141]) +7 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2352])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#651]) +7 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2313]) +12 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#653]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][44] ([Intel XE#4842])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#870])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1489])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1489]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#3414])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#3414] / [Intel XE#3904])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@xe_eudebug_online@resume-one:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4837]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@xe_eudebug_online@resume-one.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#4837]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2322]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][56] -> [SKIP][57] ([Intel XE#1392]) +8 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-463/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#288]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-rebind.html

  * igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4943]) +9 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#4915]) +65 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-dg2-set2:     [PASS][61] -> [DMESG-WARN][62] ([Intel XE#3876])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-433/igt@xe_exec_threads@threads-hang-rebind.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-433/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#512])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_mmap@small-bar.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2541] / [Intel XE#3573])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#1173])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [PASS][67] -> [DMESG-WARN][68] ([Intel XE#2953] / [Intel XE#4173])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pmu@gt-frequency:
    - shard-lnl:          [PASS][69] -> [FAIL][70] ([Intel XE#4835]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-lnl-6/igt@xe_pmu@gt-frequency.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-lnl-7/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4733]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#944])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#944]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#4814])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#4130])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#4273])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][77] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][79] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][81] ([Intel XE#2291]) -> [PASS][82] +3 other tests pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@forked-move:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#4208] / [i915#2575]) -> [PASS][84] +4 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_cursor_legacy@forked-move.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@kms_cursor_legacy@forked-move.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][85] ([Intel XE#4354]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [SKIP][87] ([Intel XE#2316]) -> [PASS][88] +2 other tests pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-8/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][89] ([Intel XE#4543]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][91] ([Intel XE#301]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
    - shard-adlp:         [DMESG-FAIL][93] ([Intel XE#4543]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][95] ([Intel XE#1503]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-8/igt@kms_hdr@static-toggle.html

  * igt@kms_lease@lease-again@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][97] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][98] +3 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-6/igt@kms_lease@lease-again@pipe-a-hdmi-a-1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-adlp-9/igt@kms_lease@lease-again@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][99] ([Intel XE#4596]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][101] ([Intel XE#1435]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#1392]) -> [PASS][104] +9 other tests pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_threads@threads-hang-fd-rebind:
    - shard-dg2-set2:     [DMESG-WARN][105] ([Intel XE#3876]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-rebind.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-rebind.html

  * igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#4208]) -> [PASS][108] +10 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [SKIP][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134]) ([Intel XE#378]) -> ([PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-432/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-463/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-463/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-463/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-464/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-464/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-463/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-463/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-432/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-464/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-433/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-433/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-435/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-435/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-433/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-433/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-433/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-432/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-464/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-432/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-464/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-464/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-433/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-433/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-464/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-466/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-433/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-464/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-466/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-466/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-466/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-466/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][161] ([Intel XE#316])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#4208]) -> [SKIP][163] ([Intel XE#455] / [Intel XE#787])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][164] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][165] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][166] ([Intel XE#1178]) -> [SKIP][167] ([Intel XE#2341])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-7/igt@kms_content_protection@srm.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][168] ([Intel XE#1188]) -> [SKIP][169] ([Intel XE#2341])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-2/igt@kms_content_protection@uevent.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#4208]) -> [SKIP][171] ([Intel XE#4354])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_dp_link_training@non-uhbr-mst.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][172] ([Intel XE#2312]) -> [SKIP][173] ([Intel XE#2311]) +7 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][174] ([Intel XE#2311]) -> [SKIP][175] ([Intel XE#2312]) +7 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][176] ([Intel XE#2312]) -> [SKIP][177] ([Intel XE#4141])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][178] ([Intel XE#4141]) -> [SKIP][179] ([Intel XE#2312]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][180] ([Intel XE#2313]) -> [SKIP][181] ([Intel XE#2312]) +7 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][182] ([Intel XE#2312]) -> [SKIP][183] ([Intel XE#2313]) +9 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#4208]) -> [SKIP][185] ([Intel XE#653]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#4208] / [i915#2575]) -> [INCOMPLETE][187] ([Intel XE#4842])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_hdr@bpc-switch.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][188] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][189] ([Intel XE#3544])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][190] ([Intel XE#5021]) -> [SKIP][191] ([Intel XE#4596])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][193] ([Intel XE#2850] / [Intel XE#929])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_psr@fbc-pr-suspend.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-adlp:         [DMESG-FAIL][194] ([Intel XE#2953] / [Intel XE#4173]) -> [FAIL][195] ([Intel XE#1874])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@xe_exec_system_allocator@once-large-mmap-free-huge:
    - shard-dg2-set2:     [INCOMPLETE][196] ([Intel XE#2594]) -> [SKIP][197] ([Intel XE#4915])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-464/igt@xe_exec_system_allocator@once-large-mmap-free-huge.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-466/igt@xe_exec_system_allocator@once-large-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][198] ([Intel XE#5018]) -> [FAIL][199] ([Intel XE#4937] / [Intel XE#5018])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-remap:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#4208]) -> [SKIP][201] ([Intel XE#4915]) +15 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-remap.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-remap.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1061]) -> [FAIL][203] ([Intel XE#1173])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-432/igt@xe_peer2peer@read.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-464/igt@xe_peer2peer@read.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#4208]) -> [SKIP][205] ([Intel XE#944])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4835
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600 -> xe-pw-150059v4

  IGT_8431: 8431
  xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600: ac0c6f9ab46132d8a40c616bd1e9210db4ffe600
  xe-pw-150059v4: 150059v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/index.html

--===============5501275575107727363==
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
<tr><td><b>Series:</b></td><td>drm/xe: xe_late_bind squash for CI (rev4)</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/150059/">https://patchwork.freedesktop.org/series/150059/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150059v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150059v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db=
4ffe600_FULL -&gt; xe-pw-150059v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150059v4_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-8/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/s=
hard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/sha=
rd-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_bw@linear-tiling-3-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_bw@linear-tiling-3-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +230 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-46=
4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_chamelium_color@ctm-0-2=
5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_chamelium_frames@dp-crc=
-single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_cursor_crc@cursor-rando=
m-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_cursor_crc@cursor-random-=
64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-7/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-150059v4/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-7/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-6/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-4/igt@kms_fli=
p@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-adlp-2/igt@kms_flip@basic-fli=
p-vs-wf_vblank.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cpsr-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@kms_hdr@bpc-switch@pipe-a-d=
p-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_pm_backlight@basic-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-plane-=
move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_psr@pr-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">=
Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_psr@psr2-primary-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@xe_eudebug_online@resume-one.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_eudebug_online@writes-ca=
ching-sram-bb-vram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/s=
hard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalida=
te-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_exec_fault_mode@once-use=
rptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@xe_exec_system_allocator@many=
-large-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +9 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-466/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-large-execqueues-mmap-new-race-nomemset.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Inte=
l XE#4915</a>) +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-433/igt@xe_exe=
c_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-433/igt@xe_exec_threa=
ds@threads-hang-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_mmap@small-bar.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">=
Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_oa@invalid-create-usersp=
ace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_oa@syncs-ufence-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-464/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-2/igt@xe_pm@s=
2idle-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-150059v4/shard-adlp-2/igt@xe_pm@s2idle-d3hot-ba=
sic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-lnl-6/igt@xe_pmu@g=
t-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-150059v4/shard-lnl-7/igt@xe_pmu@gt-frequency.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4835">Int=
el XE#4835</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@xe_pxp@pxp-optout.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">I=
ntel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_query@multigpu-query-top=
ology.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw=
-version-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_render_copy@render-stres=
s-0-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_sriov_auto_provisioning@=
exclusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
73">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_cc=
s@crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
059v4/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +1 other test pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150059v4/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_cu=
rsor_legacy@forked-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2=
-435/igt@kms_cursor_legacy@forked-move.html">PASS</a> +4 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-8/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-8/igt@km=
s_flip@2x-plain-flip-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-8/igt@kms_fli=
p@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel =
XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150059v4/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interrupti=
ble@c-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-lnl-1/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-150059v4/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a=
-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-8/igt@kms_hdr@static-to=
ggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-6/igt@kms_lea=
se@lease-again@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1500=
59v4/shard-adlp-9/igt@kms_lease@lease-again@pipe-a-hdmi-a-1.html">PASS</a> =
+3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_setm=
ode@invalid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-8/igt@k=
ms_setmode@invalid-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard=
-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a>=
 +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-463/igt@xe_exe=
c_threads@threads-hang-fd-rebind.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg=
2-464/igt@xe_exec_threads@threads-hang-fd-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@xe_exe=
c_threads@threads-shared-vm-userptr-invalidate-race.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1500=
59v4/shard-dg2-435/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate=
-race.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-432/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-463/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-4=
66/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard=
-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600=
/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4=
ffe600/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9=
210db4ffe600/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c6=
16bd1e9210db4ffe600/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d=
8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@xe_module_load@load.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab=
46132d8a40c616bd1e9210db4ffe600/shard-dg2-464/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0=
c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-463/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-33=
22-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-432/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-d=
g2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ff=
e600/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e921=
0db4ffe600/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a40c616b=
d1e9210db4ffe600/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab46132d8a4=
0c616bd1e9210db4ffe600/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f9ab461=
32d8a40c616bd1e9210db4ffe600/shard-dg2-433/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-ac0c6f=
9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3322-=
ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-464/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-464/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-150059v4/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-46=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0059v4/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-433/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-150059v4/shard-dg2-463/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/sh=
ard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-150059v4/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-464/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50059v4/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-466/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-464/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-150059v4/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-=
466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-466/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150059v4/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/=
shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_bi=
g_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/sha=
rd-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_cc=
s@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435=
/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2=
-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-7/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-6/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-2/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-6/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_dp=
_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@k=
ms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
059v4/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1500=
59v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4=
/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1500=
59v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50059v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1500=
59v4/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0059v4/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb=
-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_hd=
r@bpc-switch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/igt@km=
s_hdr@bpc-switch.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-3/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-1/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@kms_ps=
r@fbc-pr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-435/=
igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-adlp-6/igt@kms_rot=
ation_crc@multiplane-rotation-cropping-top.html">DMESG-FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">In=
tel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-150059v4/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation-cropp=
ing-top.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-huge:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-464/igt@xe_exe=
c_system_allocator@once-large-mmap-free-huge.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1500=
59v4/shard-dg2-466/igt@xe_exec_system_allocator@once-large-mmap-free-huge.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4915">Intel XE#4915</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-lnl-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5018">Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v4/shard-lnl-8/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#=
4937</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-re=
map:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-large-mmap-shared-remap.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-150059v4/shard-dg2-435/igt@xe_exec_system_allocator@threads-share=
d-vm-many-large-mmap-shared-remap.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +15 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-432/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-464/igt@xe_peer2peer@read=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600/shard-dg2-466/igt@xe_que=
ry@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v4/shard-dg2-4=
35/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)=
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600 -&gt; xe-pw-150=
059v4</li>
</ul>
<p>IGT_8431: 8431<br />
  xe-3322-ac0c6f9ab46132d8a40c616bd1e9210db4ffe600: ac0c6f9ab46132d8a40c616=
bd1e9210db4ffe600<br />
  xe-pw-150059v4: 150059v4</p>

</body>
</html>

--===============5501275575107727363==--
