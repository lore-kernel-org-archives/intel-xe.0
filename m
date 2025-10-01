Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F4ECCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 03:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4008710E64F;
	Wed,  1 Oct 2025 03:12:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FD410E64B;
 Wed,  1 Oct 2025 03:12:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1285069471714296431=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe=3A_TileAddrRange_re?=
 =?utf-8?q?gisters_are_being_deprecated=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Oct 2025 03:12:51 -0000
Message-ID: <175928837160.381167.8889814357492983028@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250930232645.600251-1-fei.yang@intel.com>
In-Reply-To: <20250930232645.600251-1-fei.yang@intel.com>
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

--===============1285069471714296431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: TileAddrRange registers are being deprecated.
URL   : https://patchwork.freedesktop.org/series/155264/
State : success

== Summary ==

CI Bug Log - changes from xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947_FULL -> xe-pw-155264v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947_FULL and xe-pw-155264v1_FULL:

### New IGT tests (9) ###

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.48] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.93] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  

Known issues
------------

  Here are the changes found in xe-pw-155264v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] ([Intel XE#316])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][2] ([Intel XE#1124]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#787]) +139 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#2907])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][6] -> [INCOMPLETE][7] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#4417]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#306]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#373]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][11] ([Intel XE#1178])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][12] ([Intel XE#1188])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-435/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2291]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#323])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#4294])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#455]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][19] -> [FAIL][20] ([Intel XE#3098])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][21] ([Intel XE#3098])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2316]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#301]) +2 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][26] -> [DMESG-WARN][27] ([Intel XE#4543]) +2 other tests dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#301] / [Intel XE#3149])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#651]) +8 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#653]) +12 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#1503]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#616]) +3 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-adlp:         [PASS][35] -> [DMESG-WARN][36] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-9/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#2938])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#870])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1122] / [Intel XE#1406])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#3414])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][43] -> [INCOMPLETE][44] ([Intel XE#4488]) +1 other test incomplete
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][45] -> [FAIL][46] ([Intel XE#4459]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#6010])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@xe_configfs@survivability-mode.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#5626])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#4837]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-dg2-set2:     [PASS][50] -> [SKIP][51] ([Intel XE#1392]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1392]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate:
    - shard-dg2-set2:     [PASS][53] -> [INCOMPLETE][54] ([Intel XE#4842])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-464/igt@xe_exec_compute_mode@once-userptr-invalidate.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-434/igt@xe_exec_compute_mode@once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#288]) +8 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#2360]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#4915]) +83 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][58] -> [DMESG-WARN][59] ([Intel XE#5893])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#560])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#3573]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#4733])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#944]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@xe_query@multigpu-query-config.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#4814])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#4130])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][66] ([Intel XE#3908]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][68] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][70] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][72] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522] / [Intel XE#6014]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][74] ([Intel XE#301]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][76] ([Intel XE#5208]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-1/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][78] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][79] +3 other tests pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][80] ([Intel XE#4543]) -> [PASS][81] +10 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][82] ([Intel XE#4543]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][84] ([Intel XE#1874]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#1392]) -> [PASS][87] +6 other tests pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [DMESG-WARN][88] -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-4/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][90] ([Intel XE#3876]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html

  * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch-race}:
    - shard-bmg:          [CRASH][92] ([Intel XE#6192]) -> [PASS][93] +5 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch-race.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-malloc-prefetch-race.html

  * {igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma}:
    - shard-lnl:          [FAIL][94] -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * {igt@xe_exec_system_allocator@twice-malloc-prefetch}:
    - shard-lnl:          [CRASH][96] ([Intel XE#6192]) -> [PASS][97] +9 other tests pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-4/igt@xe_exec_system_allocator@twice-malloc-prefetch.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-lnl-1/igt@xe_exec_system_allocator@twice-malloc-prefetch.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind:
    - shard-bmg:          [DMESG-FAIL][98] ([Intel XE#3876]) -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-2/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][100] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-FAIL][101] ([Intel XE#4543])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][102] ([Intel XE#1188]) -> [SKIP][103] ([Intel XE#2341])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@kms_content_protection@uevent.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][104] ([Intel XE#301]) -> [FAIL][105] ([Intel XE#301] / [Intel XE#3149])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:
    - shard-adlp:         [TIMEOUT][106] ([Intel XE#4543]) -> [DMESG-WARN][107] ([Intel XE#4543]) +1 other test dmesg-warn
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-1/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-8/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][108] ([Intel XE#5208]) -> [DMESG-WARN][109] ([Intel XE#4543] / [Intel XE#5208])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][110] ([Intel XE#2311]) -> [SKIP][111] ([Intel XE#2312]) +6 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][112] ([Intel XE#5390]) -> [SKIP][113] ([Intel XE#2312]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][114] ([Intel XE#2313]) -> [SKIP][115] ([Intel XE#2312]) +7 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][116] ([Intel XE#3325]) -> [SKIP][117] ([Intel XE#734])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#362]) -> [FAIL][119] ([Intel XE#1729])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1500]) -> [SKIP][121] ([Intel XE#362])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][122] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [ABORT][123] ([Intel XE#5466] / [Intel XE#5530])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
  [Intel XE#6014]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#6192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947 -> xe-pw-155264v1

  IGT_8564: fd0f7b3639b26971567b7a9d64ba5174d5d3db5a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947: 23f8be57505c80e5b57dec249df8a3cc053eb947
  xe-pw-155264v1: 155264v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/index.html

--===============1285069471714296431==
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
<tr><td><b>Series:</b></td><td>drm/xe: TileAddrRange registers are being deprecated.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155264/">https://patchwork.freedesktop.org/series/155264/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947_FULL -&gt; xe-pw-155264v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947_FULL and xe-pw-155264v1_FULL:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155264v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +139 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-435/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-9/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488">Intel XE#4488</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@xe_configfs@survivability-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010">Intel XE#6010</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@xe_eu_stall@invalid-event-report-count.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-464/igt@xe_exec_compute_mode@once-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-434/igt@xe_exec_compute_mode@once-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@xe_render_copy@render-stress-4-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014">Intel XE#6014</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-1/igt@kms_flip@flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-4/igt@xe_exec_reset@cm-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-stride-malloc-prefetch-race}:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch-race.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192">Intel XE#6192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-malloc-prefetch-race.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@twice-malloc-prefetch}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-4/igt@xe_exec_system_allocator@twice-malloc-prefetch.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192">Intel XE#6192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-lnl-1/igt@xe_exec_system_allocator@twice-malloc-prefetch.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-2/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-1/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-8/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325">Intel XE#3325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155264v1/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947 -&gt; xe-pw-155264v1</li>
</ul>
<p>IGT_8564: fd0f7b3639b26971567b7a9d64ba5174d5d3db5a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947: 23f8be57505c80e5b57dec249df8a3cc053eb947<br />
  xe-pw-155264v1: 155264v1</p>

</body>
</html>

--===============1285069471714296431==--
