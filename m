Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0348AC0218D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 00:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AFF10E1FD;
	Thu, 30 Jan 2025 00:24:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB33310E1FD;
 Thu, 30 Jan 2025 00:24:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6498497749677418153=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915=3A_DP_and_DP_MST_?=
 =?utf-8?q?cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jan 2025 00:24:16 -0000
Message-ID: <173819665667.2640361.16272456074520579253@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1738161945.git.jani.nikula@intel.com>
In-Reply-To: <cover.1738161945.git.jani.nikula@intel.com>
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

--===============6498497749677418153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: DP and DP MST cleanups
URL   : https://patchwork.freedesktop.org/series/144106/
State : failure

== Summary ==

CI Bug Log - changes from xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15_full -> xe-pw-144106v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144106v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144106v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144106v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][1] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@xe_vm@large-userptr-misaligned-binds-16777216:
    - shard-adlp:         [PASS][2] -> [DMESG-WARN][3] +1 other test dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-2/igt@xe_vm@large-userptr-misaligned-binds-16777216.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-3/igt@xe_vm@large-userptr-misaligned-binds-16777216.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][4] ([Intel XE#2136]) -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][6] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html

  
Known issues
------------

  Here are the changes found in xe-pw-144106v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getclient:
    - shard-dg2-set2:     [PASS][8] -> [SKIP][9] ([Intel XE#2423])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@core_getclient.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@core_getclient.html

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2136]) +18 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@core_hotunplug@hotreplug.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#3453])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@core_setmaster@master-drop-set-shared-fd.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@core_setmaster@master-drop-set-shared-fd.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#3453])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@info:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2134]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@fbdev@info.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@fbdev@info.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#2134])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@fbdev@write.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@fbdev@write.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2423]) +73 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#3767]) +15 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1124])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][23] ([Intel XE#1033])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][24] -> [DMESG-FAIL][25] ([Intel XE#1033]) +1 other test dmesg-fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#367])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][28] ([Intel XE#1033]) +5 other tests dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#787]) +132 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#787]) +5 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][31] ([Intel XE#3862])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][33] ([Intel XE#4010])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2423]) +35 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#373]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_color@invalid-gamma-lut-sizes@pipe-d:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][36] ([Intel XE#4172]) +1 other test dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_color@invalid-gamma-lut-sizes@pipe-d.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#1178])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#3304])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#2423] / [i915#2575]) +41 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][40] -> [DMESG-WARN][41] ([Intel XE#4172]) +7 other tests dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#309])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#2291]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1340])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([i915#3804])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][47] -> [FAIL][48] ([Intel XE#3321]) +4 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2316])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#310])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][52] ([Intel XE#2049]) +1 other test incomplete
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#301]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][55] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][56] ([Intel XE#2882]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_flip@plain-flip-fb-recreate@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#2136]) +30 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2380])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2293]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#455]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#651])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2136] / [Intel XE#2351]) +20 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1151])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#653])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#656]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#2136]) +50 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#455])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][71] -> [SKIP][72] ([Intel XE#455])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#3012])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#2423] / [i915#2575]) +83 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_lease@lease-invalid-crtc.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [PASS][77] -> [DMESG-WARN][78] ([Intel XE#4173]) +2 other tests dmesg-warn
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][79] ([Intel XE#616]) +2 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2763]) +7 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#2763]) +8 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#836])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2446])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#2446]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2446]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [PASS][88] -> [SKIP][89] ([Intel XE#2446]) +7 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_pm_rpm@universal-planes.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1489]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@pr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2136]) +54 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#1435])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1126])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-client:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#2905])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_eudebug@basic-client.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [PASS][97] -> [SKIP][98] ([Intel XE#1130]) +161 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][99] -> [SKIP][100] ([Intel XE#1130]) +166 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1392]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-dg2-set2:     [PASS][102] -> [SKIP][103] ([Intel XE#1392]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_compute_mode:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][104] ([Intel XE#2594])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@xe_exec_compute_mode.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#288]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2229]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#1192]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@xe_live_ktest@xe_mocs.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#378])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_module_load@force-load.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          NOTRUN -> [FAIL][110] ([Intel XE#3546]) +1 other test fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [PASS][111] -> [ABORT][112] ([Intel XE#1358] / [Intel XE#1794])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_pm@s2idle-mocs.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [PASS][113] -> [ABORT][114] ([Intel XE#1358])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@xe_pm@s3-exec-after.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][115] -> [ABORT][116] ([Intel XE#1358] / [Intel XE#1607])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][117] -> [ABORT][118] ([Intel XE#1358] / [Intel XE#1794])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-6/igt@xe_pm@s4-vm-bind-userptr.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-engines:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#944])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_query@multigpu-query-engines.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#1130]) +65 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_spin_batch@spin-all.html

  * igt@xe_vm@mmap-style-bind-userptr-one-partial:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1130]) +76 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_vm@mmap-style-bind-userptr-one-partial.html

  
#### Possible fixes ####

  * igt@core_getstats:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#2423]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@core_getstats.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@core_getstats.html

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][124] ([Intel XE#3440]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@core_getversion@all-cards.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-463/igt@core_getversion@all-cards.html
    - shard-bmg:          [FAIL][126] ([Intel XE#3249]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@core_getversion@all-cards.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@core_getversion@all-cards.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [FAIL][128] ([Intel XE#3249]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@core_setmaster@master-drop-set-user.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#2134]) -> [PASS][131] +2 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@fbdev@info.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@fbdev@info.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#2423] / [i915#2575]) -> [PASS][133] +120 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][135] +17 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_color@invalid-gamma-lut-sizes:
    - shard-adlp:         [DMESG-WARN][136] -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@kms_color@invalid-gamma-lut-sizes.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-6/igt@kms_color@invalid-gamma-lut-sizes.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-bmg:          [INCOMPLETE][138] ([Intel XE#3226]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][140] ([Intel XE#2291]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][142] ([Intel XE#2316]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][144] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][145] +2 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#2136]) -> [PASS][147] +27 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][148] ([Intel XE#1503]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [SKIP][150] ([Intel XE#2423]) -> [PASS][151] +95 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-bmg:          [SKIP][152] ([Intel XE#2136]) -> [PASS][153] +17 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_dc@dc5-dpms-negative.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [SKIP][154] ([Intel XE#2446]) -> [PASS][155] +2 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_rpm@cursor.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#2446]) -> [PASS][157] +3 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][158] ([Intel XE#2883]) -> [PASS][159] +2 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_setmode@basic.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-8/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][160] ([Intel XE#899]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1130]) -> [PASS][163] +213 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_exec_balancer@once-parallel-rebind.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][164] ([Intel XE#4172]) -> [PASS][165] +12 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-adlp:         [DMESG-WARN][166] ([Intel XE#4173]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([SKIP][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193]) ([Intel XE#378]) -> ([PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-6/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-3/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-3/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-3/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-2/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-2/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-2/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-2/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-6/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-6/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-8/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-8/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-6/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-6/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-8/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-9/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-6/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-9/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-3/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-2/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-8/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-4/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-4/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-4/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-4/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-3/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-3/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-3/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-3/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-3/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-8/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-8/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-8/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-8/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-9/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-9/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-9/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-9/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-6/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-6/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-6/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-6/igt@xe_module_load@load.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][219] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [DMESG-WARN][221] ([Intel XE#2953]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][223] ([Intel XE#1130]) -> [PASS][224] +199 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2136]) -> [DMESG-WARN][226] ([Intel XE#1033]) +1 other test dmesg-warn
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#623]) -> [SKIP][228] ([Intel XE#2423] / [i915#2575])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][229] ([Intel XE#2423]) -> [SKIP][230] ([Intel XE#873])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][231] ([Intel XE#2423]) -> [SKIP][232] ([Intel XE#2370])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][234] ([Intel XE#316])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2136]) -> [SKIP][236] ([Intel XE#316]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#316]) -> [SKIP][238] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][239] ([Intel XE#2136]) -> [SKIP][240] ([Intel XE#2327]) +4 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#316]) -> [SKIP][242] ([Intel XE#2136]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1124]) -> [SKIP][244] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#610]) -> [SKIP][246] ([Intel XE#2136])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][248] ([Intel XE#1124]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][249] ([Intel XE#2136]) -> [SKIP][250] ([Intel XE#1124]) +11 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2136]) -> [SKIP][252] ([Intel XE#1124]) +10 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][253] ([Intel XE#2328]) -> [SKIP][254] ([Intel XE#2136])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][256] ([Intel XE#619])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][257] ([Intel XE#2136]) -> [SKIP][258] ([Intel XE#610])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1124]) -> [SKIP][260] ([Intel XE#2136]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][261] ([Intel XE#1124]) -> [SKIP][262] ([Intel XE#2136]) +9 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2423] / [i915#2575]) -> [SKIP][264] ([Intel XE#2191]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2191]) -> [SKIP][266] ([Intel XE#2423] / [i915#2575])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][267] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][268] ([Intel XE#2423]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2423] / [i915#2575]) -> [SKIP][270] ([Intel XE#367]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          [SKIP][271] ([Intel XE#2423]) -> [SKIP][272] ([Intel XE#367]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#367]) -> [SKIP][274] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
    - shard-bmg:          [SKIP][275] ([Intel XE#367]) -> [SKIP][276] ([Intel XE#2423]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][278] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2136] / [Intel XE#2351]) -> [DMESG-WARN][280] ([Intel XE#1033])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][281] ([Intel XE#2887]) -> [SKIP][282] ([Intel XE#2136]) +12 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][284] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2907]) -> [SKIP][286] ([Intel XE#2136])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2136]) -> [INCOMPLETE][288] ([Intel XE#3862])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#3442]) -> [SKIP][290] ([Intel XE#2136])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][291] ([Intel XE#2136]) -> [SKIP][292] ([Intel XE#3432]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][293] ([Intel XE#3432]) -> [SKIP][294] ([Intel XE#2136]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][295] ([Intel XE#2136]) -> [SKIP][296] ([Intel XE#2887]) +18 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][298] ([Intel XE#2136]) +9 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][299] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) -> [SKIP][300] ([Intel XE#2136] / [Intel XE#2351])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2136]) -> [INCOMPLETE][302] ([Intel XE#2692] / [Intel XE#4010])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][303] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][304] ([Intel XE#2136])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2136]) -> [SKIP][306] ([Intel XE#2907])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2136]) -> [SKIP][308] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][309] ([Intel XE#2325]) -> [SKIP][310] ([Intel XE#2423]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2423] / [i915#2575]) -> [SKIP][312] ([Intel XE#306]) +2 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#306]) -> [SKIP][314] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_chamelium_color@ctm-negative.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][315] ([Intel XE#2423]) -> [SKIP][316] ([Intel XE#2325]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_chamelium_color@gamma.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][317] ([Intel XE#2252]) -> [SKIP][318] ([Intel XE#2423]) +8 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][319] ([Intel XE#2423]) -> [SKIP][320] ([Intel XE#2252]) +10 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#373]) -> [SKIP][322] ([Intel XE#2423] / [i915#2575]) +9 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2423] / [i915#2575]) -> [SKIP][324] ([Intel XE#373]) +14 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@ctm-negative:
    - shard-bmg:          [DMESG-WARN][325] ([Intel XE#877]) -> [SKIP][326] ([Intel XE#2423])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_color@ctm-negative.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_color@ctm-negative.html

  * igt@kms_color@invalid-gamma-lut-sizes:
    - shard-bmg:          [SKIP][327] ([Intel XE#2423]) -> [DMESG-WARN][328] ([Intel XE#4172]) +1 other test dmesg-warn
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_color@invalid-gamma-lut-sizes.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_color@invalid-gamma-lut-sizes.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][329] ([Intel XE#1178]) -> [SKIP][330] ([Intel XE#2341])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_content_protection@atomic.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][331] ([Intel XE#1178]) -> [SKIP][332] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html
    - shard-bmg:          [FAIL][333] ([Intel XE#1178]) -> [SKIP][334] ([Intel XE#2423])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][335] ([Intel XE#2423]) -> [SKIP][336] ([Intel XE#2341])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_content_protection@content-type-change.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#307]) -> [SKIP][338] ([Intel XE#2423] / [i915#2575])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-bmg:          [SKIP][339] ([Intel XE#2390]) -> [SKIP][340] ([Intel XE#2423])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][341] ([Intel XE#2423]) -> [SKIP][342] ([Intel XE#2390])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#2423] / [i915#2575]) -> [SKIP][344] ([Intel XE#307])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][345] ([Intel XE#2423]) -> [FAIL][346] ([Intel XE#1178])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_content_protection@legacy.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2423] / [i915#2575]) -> [FAIL][348] ([Intel XE#1178])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_content_protection@lic-type-0.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#455]) -> [SKIP][350] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_content_protection@lic-type-1.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][351] ([Intel XE#2423]) -> [SKIP][352] ([Intel XE#2320]) +6 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][353] ([Intel XE#2320]) -> [SKIP][354] ([Intel XE#2423]) +5 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2423] / [i915#2575]) -> [SKIP][356] ([Intel XE#308]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-bmg:          [SKIP][357] ([Intel XE#2321]) -> [SKIP][358] ([Intel XE#2423])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][359] ([Intel XE#2423]) -> [SKIP][360] ([Intel XE#2321]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          [SKIP][361] ([Intel XE#2286]) -> [SKIP][362] ([Intel XE#2423])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][363] ([Intel XE#2423]) -> [SKIP][364] ([Intel XE#2286]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#323]) -> [SKIP][366] ([Intel XE#2423] / [i915#2575])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][367] ([Intel XE#1508]) -> [SKIP][368] ([Intel XE#2136]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][369] ([Intel XE#2136]) -> [SKIP][370] ([Intel XE#2244]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][371] ([Intel XE#4156]) -> [SKIP][372] ([Intel XE#2136])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][373] ([Intel XE#2423]) -> [SKIP][374] ([Intel XE#2372])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_feature_discovery@chamelium.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#2423] / [i915#2575]) -> [SKIP][376] ([Intel XE#1137])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][377] ([Intel XE#2423]) -> [SKIP][378] ([Intel XE#2374])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_feature_discovery@psr2.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#2423] / [i915#2575]) -> [SKIP][380] ([Intel XE#1135])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_feature_discovery@psr2.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [DMESG-WARN][381] ([Intel XE#4172]) -> [SKIP][382] ([Intel XE#2316])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [INCOMPLETE][383] ([Intel XE#2049]) -> [SKIP][384] ([Intel XE#2423])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][386] ([Intel XE#2049]) +1 other test incomplete
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][388] ([Intel XE#1033]) +3 other tests dmesg-warn
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [SKIP][389] ([Intel XE#2423]) -> [INCOMPLETE][390] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][391] ([Intel XE#2423]) -> [FAIL][392] ([Intel XE#2882])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_flip@plain-flip-fb-recreate.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#455]) -> [SKIP][394] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][395] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][396] ([Intel XE#2136]) +2 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][398] ([Intel XE#455]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][399] ([Intel XE#2136]) -> [SKIP][400] ([Intel XE#2380])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][401] ([Intel XE#2136]) -> [SKIP][402] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#2136]) -> [SKIP][404] ([Intel XE#455]) +5 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#455]) -> [SKIP][406] ([Intel XE#2136]) +3 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#651]) -> [SKIP][408] ([Intel XE#2136]) +22 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][409] ([Intel XE#2311]) -> [SKIP][410] ([Intel XE#2312]) +7 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#2136]) -> [SKIP][412] ([Intel XE#651]) +20 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][413] ([Intel XE#2312]) -> [SKIP][414] ([Intel XE#2311]) +3 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][416] ([Intel XE#651]) +15 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][417] ([Intel XE#4141]) -> [SKIP][418] ([Intel XE#2312]) +3 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [DMESG-WARN][419] ([Intel XE#1033]) -> [SKIP][420] ([Intel XE#2136]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][421] ([Intel XE#4141]) -> [SKIP][422] ([Intel XE#2136]) +12 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [DMESG-WARN][423] ([Intel XE#1033]) -> [SKIP][424] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][425] ([Intel XE#2312]) -> [SKIP][426] ([Intel XE#4141]) +2 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][427] ([Intel XE#2136]) -> [SKIP][428] ([Intel XE#4141]) +15 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][429] ([Intel XE#2311]) -> [SKIP][430] ([Intel XE#2136]) +24 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#651]) -> [SKIP][432] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][433] ([Intel XE#2136]) -> [SKIP][434] ([Intel XE#2311]) +31 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#653]) -> [SKIP][436] ([Intel XE#2136]) +21 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][437] ([Intel XE#2312]) -> [SKIP][438] ([Intel XE#2313]) +3 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][439] ([Intel XE#2313]) -> [SKIP][440] ([Intel XE#2136]) +27 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][442] ([Intel XE#653]) +8 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][443] ([Intel XE#2313]) -> [SKIP][444] ([Intel XE#2312]) +7 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#2136]) -> [SKIP][446] ([Intel XE#1158])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          [SKIP][447] ([Intel XE#2136]) -> [SKIP][448] ([Intel XE#2350])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#2136]) -> [SKIP][450] ([Intel XE#653]) +27 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#653]) -> [SKIP][452] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][453] ([Intel XE#2136]) -> [SKIP][454] ([Intel XE#2313]) +29 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][455] ([Intel XE#2502]) -> [SKIP][456] ([Intel XE#2423])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_getfb@getfb-reject-ccs.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][457] ([Intel XE#2136]) -> [SKIP][458] ([Intel XE#2934])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#2925]) -> [SKIP][460] ([Intel XE#2136])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][461] ([Intel XE#2423]) -> [SKIP][462] ([Intel XE#2501])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][463] ([Intel XE#2423]) -> [SKIP][464] ([Intel XE#2486])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [DMESG-WARN][465] ([Intel XE#4172]) -> [SKIP][466] ([Intel XE#2423])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
    - shard-dg2-set2:     [DMESG-WARN][467] ([Intel XE#1033]) -> [SKIP][468] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][469] ([Intel XE#2423]) -> [SKIP][470] ([Intel XE#2393])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][472] ([Intel XE#2423] / [i915#2575])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][473] ([Intel XE#2423]) -> [SKIP][474] ([Intel XE#2763]) +1 other test skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#2423] / [i915#2575]) -> [SKIP][476] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-bmg:          [SKIP][477] ([Intel XE#2763]) -> [SKIP][478] ([Intel XE#2423]) +2 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][479] ([Intel XE#2136]) -> [SKIP][480] ([Intel XE#870])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#2938]) -> [SKIP][482] ([Intel XE#2136])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#2136]) -> [SKIP][484] ([Intel XE#870])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#870]) -> [SKIP][486] ([Intel XE#2136]) +1 other test skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-bmg:          [SKIP][487] ([Intel XE#870]) -> [SKIP][488] ([Intel XE#2136])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][489] ([Intel XE#2136]) -> [SKIP][490] ([Intel XE#2391])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#2136]) -> [SKIP][492] ([Intel XE#3309])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          [SKIP][493] ([Intel XE#3309]) -> [SKIP][494] ([Intel XE#2136])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][496] ([Intel XE#1129])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][497] ([Intel XE#2505]) -> [SKIP][498] ([Intel XE#2136])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#2136]) -> [SKIP][500] ([Intel XE#908])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][501] ([Intel XE#2446]) -> [SKIP][502] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#2446]) -> [DMESG-WARN][504] ([Intel XE#1033] / [Intel XE#2042])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#2136]) -> [SKIP][506] ([Intel XE#1489]) +14 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][507] ([Intel XE#2136]) -> [SKIP][508] ([Intel XE#1489]) +8 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#1489]) -> [SKIP][510] ([Intel XE#2136]) +5 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][511] ([Intel XE#1489]) -> [SKIP][512] ([Intel XE#2136]) +7 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][513] ([Intel XE#2136]) -> [SKIP][514] ([Intel XE#2387])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#2136]) -> [SKIP][516] ([Intel XE#1122])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][517] ([Intel XE#2136]) -> [SKIP][518] ([Intel XE#2234] / [Intel XE#2850]) +15 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][520] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][522] ([Intel XE#2136]) +10 other tests skip
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#2136]) -> [SKIP][524] ([Intel XE#2850] / [Intel XE#929]) +12 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][525] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][526] ([Intel XE#2136]) +11 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_psr@psr-basic.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][528] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_psr@psr-dpms.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][529] ([Intel XE#2136]) -> [SKIP][530] ([Intel XE#2234])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr@psr2-primary-render.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][531] ([Intel XE#2414]) -> [SKIP][532] ([Intel XE#2136])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#2939]) -> [SKIP][534] ([Intel XE#2136] / [Intel XE#2351])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][535] ([Intel XE#2136]) -> [SKIP][536] ([Intel XE#2414])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#2423] / [i915#2575]) -> [SKIP][538] ([Intel XE#3414]) +1 other test skip
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][539] ([Intel XE#2330]) -> [SKIP][540] ([Intel XE#2423])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#2423] / [i915#2575]) -> [SKIP][542] ([Intel XE#1127])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#1127]) -> [SKIP][544] ([Intel XE#2423] / [i915#2575])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][545] ([Intel XE#2423]) -> [SKIP][546] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][547] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][548] ([Intel XE#2423])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#3414]) -> [SKIP][550] ([Intel XE#2423] / [i915#2575])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][551] ([Intel XE#2423]) -> [SKIP][552] ([Intel XE#2413]) +1 other test skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          [SKIP][553] ([Intel XE#2413]) -> [SKIP][554] ([Intel XE#2423])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-none.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][555] ([Intel XE#1435]) -> [SKIP][556] ([Intel XE#2423])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][557] ([Intel XE#2423]) -> [SKIP][558] ([Intel XE#1435])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][559] ([Intel XE#2426]) -> [SKIP][560] ([Intel XE#2423])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#2423] / [i915#2575]) -> [FAIL][562] ([Intel XE#1729])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][563] ([Intel XE#2423]) -> [SKIP][564] ([Intel XE#2450])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][565] ([Intel XE#2423] / [i915#2575]) -> [SKIP][566] ([Intel XE#2168])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_vrr@cmrr.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][567] ([Intel XE#1499]) -> [SKIP][568] ([Intel XE#2423]) +1 other test skip
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_vrr@flip-suspend.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][569] ([Intel XE#2423] / [i915#2575]) -> [SKIP][570] ([Intel XE#455]) +13 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_vrr@flipline.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#2168]) -> [SKIP][572] ([Intel XE#2423] / [i915#2575])
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_vrr@lobf.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][573] ([Intel XE#2423]) -> [SKIP][574] ([Intel XE#1499])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_vrr@max-min.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#2423] / [i915#2575]) -> [SKIP][576] ([Intel XE#756])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          [SKIP][577] ([Intel XE#756]) -> [SKIP][578] ([Intel XE#2423])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_writeback@writeback-invalid-parameters.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-dg2-set2:     [SKIP][579] ([Intel XE#756]) -> [SKIP][580] ([Intel XE#2423] / [i915#2575])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          [SKIP][581] ([Intel XE#2423]) -> [SKIP][582] ([Intel XE#756]) +1 other test skip
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_writeback@writeback-pixel-formats.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@testdisplay:
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#2423]) -> [DMESG-WARN][584] ([Intel XE#2705])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@testdisplay.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@testdisplay.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#1123]) -> [SKIP][586] ([Intel XE#1130])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][587] ([Intel XE#1130]) -> [SKIP][588] ([Intel XE#1123]) +1 other test skip
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][589] ([Intel XE#1130]) -> [SKIP][590] ([Intel XE#1126]) +1 other test skip
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#1130]) -> [SKIP][592] ([Intel XE#2905]) +14 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#3889]) -> [SKIP][594] ([Intel XE#1130])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          [SKIP][595] ([Intel XE#1130]) -> [SKIP][596] ([Intel XE#3889]) +1 other test skip
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#1130]) -> [SKIP][598] ([Intel XE#3889])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          [SKIP][599] ([Intel XE#2905]) -> [SKIP][600] ([Intel XE#1130]) +10 other tests skip
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@xe_eudebug@discovery-empty.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#2905]) -> [SKIP][602] ([Intel XE#1130]) +13 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@resume-one:
    - shard-bmg:          [SKIP][603] ([Intel XE#1130]) -> [SKIP][604] ([Intel XE#2905]) +11 other tests skip
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_eudebug_online@resume-one.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@xe_eudebug_online@resume-one.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][605] ([Intel XE#1130]) -> [SKIP][606] ([Intel XE#2322]) +10 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][607] ([Intel XE#2322]) -> [SKIP][608] ([Intel XE#1130]) +7 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     [SKIP][609] ([Intel XE#288]) -> [SKIP][610] ([Intel XE#1130]) +21 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#1130]) -> [SKIP][612] ([Intel XE#288]) +34 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#1130]) -> [SKIP][614] ([Intel XE#2360])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][615] ([Intel XE#2360]) -> [SKIP][616] ([Intel XE#1130])
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#255]) -> [SKIP][618] ([Intel XE#1130])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_huc_copy@huc_copy.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][619] ([Intel XE#1130]) -> [SKIP][620] ([Intel XE#2459] / [Intel XE#2596])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_media_fill@media-fill.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-dg2-set2:     [SKIP][621] ([Intel XE#1130]) -> [DMESG-WARN][622] ([Intel XE#1033]) +1 other test dmesg-warn
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_mmap@pci-membarrier-parallel.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][623] ([Intel XE#1130]) -> [SKIP][624] ([Intel XE#586])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_mmap@small-bar.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@xe_mmap@small-bar.html
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#1130]) -> [SKIP][626] ([Intel XE#512])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_mmap@small-bar.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [ABORT][627] -> [FAIL][628] ([Intel XE#3546])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][629] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][630] ([Intel XE#1130]) +6 other tests skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][631] ([Intel XE#1130]) -> [SKIP][632] ([Intel XE#2541] / [Intel XE#3573]) +11 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_oa@polling-small-buf.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][633] ([Intel XE#1130]) -> [SKIP][634] ([Intel XE#2248])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_oa@unprivileged-single-ctx-counters.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][635] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][636] ([Intel XE#1130])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][637] ([Intel XE#1130]) -> [SKIP][638] ([Intel XE#2245])
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_pat@pat-index-xelp.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][639] ([Intel XE#1173]) -> [SKIP][640] ([Intel XE#1061])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_peer2peer@read.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][641] ([Intel XE#1130]) -> [SKIP][642] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][643] ([Intel XE#1130]) -> [SKIP][644] ([Intel XE#2284])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pm@d3cold-mocs.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     [SKIP][645] ([Intel XE#1130]) -> [ABORT][646] ([Intel XE#1358])
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [SKIP][647] ([Intel XE#1130]) -> [DMESG-WARN][648] ([Intel XE#1033] / [Intel XE#569])
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
    - shard-bmg:          [SKIP][649] ([Intel XE#1130]) -> [DMESG-WARN][650] ([Intel XE#4172] / [Intel XE#569])
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_pm@s3-basic-exec.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][651] ([Intel XE#2284]) -> [SKIP][652] ([Intel XE#1130]) +2 other tests skip
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-dg2-set2:     [SKIP][653] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][654] ([Intel XE#1130]) +1 other test skip
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [DMESG-WARN][655] ([Intel XE#1033] / [Intel XE#569]) -> [SKIP][656] ([Intel XE#1130])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [DMESG-WARN][657] ([Intel XE#1033]) -> [SKIP][658] ([Intel XE#1130]) +1 other test skip
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_pm@s4-basic.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_pm@s4-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][659] ([Intel XE#1130]) -> [SKIP][660] ([Intel XE#579])
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][661] ([Intel XE#1130]) -> [SKIP][662] ([Intel XE#944]) +4 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_query@multigpu-query-engines.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][663] ([Intel XE#1130]) -> [SKIP][664] ([Intel XE#944]) +2 other tests skip
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          [SKIP][665] ([Intel XE#944]) -> [SKIP][666] ([Intel XE#1130])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@xe_query@multigpu-query-invalid-query.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][667] ([Intel XE#944]) -> [SKIP][668] ([Intel XE#1130]) +1 other test skip
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-bmg:          [SKIP][669] ([Intel XE#1130]) -> [SKIP][670] ([Intel XE#4130])
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@xe_sriov_auto_provisioning@fair-allocation.html
    - shard-dg2-set2:     [SKIP][671] ([Intel XE#1130]) -> [SKIP][672] ([Intel XE#4130])
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][673] ([Intel XE#3075] / [Intel XE#3084]) -> [SKIP][674] ([Intel XE#1130])
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15 -> xe-pw-144106v1

  IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15: bdfc862a5c719d934efbdedb050ef891b9feef15
  xe-pw-144106v1: 144106v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/index.html

--===============6498497749677418153==
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
<tr><td><b>Series:</b></td><td>drm/i915: DP and DP MST cleanups</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144106/">https://patchwork.freedesktop.org/series/144106/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144106v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144106v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2570-bdfc862a5c719d934efbdedb050ef891b=
9feef15_full -&gt; xe-pw-144106v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144106v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-144106v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1441=
06v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-16777216:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-2/igt@xe_vm@l=
arge-userptr-misaligned-binds-16777216.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-3/igt@xe_vm=
@large-userptr-misaligned-binds-16777216.html">DMESG-WARN</a> +1 other test=
 dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-=
dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMESG-WARN=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pl=
ane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sh=
ard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html">DMESG-WARN</a></=
li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144106v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@core_g=
etclient.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144106v1/shard-dg2-433/igt@core_getclient.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@core_hot=
unplug@hotreplug.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@core_hotunplug@hotreplug.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@core_set=
master@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@core_setmast=
er@master-drop-set-shared-fd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@core_setmaster@master-drop-=
set-shared-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@fbdev@in=
fo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144106v1/shard-bmg-3/igt@fbdev@info.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@fbdev@=
write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-144106v1/shard-dg2-433/igt@fbdev@write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_addf=
b_basic@invalid-smem-bo-on-discrete.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_addfb=
_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +73 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_async_flips@async-flip-=
with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#37=
67</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_big_fb@4-tiled-32bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adl=
p-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1033">Intel XE#1033</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-4-=
tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4=
-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +5 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y=
-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +132 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation=
-180-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_color@invalid-gamma-lut-s=
izes@pipe-d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_content_protection@legacy=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid=
-movement-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +41 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-8/igt@kms_curs=
or_crc@cursor-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-5/igt@kms_cursor_crc@cursor-s=
uspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4172">Intel XE#4172</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs=
-flipa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard=
-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-che=
ck-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_flip@dpms-vs-vblank-rac=
e-interruptible@c-hdmi-a6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test =
incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_fl=
ip@flip-vs-expired-vblank@a-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_fli=
p@flip-vs-expired-vblank@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend-inte=
rruptible@d-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 oth=
er test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_flip@plain-flip-fb-recrea=
te@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard=
-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Inte=
l XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drr=
s-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@dr=
rs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +20 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-d=
g2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@ps=
r-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_hdr@brightness-with-hdr.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_le=
ase@lease-invalid-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_lease@lease-inva=
lid-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +83 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-2/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-3/igt@kms_pl=
ane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +=
2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_plane_scaling@planes-down=
scale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_pm_r=
pm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_pm_rpm@modeset=
-non-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp=
-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_pm=
_rpm@universal-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_pm_rpm@universal-=
planes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2446">Intel XE#2446</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-pri=
mary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@kms_psr@pr-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"=
>Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_psr@psr2-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
136">Intel XE#2136</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear=
-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_eudebug@basic-client.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@xe_exec_=
basic@many-bindexecqueue-rebind.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_exec_basic=
@many-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +161 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_exe=
c_basic@many-null-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_exec_basic@many=
-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a>) +166 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE=
#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-null.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/=
igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#=
1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@xe_exec_compute_mode.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_exec_fault_mode@many-exec=
queues-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@xe_live_=
ktest@xe_mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"=
>Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_module_load@force-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_module_load@many-reload.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3546">Intel XE#3546</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_pm@=
s2idle-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@xe_pm@s2idle-mocs.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">In=
tel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@xe_pm@=
s3-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@xe_pm@s3-exec-after.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358=
">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-lnl-1/igt@xe_pm@s4=
-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-144106v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-6/igt@xe_pm@s=
4-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-144106v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_query@multigpu-query-engi=
nes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_spin_batch@spin-all.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a>) +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-userptr-one-partial:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_vm@mmap-style-bind-userp=
tr-one-partial.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>) +76 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@core_g=
etstats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@core_getstats.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@core_g=
etversion@all-cards.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-463/igt@core_getv=
ersion@all-cards.html">PASS</a> +1 other test pass</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@core_get=
version@all-cards.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@core_getversi=
on@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@core_s=
etmaster@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt=
@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@fbdev@=
info.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@fbdev@info.html">PASS</a=
> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-144106v1/shard-dg2-434/igt@kms_atomic_transition@modeset-trans=
ition-nonblocking-fencing.html">PASS</a> +120 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
06v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PAS=
S</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@kms_col=
or@invalid-gamma-lut-sizes.html">DMESG-WARN</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-6/igt@kms_color@i=
nvalid-gamma-lut-sizes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_curs=
or_legacy@cursor-vs-flip-varying-size.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sha=
rd-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-b=
mg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-8/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-463/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sha=
rd-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4106v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb=
-draw-blt.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-2/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_plan=
e_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44106v1/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-p=
ixel-format.html">PASS</a> +95 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_d=
c@dc5-dpms-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_pm_dc@d=
c5-dpms-negative.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_r=
pm@cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_pm_rpm@cursor.htm=
l">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm=
_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/=
igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> +3 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_setm=
ode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-8/igt@kms_setmode@basic.htm=
l">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-lnl-1/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-lnl=
-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_exe=
c_balancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/=
igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +213 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@xe_exec_=
fault_mode@many-bindexecqueue-userptr-rebind.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
06v1/shard-bmg-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.h=
tml">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-4/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel=
 XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144106v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-functio=
n-xe_uc_fw_init.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-6/igt@xe_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-3/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-ad=
lp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef1=
5/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9=
feef15/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef=
891b9feef15/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb=
050ef891b9feef15/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934ef=
bdedb050ef891b9feef15/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d=
934efbdedb050ef891b9feef15/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5=
c719d934efbdedb050ef891b9feef15/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc=
862a5c719d934efbdedb050ef891b9feef15/shard-adlp-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570=
-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-6/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-ad=
lp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/sha=
rd-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef1=
5/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9=
feef15/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef=
891b9feef15/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb=
050ef891b9feef15/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934ef=
bdedb050ef891b9feef15/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d=
934efbdedb050ef891b9feef15/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144106v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
06v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-144106v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-a=
dlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144106v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sh=
ard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-144106v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-144106v1/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106=
v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-9/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-144106v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adl=
p-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44106v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144106v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shar=
d-adlp-6/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-9/igt@xe_pm@s=
4-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard=
-adlp-2/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-adlp-8/igt@xe_pm@s=
4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-adlp-4/igt@xe_=
pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_sysfs=
_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sha=
rd-bmg-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS=
</a> +199 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@core_h=
otunplug@hotreplug-lateclose.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@=
core_hotunplug@hotreplug-lateclose.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 ot=
her test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_ad=
dfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-=
433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_asyn=
c_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_=
async_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset=
-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_bi=
g_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shar=
d-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@=
kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms=
_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_big_=
fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_=
big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@km=
s_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@=
kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Int=
el XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-144106v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rot=
ate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_=
big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/=
igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_big_=
fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_big_fb@yf=
-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466=
/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_big_=
fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/ig=
t@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#11=
24</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4106v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel X=
E#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144106v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0=
-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_bw=
@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-144106v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1=
920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_bw=
@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/=
shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144106v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x=
2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_bw=
@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
06v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_bw@l=
inear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/=
igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_bw=
@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-43=
3/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +3 other tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_bw@l=
inear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/ig=
t@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106=
v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cc=
s@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144106v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_ccs@=
crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-=
3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cc=
s@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2=
351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44106v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shar=
d-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-=
dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">=
Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2=
-433/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bm=
g-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3=
432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sha=
rd-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/s=
hard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
87">Intel XE#2887</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_cc=
s@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144106v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-m=
c-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE=
#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4010">Intel XE#4010</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-d=
g2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">In=
tel XE#2692</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_ccs@=
random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sha=
rd-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466=
/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-=
436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_cham=
elium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms=
_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ch=
amelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/s=
hard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#30=
6</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_ch=
amelium_color@ctm-negative.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_=
chamelium_color@ctm-negative.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_cham=
elium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_chamelium=
_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_cham=
elium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sh=
ard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_cham=
elium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/=
igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)=
 +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_ch=
amelium_hpd@hdmi-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_chamel=
ium_hpd@hdmi-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436=
/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +14 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_colo=
r@ctm-negative.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_color@ct=
m-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_colo=
r@invalid-gamma-lut-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_c=
olor@invalid-gamma-lut-sizes.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +1 other te=
st dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-6/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_co=
ntent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@=
kms_content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>) +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_cont=
ent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_=
content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/=
igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_co=
ntent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/=
igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_cont=
ent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/ig=
t@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_cont=
ent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@km=
s_content_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_co=
ntent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sh=
ard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_co=
ntent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard=
-dg2-434/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_co=
ntent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms=
_content_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_curs=
or_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/ig=
t@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_cu=
rsor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1=
/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel X=
E#308</a>) +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_curs=
or_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/ig=
t@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_curs=
or_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@km=
s_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_curs=
or_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/=
shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_curs=
or_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
106v1/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varyi=
ng-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2286">Intel XE#2286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/=
shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_dirt=
yfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_dsc@=
dsc-with-output-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_dsc=
@dsc-with-output-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4156">Intel XE#4156</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_fbcon_fbt=
@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_feat=
ure_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_fea=
ture_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-=
436/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_feature_=
discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_fe=
ature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-43=
6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-blocking-wf-vblank.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-=
6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_flip=
@dpms-vs-vblank-race-interruptible.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-=
bmg-3/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_fl=
ip@dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
06v1/shard-dg2-466/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_fl=
ip@flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sh=
ard-dg2-436/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel =
XE#1033</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_flip=
@flip-vs-suspend-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/ig=
t@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Inte=
l XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_flip=
@plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_fli=
p@plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-144106v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32=
bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">I=
ntel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144106v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144106v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-y=
ftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-144106v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-t=
o-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-144106v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32b=
pp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106=
v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
06v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
106v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144106v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-=
scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
06v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">In=
tel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144106v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">I=
ntel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn=
-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44106v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v=
1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144106v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144106v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
106v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44106v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
106v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/=
igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144106v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE=
#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144106v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4106v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_getf=
b@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2502">Intel XE#2502</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_getfb@ge=
tfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_join=
er@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg=
-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#293=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_jo=
iner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sha=
rd-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_mult=
ipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bm=
g-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2=
501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pane=
l_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@kms_pa=
nel_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shar=
d-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_pl=
ane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sh=
ard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_plan=
e_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_plane_lo=
wres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-fac=
tor-0-25-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_plan=
e_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144106v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with=
-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-=
factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_plan=
e_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144106v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-=
upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_b=
acklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_pm_=
backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/=
igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm=
_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@kms=
_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_pm=
_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@km=
s_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test=
 skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_pm_b=
acklight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_pm=
_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm=
_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_p=
m_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm=
_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@kms=
_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_pm_dc@deep-pkgc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm=
_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_pm_dc@deep-=
pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_pm_r=
pm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/ig=
t@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3=
141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/83=
6">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_pm=
_rpm@system-suspend-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@k=
ms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#204=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ps=
r2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144106v1/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sh=
ard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489=
">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_ps=
r2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sha=
rd-dg2-433/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1=
489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44106v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_psr2_su@=
page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ps=
r2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr@=
fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_p=
sr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +15=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_ps=
r@fbc-psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt=
@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_ps=
r@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard=
-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ps=
r@pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_psr@pr-sp=
rite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_psr@=
psr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_psr=
@psr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@kms_=
psr@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr@=
psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_psr@psr=
2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sha=
rd-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_ps=
r_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/s=
hard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sha=
rd-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">=
Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ro=
tation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-4=
63/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-=
3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
106v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
27">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard=
-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bm=
g-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3=
414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/39=
04">Intel XE#3904</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@kms_rota=
tion_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard=
-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-436/igt@kms_ro=
tation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt=
@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_scal=
ing_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@k=
ms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_scal=
ing_modes@scaling-mode-none.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms=
_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_setm=
ode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms=
_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_setm=
ode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/ig=
t@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/sh=
ard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#172=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_vr=
r@cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@kms_vrr@=
cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-5/igt@kms_vrr@=
flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@kms_vrr@flip-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_vr=
r@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@kms_=
vrr@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@kms_vr=
r@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@kms_vrr@lobf.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_vrr@=
max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@kms_vrr@max-min.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
9">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@kms_wr=
iteback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2=
-436/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@kms_writ=
eback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/ig=
t@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</=
li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@kms_wr=
iteback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-43=
3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@kms_writ=
eback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-1/igt@k=
ms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@testdi=
splay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@testdisplay.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_cop=
y_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@=
xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_cop=
y_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/=
igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_eud=
ebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/=
igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +14 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_eud=
ebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-4=
33/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_eudeb=
ug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/i=
gt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +=
1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_eud=
ebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-4=
36/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@xe_eudeb=
ug@discovery-empty.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_eudebug@d=
iscovery-empty.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_eud=
ebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg=
2-433/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_eudeb=
ug_online@resume-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@xe_eudebug=
_online@resume-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_exec_=
basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-=
4/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322=
</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-2/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#232=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
106v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-inv=
alidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_exe=
c_fault_mode@many-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_ex=
ec_fault_mode@many-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +21 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_exe=
c_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2=
-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288<=
/a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg=
2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2=
360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-d=
g2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_huc_copy@huc_=
copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_media=
_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/igt@xe_media_fill@=
media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_mma=
p@pci-membarrier-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@xe_=
mmap@pci-membarrier-parallel.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other te=
st dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@xe_mmap@small-bar.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/586">Intel XE#586</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_mma=
p@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@xe_mmap@small-bar=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_mod=
ule_load@reload-no-display.html">ABORT</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_module_load@=
reload-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_oa@=
oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v=
1/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_oa@=
polling-small-buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-466/igt@xe_oa@polli=
ng-small-buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +11 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_oa@un=
privileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-4/ig=
t@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_pat=
@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@=
xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@xe_pm@d3col=
d-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pm@=
s2idle-vm-bind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@xe_pm=
@s2idle-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pm@=
s3-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-436/igt@xe_pm@s3-basic-=
exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_pm@s3=
-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/igt@xe_pm@s3-basic-exec=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4172">Intel XE#4172</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@xe_pm@s3=
-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_pm@s3-d3c=
old-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_pm@=
s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/=
igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_pm@=
s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2=
-433/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_pm@=
s4-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_pm@s4-basic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-432/igt@xe_pm@v=
ram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_que=
ry@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-434/igt@xe_=
query@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_query=
@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/i=
gt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-7/igt@xe_query=
@multigpu-query-invalid-query.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-3/igt@xe_=
query@multigpu-query-invalid-query.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-434/igt@xe_que=
ry@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-433/igt@xe_q=
uery@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-bmg-3/igt@xe_sriov=
_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-bmg-7/=
igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)=
</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-433/igt@xe_sri=
ov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2-=
436/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/shard-dg2-466/igt@xe_wed=
ged@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144106v1/shard-dg2=
-433/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15 -&gt; xe-pw-144=
106v1</li>
</ul>
<p>IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15: bdfc862a5c719d934efbded=
b050ef891b9feef15<br />
  xe-pw-144106v1: 144106v1</p>

</body>
</html>

--===============6498497749677418153==--
