Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6FDD43346
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 11:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5450010E805;
	Thu,  7 Nov 2024 11:08:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F31C10E805;
 Thu,  7 Nov 2024 11:08:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9026906652869440678=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/display=3A_convert_dis?=
 =?utf-8?q?play_feature_helpers_to_struct_intel=5Fdisplay_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 11:08:05 -0000
Message-ID: <173097768544.1421724.15032249070854310163@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1730740629.git.jani.nikula@intel.com>
In-Reply-To: <cover.1730740629.git.jani.nikula@intel.com>
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

--===============9026906652869440678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: convert display feature helpers to struct intel_display (rev3)
URL   : https://patchwork.freedesktop.org/series/140887/
State : failure

== Summary ==

CI Bug Log - changes from xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541_full -> xe-pw-140887v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140887v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140887v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140887v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_content_protection@legacy@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-5.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-lnl:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-1/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html

  
Known issues
------------

  Here are the changes found in xe-pw-140887v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6] ([Intel XE#3130] / [Intel XE#3249])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@core_setmaster@master-drop-set-root.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [PASS][7] -> [SKIP][8] ([Intel XE#2134])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@fbdev@unaligned-write.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@fbdev@unaligned-write.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][9] -> [DMESG-FAIL][10] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3194])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][11] -> [DMESG-FAIL][12] ([Intel XE#1033] / [Intel XE#1727]) +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#1701]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][15] ([Intel XE#1426])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2890]) +38 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#3106])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#619])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1467])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1512])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#787]) +114 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#1195])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1152]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#306])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#306])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2325])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#373]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#373])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2252]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#3304])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#1178])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][39] ([Intel XE#1188]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-adlp:         [PASS][40] -> [TIMEOUT][41] ([Intel XE#1033] / [Intel XE#1727]) +2 other tests timeout
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1424]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][43] -> [SKIP][44] ([Intel XE#2423] / [i915#2575]) +32 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [PASS][45] -> [DMESG-WARN][46] ([Intel XE#877])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][47] -> [FAIL][48] ([Intel XE#1475])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1508])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#2351] / [Intel XE#2890]) +12 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#701])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2374])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1421]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][54] -> [FAIL][55] ([Intel XE#301]) +4 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#2423] / [i915#2575]) +31 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [PASS][57] -> [FAIL][58] ([Intel XE#886]) +2 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][59] ([Intel XE#301]) +14 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][60] -> [INCOMPLETE][61] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     [PASS][62] -> [INCOMPLETE][63] ([Intel XE#1195] / [Intel XE#2597])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][64] ([Intel XE#2635])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][65] ([Intel XE#1195])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [PASS][66] -> [SKIP][67] ([Intel XE#2351] / [Intel XE#2890]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1397] / [Intel XE#1745])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1397])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#455]) +8 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2311])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#651]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#656]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#651]) +10 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#2890]) +8 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [FAIL][77] ([Intel XE#2333]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2313]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#653]) +7 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][80] ([Intel XE#3312])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-6/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [PASS][81] -> [FAIL][82] ([Intel XE#1471] / [Intel XE#1874])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-1/igt@kms_plane_cursor@primary.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-3/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:
    - shard-lnl:          [PASS][83] -> [FAIL][84] ([Intel XE#1471])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-1/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-3/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][85] ([Intel XE#616]) +2 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#2763]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2763] / [Intel XE#455])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#2763]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2763]) +9 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2446]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][91] -> [SKIP][92] ([Intel XE#2446])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-adlp:         [PASS][93] -> [DMESG-WARN][94] ([Intel XE#2953] / [Intel XE#3086])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-9/igt@kms_pm_rpm@universal-planes-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-3/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1489])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#2893])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#1489])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1122])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2234] / [Intel XE#2850])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1406])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_psr@pr-no-drrs.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2330])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1437])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][104] -> [FAIL][105] ([Intel XE#899]) +1 other test fail
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1280] / [Intel XE#455])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#2905]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@discovery-empty:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2905]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2905])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#688])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [PASS][111] -> [TIMEOUT][112] ([Intel XE#1473])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1392]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2322])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-rebind:
    - shard-dg2-set2:     [PASS][115] -> [SKIP][116] ([Intel XE#1130]) +69 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [PASS][117] -> [FAIL][118] ([Intel XE#1630]) +1 other test fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-bmg:          [PASS][119] -> [FAIL][120] ([Intel XE#1630])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#288]) +6 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1130]) +54 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2360])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][124] ([Intel XE#2249])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-7/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2541]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1337])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][127] ([Intel XE#1173])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][128] -> [ABORT][129] ([Intel XE#1694] / [Intel XE#1794])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#584])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][131] -> [ABORT][132] ([Intel XE#1358] / [Intel XE#1607])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-3/igt@xe_pm@s4-basic.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     [PASS][133] -> [ABORT][134] ([Intel XE#1794])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-433/igt@xe_pm@s4-mocs.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-432/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#944])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#3342])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@core_getclient:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#2423]) -> [PASS][138] +1 other test pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@core_getclient.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@core_getclient.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#2423] / [i915#2575]) -> [PASS][140] +54 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][141] ([Intel XE#877]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-adlp:         [FAIL][143] ([Intel XE#1475]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_draw_crc@fill-fb:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][146] +6 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_draw_crc@fill-fb.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][147] ([Intel XE#2882]) -> [PASS][148] +2 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-7/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [ABORT][149] ([Intel XE#2625]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [ABORT][151] -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          [FAIL][153] ([Intel XE#301]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][155] ([Intel XE#886]) -> [PASS][156] +5 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#2890]) -> [PASS][158] +20 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#455]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
    - shard-bmg:          [SKIP][161] ([Intel XE#1503]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_multiple@tiling-x:
    - shard-adlp:         [DMESG-WARN][163] ([Intel XE#3086]) -> [PASS][164] +3 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-9/igt@kms_plane_multiple@tiling-x.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-3/igt@kms_plane_multiple@tiling-x.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][165] ([Intel XE#1430]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#2446]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-lnl:          [DMESG-WARN][169] ([Intel XE#2055]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-180.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][171] ([Intel XE#2883]) -> [PASS][172] +2 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][173] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1130]) -> [PASS][176] +118 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
    - shard-bmg:          [FAIL][177] ([Intel XE#1630]) -> [PASS][178] +2 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
    - shard-lnl:          [FAIL][179] ([Intel XE#1630]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0:
    - shard-bmg:          [INCOMPLETE][181] -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-2/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][183] ([Intel XE#2998]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][185] ([Intel XE#2136]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_module_load@reload.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_module_load@reload.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][187] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-dg2-set2:     [ABORT][189] ([Intel XE#3363]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@xe_pm_residency@cpg-basic.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_pm_residency@cpg-basic.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2423] / [i915#2575]) -> [SKIP][192] ([Intel XE#873])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#2423] / [i915#2575]) -> [FAIL][194] ([Intel XE#1426])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][196] ([Intel XE#316]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#2890]) -> [SKIP][198] ([Intel XE#316]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][199] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][200] ([Intel XE#3194])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2890]) -> [SKIP][202] ([Intel XE#610])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2890]) -> [SKIP][204] ([Intel XE#1124]) +4 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][205] ([Intel XE#3194]) -> [FAIL][206] ([Intel XE#1231] / [Intel XE#1242] / [Intel XE#3052])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][207] ([Intel XE#1231] / [Intel XE#1242]) -> [TIMEOUT][208] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][210] ([Intel XE#1124]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1124]) -> [SKIP][212] ([Intel XE#2890]) +3 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1124]) -> [SKIP][214] ([Intel XE#2351] / [Intel XE#2890])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#367]) -> [SKIP][216] ([Intel XE#2423] / [i915#2575])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2191]) -> [SKIP][218] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2423] / [i915#2575]) -> [SKIP][220] ([Intel XE#367]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][222] ([Intel XE#2890]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2890]) -> [SKIP][224] ([Intel XE#2907]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][225] ([Intel XE#1195] / [Intel XE#1727]) -> [INCOMPLETE][226] ([Intel XE#1195] / [Intel XE#2692])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2890]) -> [SKIP][228] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][230] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#306]) -> [SKIP][232] ([Intel XE#2423] / [i915#2575])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_chamelium_color@ctm-green-to-red.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2423] / [i915#2575]) -> [SKIP][234] ([Intel XE#306])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#373]) -> [SKIP][236] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2423] / [i915#2575]) -> [SKIP][238] ([Intel XE#373]) +5 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][239] ([Intel XE#1178]) -> [SKIP][240] ([Intel XE#2423] / [i915#2575])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2423] / [i915#2575]) -> [FAIL][242] ([Intel XE#1178]) +2 other tests fail
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#455]) -> [SKIP][244] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_content_protection@lic-type-1.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2423] / [i915#2575]) -> [SKIP][246] ([Intel XE#308]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#308]) -> [SKIP][248] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2423] / [i915#2575]) -> [SKIP][250] ([Intel XE#323]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1138]) -> [SKIP][252] ([Intel XE#2423] / [i915#2575])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][253] ([Intel XE#301]) -> [SKIP][254] ([Intel XE#2423] / [i915#2575])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2423] / [i915#2575]) -> [FAIL][256] ([Intel XE#301]) +1 other test fail
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][258] ([Intel XE#1195] / [Intel XE#2049])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][260] ([Intel XE#455]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#455]) -> [SKIP][262] ([Intel XE#2351] / [Intel XE#2890])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2890]) -> [SKIP][264] ([Intel XE#455]) +4 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2423] / [i915#2575]) -> [SKIP][266] ([i915#5274])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2890]) -> [SKIP][268] ([Intel XE#651]) +14 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][270] ([Intel XE#651]) +7 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#658]) -> [SKIP][272] ([Intel XE#2351] / [Intel XE#2890])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#651]) -> [SKIP][274] ([Intel XE#2890]) +12 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#653]) -> [SKIP][276] ([Intel XE#2890]) +9 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][278] ([Intel XE#653]) +6 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#653]) -> [SKIP][280] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2890]) -> [SKIP][282] ([Intel XE#653]) +14 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     [FAIL][283] ([Intel XE#3312]) -> [SKIP][284] ([Intel XE#2423] / [i915#2575])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_hdr@brightness-with-hdr.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2-set2:     [ABORT][285] ([Intel XE#2625]) -> [SKIP][286] ([Intel XE#2423] / [i915#2575])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_hdr@static-toggle-suspend.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#346]) -> [SKIP][288] ([Intel XE#2890])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2890]) -> [SKIP][290] ([Intel XE#346])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2423] / [i915#2575]) -> [FAIL][292] ([Intel XE#616])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_plane_cursor@primary.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2423] / [i915#2575]) -> [SKIP][294] ([Intel XE#2763] / [Intel XE#455])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][296] ([Intel XE#2423] / [i915#2575])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2938]) -> [SKIP][298] ([Intel XE#2890])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2890]) -> [SKIP][300] ([Intel XE#1129])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#908]) -> [SKIP][302] ([Intel XE#2890])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1489]) -> [SKIP][304] ([Intel XE#2890]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2890]) -> [SKIP][306] ([Intel XE#1489]) +7 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][308] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2890]) -> [SKIP][310] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][312] ([Intel XE#2850] / [Intel XE#929])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_psr@pr-dpms.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][314] ([Intel XE#2890]) +3 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-onoff.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2423] / [i915#2575]) -> [SKIP][316] ([Intel XE#1127])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2423] / [i915#2575]) -> [SKIP][318] ([Intel XE#327]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#1127]) -> [SKIP][320] ([Intel XE#2423] / [i915#2575])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#330]) -> [SKIP][322] ([Intel XE#2423] / [i915#2575])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-suspend:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2423] / [i915#2575]) -> [SKIP][324] ([Intel XE#455]) +5 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_vrr@flip-suspend.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#756]) -> [SKIP][326] ([Intel XE#2423] / [i915#2575])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#1130]) -> [SKIP][328] ([Intel XE#1280] / [Intel XE#455])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#1130]) -> [SKIP][330] ([Intel XE#1123])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1130]) -> [SKIP][332] ([Intel XE#2905]) +7 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-432/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2905]) -> [SKIP][334] ([Intel XE#1130]) +4 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@xe_eudebug@sysfs-toggle.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][335] ([Intel XE#1600]) -> [SKIP][336] ([Intel XE#1130])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-adlp:         [SKIP][337] ([Intel XE#1392]) -> [TIMEOUT][338] ([Intel XE#1033] / [Intel XE#1727])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#288]) -> [SKIP][340] ([Intel XE#1130]) +11 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1130]) -> [SKIP][342] ([Intel XE#288]) +20 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#2541]) -> [SKIP][344] ([Intel XE#1130]) +2 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#1130]) -> [SKIP][346] ([Intel XE#2541]) +5 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_oa@syncs-ufence-wait-cfg.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1130]) -> [SKIP][348] ([Intel XE#2839] / [Intel XE#977])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#1061]) -> [FAIL][350] ([Intel XE#1173])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_peer2peer@write.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@xe_peer2peer@write.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1130]) -> [ABORT][352] ([Intel XE#1358])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     [ABORT][353] ([Intel XE#1694]) -> [SKIP][354] ([Intel XE#1130])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#1130]) -> [SKIP][356] ([Intel XE#944]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3363]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3363
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
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

  * Linux: xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541 -> xe-pw-140887v3

  IGT_8099: 27be46dee80b6b0de80f9fa3cd9bb5f55edccaf8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541: e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541
  xe-pw-140887v3: 140887v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/index.html

--===============9026906652869440678==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: convert display feature helpers to struct intel_display (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140887/">https://patchwork.freedesktop.org/series/140887/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541_full -&gt; xe-pw-140887v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140887v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140887v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140887v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-5.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-1/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140887v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130">Intel XE#3130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106">Intel XE#3106</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-6/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312">Intel XE#3312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-1/igt@kms_plane_cursor@primary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-3/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-1/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-3/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-9/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-3/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@xe_eudebug@basic-connect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-7/igt@xe_oa@mmio-triggered-reports@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@xe_pm@s3-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-3/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-433/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-432/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@core_getclient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@core_getclient.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> +54 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@fill-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_draw_crc@fill-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_draw_crc@fill-fb.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-7/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-9/igt@kms_plane_multiple@tiling-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-3/igt@kms_plane_multiple@tiling-x.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">PASS</a> +118 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-2/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@xe_pm_residency@cpg-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3363">Intel XE#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_pm_residency@cpg-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_flip@plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_flip@plain-flip-ts-check-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_hdr@brightness-with-hdr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312">Intel XE#3312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_hdr@static-toggle-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_plane_cursor@primary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-432/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@sysfs-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@xe_eudebug@sysfs-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_eudebug@sysfs-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-userptr.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140887v3/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541 -&gt; xe-pw-140887v3</li>
</ul>
<p>IGT_8099: 27be46dee80b6b0de80f9fa3cd9bb5f55edccaf8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2174-e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541: e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541<br />
  xe-pw-140887v3: 140887v3</p>

</body>
</html>

--===============9026906652869440678==--
