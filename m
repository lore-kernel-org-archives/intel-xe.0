Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462EDD59F65
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 19:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0C210E768;
	Wed,  6 Nov 2024 19:02:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231AB10E768;
 Wed,  6 Nov 2024 19:02:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4383376802920245954=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/dmc=3A_Test_Xe2LPD_DMC?=
 =?utf-8?q?_v2=2E23?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Nov 2024 19:02:27 -0000
Message-ID: <173091974712.1418566.8533324550681536234@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105120159.18286-1-gustavo.sousa@intel.com>
In-Reply-To: <20241105120159.18286-1-gustavo.sousa@intel.com>
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

--===============4383376802920245954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: Test Xe2LPD DMC v2.23
URL   : https://patchwork.freedesktop.org/series/140943/
State : failure

== Summary ==

CI Bug Log - changes from xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea_full -> xe-pw-140943v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140943v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140943v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140943v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@ctm-signed@pipe-c-edp-1:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-7/igt@kms_color@ctm-signed@pipe-c-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-8/igt@kms_color@ctm-signed@pipe-c-edp-1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][6] -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-bmg:          [SKIP][8] ([Intel XE#2763]) -> [INCOMPLETE][9] +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  
New tests
---------

  New tests have been introduced between xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea_full and xe-pw-140943v1_full:

### New IGT tests (14) ###

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.71] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.65] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bc-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.62] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.80] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.70] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ad-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.65] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.62] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bd-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.63] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@cd-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.65] s

  * igt@kms_hdr@static-toggle-dpms@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_lease@atomic-implicit-crtc@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in xe-pw-140943v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [PASS][10] -> [SKIP][11] ([Intel XE#1885])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@core_hotunplug@hotrebind.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@core_hotunplug@hotrebind.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     NOTRUN -> [FAIL][12] ([Intel XE#3130] / [Intel XE#3249])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     NOTRUN -> [FAIL][13] ([Intel XE#3339])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][14] -> [SKIP][15] ([Intel XE#2134]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@fbdev@info.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@fbdev@info.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][16] -> [DMESG-FAIL][17] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3194])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#1033] / [Intel XE#1727]) +2 other tests dmesg-fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#2550]) +11 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [FAIL][22] ([Intel XE#1874])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][23] ([Intel XE#1231] / [Intel XE#1242])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#316]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1124]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#367])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][28] -> [SKIP][29] ([Intel XE#2351] / [Intel XE#2890]) +8 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#787]) +8 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-c-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +99 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-c-dp-5.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-dp-5.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#616]) +7 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#1195])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][35] -> [DMESG-WARN][36] ([Intel XE#3113])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#373])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#373]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#2423] / [i915#2575]) +20 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color@ctm-negative@pipe-b-edp-1:
    - shard-lnl:          [PASS][40] -> [DMESG-WARN][41] ([Intel XE#2929]) +2 other tests dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-7/igt@kms_color@ctm-negative@pipe-b-edp-1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-7/igt@kms_color@ctm-negative@pipe-b-edp-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#3304])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#1178])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#309])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_draw_crc@fill-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#2351] / [Intel XE#2890]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#310])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][47] -> [FAIL][48] ([Intel XE#301]) +3 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#301]) +4 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][50] -> [SKIP][51] ([Intel XE#2423] / [i915#2575]) +64 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_flip@busy-flip.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_flip@busy-flip.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#886])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][54] -> [SKIP][55] ([Intel XE#2890]) +20 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#455]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#455]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#2890]) +13 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][59] -> [FAIL][60] ([Intel XE#1874]) +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#656]) +8 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#651]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#651]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#653]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#653]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#2927])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][67] -> [INCOMPLETE][68] ([Intel XE#1195])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#2763]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#2763]) +8 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-adlp:         [PASS][73] -> [DMESG-WARN][74] ([Intel XE#3086]) +4 other tests dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-9/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#2446]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
    - shard-lnl:          [PASS][77] -> [DMESG-WARN][78] ([Intel XE#2042]) +1 other test dmesg-warn
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-8/igt@kms_pm_rpm@system-suspend-modeset.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-5/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-59:
    - shard-lnl:          [PASS][79] -> [DMESG-WARN][80] ([Intel XE#3184]) +3 other tests dmesg-warn
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1489])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1489])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][84] -> [FAIL][85] ([Intel XE#771] / [Intel XE#899])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][86] -> [FAIL][87] ([Intel XE#899])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1130]) +31 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2905])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#2905]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1392]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][94] -> [FAIL][95] ([Intel XE#1630]) +1 other test fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-lnl:          [PASS][96] -> [FAIL][97] ([Intel XE#1630]) +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#288]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#2360])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][100] -> [INCOMPLETE][101] ([Intel XE#1195]) +1 other test incomplete
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         NOTRUN -> [FAIL][102] ([Intel XE#1999]) +2 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#2541])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     [PASS][104] -> [ABORT][105] ([Intel XE#1358] / [Intel XE#1794])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-464/igt@xe_pm@s2idle-basic.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][106] -> [ABORT][107] ([Intel XE#1794])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-3/igt@xe_pm@s4-mocs.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#944])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_vm@mmap-style-bind-userptr-one-partial:
    - shard-dg2-set2:     [PASS][109] -> [SKIP][110] ([Intel XE#1130]) +117 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@xe_vm@mmap-style-bind-userptr-one-partial.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_vm@mmap-style-bind-userptr-one-partial.html

  
#### Possible fixes ####

  * igt@core_getstats:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#2423]) -> [PASS][112] +1 other test pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@core_getstats.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@core_getstats.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#1885]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [SKIP][115] -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#2134]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@fbdev@eof.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@fbdev@eof.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][119] ([Intel XE#3194]) -> [PASS][120] +2 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][121] ([Intel XE#1426]) -> [PASS][122] +1 other test pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking:
    - shard-adlp:         [ABORT][123] ([Intel XE#1727]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-4/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_atomic_transition@plane-all-transition-nonblocking.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#2890]) -> [PASS][126] +23 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][128] +6 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_color@deep-color:
    - shard-lnl:          [DMESG-WARN][129] ([Intel XE#2929]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-3/igt@kms_color@deep-color.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-7/igt@kms_color@deep-color.html

  * igt@kms_color@deep-color@pipe-a-edp-1-ctm:
    - shard-lnl:          [DMESG-WARN][131] -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-3/igt@kms_color@deep-color@pipe-a-edp-1-ctm.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-7/igt@kms_color@deep-color@pipe-a-edp-1-ctm.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [FAIL][133] ([Intel XE#1541]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][135] ([Intel XE#301]) -> [PASS][136] +7 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][137] ([Intel XE#886]) -> [PASS][138] +12 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2:
    - shard-bmg:          [FAIL][139] ([Intel XE#2882]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#2423] / [i915#2575]) -> [PASS][142] +65 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_lease@lease-invalid-crtc.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_lease@multimaster-lease:
    - shard-adlp:         [DMESG-WARN][143] ([Intel XE#3086]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-6/igt@kms_lease@multimaster-lease.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-2/igt@kms_lease@multimaster-lease.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][145] ([Intel XE#2029]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#2446]) -> [PASS][148] +4 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [DMESG-WARN][149] ([Intel XE#2042]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-dg2-set2:     [INCOMPLETE][151] ([Intel XE#1195] / [Intel XE#2870]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_rotation_crc@multiplane-rotation.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][153] ([Intel XE#899]) -> [PASS][154] +2 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-bmg:          [DMESG-WARN][155] ([Intel XE#877]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-7/igt@kms_vblank@wait-forked-busy-hang.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-1/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][157] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1130]) -> [PASS][160] +119 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [FAIL][161] ([Intel XE#1630]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][163] ([Intel XE#1630]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-lnl:          [FAIL][165] ([Intel XE#3320]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#2229]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [FAIL][169] ([Intel XE#2136]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_module_load@many-reload.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@xe_module_load@many-reload.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-lnl:          [DMESG-WARN][171] ([Intel XE#3184]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-7/igt@xe_pm@d3hot-multiple-execs.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-2/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][173] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#316]) -> [SKIP][176] ([Intel XE#2351] / [Intel XE#2890])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#2890]) -> [SKIP][178] ([Intel XE#316]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][180] ([Intel XE#316])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][181] -> [FAIL][182] ([Intel XE#1242])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][183] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][184] ([Intel XE#3194])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][186] ([Intel XE#1124]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#607]) -> [SKIP][188] ([Intel XE#2351] / [Intel XE#2890])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1124]) -> [SKIP][190] ([Intel XE#2890]) +6 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][191] ([Intel XE#1231] / [Intel XE#1242]) -> [FAIL][192] ([Intel XE#1242])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1124]) -> [SKIP][194] ([Intel XE#2351] / [Intel XE#2890])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2890]) -> [SKIP][196] ([Intel XE#1124]) +5 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#367]) -> [SKIP][198] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#2423] / [i915#2575]) -> [SKIP][200] ([Intel XE#367]) +4 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][201] ([Intel XE#2314] / [Intel XE#2894]) -> [INCOMPLETE][202] ([Intel XE#2594])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][204] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][206] ([Intel XE#2890]) +9 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][208] ([Intel XE#2351] / [Intel XE#2890]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#2907]) -> [SKIP][210] ([Intel XE#2890])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#2890]) -> [SKIP][212] ([Intel XE#2907])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#2890]) -> [SKIP][214] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#2890]) -> [FAIL][216] ([Intel XE#616])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][217] ([Intel XE#1195] / [Intel XE#2692]) -> [INCOMPLETE][218] ([Intel XE#1195] / [Intel XE#1727])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2423] / [i915#2575]) -> [SKIP][220] ([Intel XE#373]) +7 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_chamelium_audio@dp-audio.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2423] / [i915#2575]) -> [SKIP][222] ([Intel XE#306])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#306]) -> [SKIP][224] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#373]) -> [SKIP][226] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#307]) -> [SKIP][228] ([Intel XE#2423] / [i915#2575])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2423] / [i915#2575]) -> [SKIP][230] ([Intel XE#307])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#2423] / [i915#2575]) -> [FAIL][232] ([Intel XE#1178])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#455]) -> [SKIP][234] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_content_protection@lic-type-1.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#308]) -> [SKIP][236] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2423] / [i915#2575]) -> [SKIP][238] ([Intel XE#455]) +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#323]) -> [SKIP][240] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2423] / [i915#2575]) -> [SKIP][242] ([Intel XE#323])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#455]) -> [SKIP][244] ([Intel XE#2351] / [Intel XE#2890])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_dsc@dsc-with-formats.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#776]) -> [SKIP][246] ([Intel XE#2890])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2423] / [i915#2575]) -> [FAIL][248] ([Intel XE#301])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][249] ([Intel XE#301]) -> [SKIP][250] ([Intel XE#2423] / [i915#2575])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-bmg:          [FAIL][251] ([Intel XE#2882]) -> [INCOMPLETE][252] ([Intel XE#2635])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][254] ([Intel XE#455])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2890]) -> [SKIP][256] ([Intel XE#455]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#455]) -> [SKIP][258] ([Intel XE#2890]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2423] / [i915#2575]) -> [SKIP][260] ([i915#5274])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2890]) -> [SKIP][262] ([Intel XE#651]) +14 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#651]) -> [SKIP][264] ([Intel XE#2890]) +18 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][266] ([Intel XE#651]) +11 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [TIMEOUT][267] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][268] ([Intel XE#1861])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#651]) -> [SKIP][270] ([Intel XE#2351] / [Intel XE#2890]) +8 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#653]) -> [SKIP][272] ([Intel XE#2890]) +15 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2890]) -> [SKIP][274] ([Intel XE#653]) +19 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#653]) -> [SKIP][276] ([Intel XE#2351] / [Intel XE#2890]) +6 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][278] ([Intel XE#653]) +6 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [INCOMPLETE][279] ([Intel XE#1035]) -> [INCOMPLETE][280] ([Intel XE#1035] / [Intel XE#1195])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-adlp:         [FAIL][281] ([Intel XE#1874]) -> [INCOMPLETE][282] ([Intel XE#1195])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-2/igt@kms_plane_lowres@tiling-y.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [FAIL][283] ([Intel XE#361]) -> [SKIP][284] ([Intel XE#2423] / [i915#2575])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][286] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2423] / [i915#2575]) -> [SKIP][288] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2890]) -> [SKIP][290] ([Intel XE#870])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2938]) -> [SKIP][292] ([Intel XE#2890])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2890]) -> [SKIP][294] ([Intel XE#1129])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#908]) -> [SKIP][296] ([Intel XE#2351] / [Intel XE#2890])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][297] ([Intel XE#734]) -> [FAIL][298] ([Intel XE#3325])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1489]) -> [SKIP][300] ([Intel XE#2890]) +6 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2890]) -> [SKIP][302] ([Intel XE#1489]) +8 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2890]) -> [SKIP][304] ([Intel XE#1122])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][306] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2890]) -> [SKIP][308] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][310] ([Intel XE#2890]) +11 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2351]) -> [SKIP][312] ([Intel XE#2850] / [Intel XE#929])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][314] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_psr@psr-sprite-blt.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][316] ([Intel XE#2939])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][317] ([Intel XE#2426]) -> [FAIL][318] ([Intel XE#1729])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#1500]) -> [SKIP][320] ([Intel XE#2423] / [i915#2575])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2423] / [i915#2575]) -> [SKIP][322] ([Intel XE#330])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2168]) -> [SKIP][324] ([Intel XE#2423] / [i915#2575])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_vrr@cmrr.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#756]) -> [SKIP][326] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2423] / [i915#2575]) -> [SKIP][328] ([Intel XE#1091] / [Intel XE#2849])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#1130]) -> [SKIP][330] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1126]) -> [SKIP][332] ([Intel XE#1130])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2905]) -> [SKIP][334] ([Intel XE#1130]) +7 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@xe_eudebug@attach-debug-metadata.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#1130]) -> [TIMEOUT][336] ([Intel XE#1473])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@once-userptr-rebind:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#1130]) -> [SKIP][338] ([Intel XE#288]) +19 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-rebind.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#288]) -> [SKIP][340] ([Intel XE#1130]) +21 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1130]) -> [SKIP][342] ([Intel XE#2360]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#1130]) -> [SKIP][344] ([Intel XE#2905]) +6 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2541]) -> [SKIP][346] ([Intel XE#1130]) +5 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1130]) -> [SKIP][348] ([Intel XE#2541]) +6 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#1337]) -> [SKIP][350] ([Intel XE#1130])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1130]) -> [SKIP][352] ([Intel XE#2839] / [Intel XE#977])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][354] ([Intel XE#1130])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#1130]) -> [ABORT][356] ([Intel XE#1794])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][357] ([Intel XE#1358]) -> [SKIP][358] ([Intel XE#1130])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     [ABORT][359] ([Intel XE#1794]) -> [SKIP][360] ([Intel XE#1130])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@xe_pm@s4-vm-bind-prefetch.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#1130]) -> [SKIP][362] ([Intel XE#579])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#944]) -> [SKIP][364] ([Intel XE#1130]) +3 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@xe_query@multigpu-query-engines.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#1130]) -> [SKIP][366] ([Intel XE#944]) +4 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1130]) -> [SKIP][368] ([Intel XE#3342])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     [FAIL][369] ([Intel XE#2922]) -> [SKIP][370] ([Intel XE#1130])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@xe_tlb@basic-tlb.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_tlb@basic-tlb.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2870
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea -> xe-pw-140943v1

  IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea: 0f5cd39d188cbedacf9e764749b65a328d33c8ea
  xe-pw-140943v1: 140943v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/index.html

--===============4383376802920245954==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc: Test Xe2LPD DMC v2.23</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140943/">https://patchwork.freedesktop.org/series/140943/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea_full -&gt; xe-pw-140943v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140943v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140943v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140943v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-7/igt@kms_color@ctm-signed@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-8/igt@kms_color@ctm-signed@pipe-c-edp-1.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea_full and xe-pw-140943v1_full:</p>
<h3>New IGT tests (14)</h3>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bc-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ad-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bd-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@cd-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140943v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@core_hotunplug@hotrebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130">Intel XE#3130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-c-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-c-dp-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +99 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-dp-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-7/igt@kms_color@ctm-negative@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-7/igt@kms_color@ctm-negative@pipe-b-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@fill-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_draw_crc@fill-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_flip@busy-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-9/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-8/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-5/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_evict@evict-beng-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-464/igt@xe_pm@s2idle-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@xe_pm@s2idle-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-3/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-userptr-one-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@xe_vm@mmap-style-bind-userptr-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_vm@mmap-style-bind-userptr-one-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +117 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@core_getstats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@core_getstats.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@fbdev@eof.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-4/igt@kms_atomic_transition@plane-all-transition-nonblocking.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_atomic_transition@plane-all-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-0.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_big_fb@x-tiled-addfb.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-3/igt@kms_color@deep-color.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-7/igt@kms_color@deep-color.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-edp-1-ctm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-3/igt@kms_color@deep-color@pipe-a-edp-1-ctm.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-7/igt@kms_color@deep-color@pipe-a-edp-1-ctm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_lease@lease-invalid-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_lease@lease-invalid-crtc.html">PASS</a> +65 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@multimaster-lease:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-6/igt@kms_lease@multimaster-lease.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-2/igt@kms_lease@multimaster-lease.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_rotation_crc@multiplane-rotation.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2870">Intel XE#2870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_rotation_crc@multiplane-rotation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-7/igt@kms_vblank@wait-forked-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-1/igt@kms_vblank@wait-forked-busy-hang.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@xe_exec_balancer@twice-virtual-basic.html">PASS</a> +119 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320">Intel XE#3320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-lnl-7/igt@xe_pm@d3hot-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-lnl-2/igt@xe_pm@d3hot-multiple-execs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-2/igt@kms_plane_lowres@tiling-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-6/igt@kms_plane_lowres@tiling-y.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325">Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@xe_eudebug@attach-debug-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_eudebug@attach-debug-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-463/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-432/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_pm@s4-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea/shard-dg2-463/igt@xe_tlb@basic-tlb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922">Intel XE#2922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140943v1/shard-dg2-434/igt@xe_tlb@basic-tlb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea -&gt; xe-pw-140943v1</li>
</ul>
<p>IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea: 0f5cd39d188cbedacf9e764749b65a328d33c8ea<br />
  xe-pw-140943v1: 140943v1</p>

</body>
</html>

--===============4383376802920245954==--
