Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1400CCD6E5C
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 13:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C302610E829;
	Thu, 13 Nov 2025 13:50:49 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A0F10E821;
 Thu, 13 Nov 2025 13:50:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8710341817642137050=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/pcode=3A_Allow_chec?=
 =?utf-8?q?king_for_mailbox_command_support_during_driver_probe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Nov 2025 13:50:48 -0000
Message-ID: <176304184893.49826.16368632502672845558@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251113044620.537345-1-raag.jadav@intel.com>
In-Reply-To: <20251113044620.537345-1-raag.jadav@intel.com>
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

--===============8710341817642137050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pcode: Allow checking for mailbox command support during driver probe
URL   : https://patchwork.freedesktop.org/series/157474/
State : failure

== Summary ==

CI Bug Log - changes from xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0_FULL -> xe-pw-157474v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157474v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157474v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157474v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
    - shard-adlp:         [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-adlp-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-adlp-9/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html

  
Known issues
------------

  Here are the changes found in xe-pw-157474v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2370])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:
    - shard-adlp:         [PASS][6] -> [DMESG-WARN][7] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-adlp-2/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-adlp-8/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#316])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +10 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#610])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2314] / [Intel XE#2894])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#367]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#787]) +27 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#3432]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2907]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +14 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][21] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][22] -> [INCOMPLETE][23] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][24] -> [INCOMPLETE][25] ([Intel XE#6168])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][26] -> [DMESG-WARN][27] ([Intel XE#1727] / [Intel XE#3113]) +1 other test dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#6168] / [i915#14968])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2652] / [Intel XE#787]) +16 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2325]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2252]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#373]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6507])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][35] ([Intel XE#1178])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][36] ([Intel XE#1178]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#3304])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#1188]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2321])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2320]) +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2291]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2291]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#3009])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4331])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2374])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2316]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#301]) +3 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][50] -> [DMESG-WARN][51] ([Intel XE#4543]) +3 other tests dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][52] ([Intel XE#3149] / [Intel XE#3321]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2293]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2311]) +18 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#6313])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#5390]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#651]) +11 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#6312])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2313]) +20 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#5672])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#653]) +8 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2312]) +17 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2925]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2927])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#4090])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2501])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4596])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2571])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2763]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1406] / [Intel XE#2387])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1122] / [Intel XE#1406])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#3414] / [Intel XE#3904])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#1435])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#6503]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#455]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1499])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_vrr@flip-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0x8fffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#5300])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x8fffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2504])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#944])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#5626])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4837]) +7 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#4837])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_exec_basic@many-basic:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][89] ([Intel XE#3876])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@xe_exec_basic@many-basic.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2322]) +6 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#288]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2360])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#4943]) +27 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#4915]) +111 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#3573]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2236])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2284]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2284] / [Intel XE#366])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [PASS][99] -> [FAIL][100] ([Intel XE#6251])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#4733]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#4733])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#944])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#4351])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][105] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][107] ([Intel XE#2291]) -> [PASS][108] +3 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][109] ([Intel XE#2316]) -> [PASS][110] +7 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-adlp:         [DMESG-WARN][111] ([Intel XE#4543]) -> [PASS][112] +3 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-adlp-9/igt@kms_flip@basic-flip-vs-dpms.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-adlp-3/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][113] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
    - shard-dg2-set2:     [INCOMPLETE][115] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][116] +1 other test pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][117] ([Intel XE#1503]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-adlp:         [DMESG-WARN][119] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-adlp-2/igt@kms_pm_dc@dc5-dpms-negative.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-adlp-8/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-dg2-set2:     [INCOMPLETE][121] -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-434/igt@kms_rotation_crc@multiplane-rotation.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-466/igt@kms_rotation_crc@multiplane-rotation.html

  * {igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12}:
    - shard-lnl:          [DMESG-WARN][123] ([Intel XE#4537]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-lnl-3/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-lnl-7/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][125] ([Intel XE#4459]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - shard-dg2-set2:     [FAIL][127] ([Intel XE#6407]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-463/igt@xe_gt_freq@freq_fixed_idle.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-432/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
    - shard-lnl:          [FAIL][129] ([Intel XE#6251]) -> [PASS][130] +2 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][131] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][132] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][133] ([Intel XE#2312]) -> [SKIP][134] ([Intel XE#2311]) +15 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][135] ([Intel XE#2311]) -> [SKIP][136] ([Intel XE#2312]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][137] ([Intel XE#5390]) -> [SKIP][138] ([Intel XE#2312]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][139] ([Intel XE#2312]) -> [SKIP][140] ([Intel XE#5390]) +7 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][141] ([Intel XE#2313]) -> [SKIP][142] ([Intel XE#2312]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][143] ([Intel XE#2312]) -> [SKIP][144] ([Intel XE#2313]) +14 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][145] ([Intel XE#5021]) -> [SKIP][146] ([Intel XE#4596])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#362]) -> [FAIL][148] ([Intel XE#1729])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-adlp:         [DMESG-FAIL][149] ([Intel XE#3868] / [Intel XE#5213]) -> [DMESG-FAIL][150] ([Intel XE#3868] / [Intel XE#5213] / [Intel XE#5545]) +1 other test dmesg-fail
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-adlp-3/igt@xe_sriov_scheduling@equal-throughput.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-adlp-4/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
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
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6313
  [Intel XE#6407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6407
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#14968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968


Build changes
-------------

  * Linux: xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0 -> xe-pw-157474v1

  IGT_8622: 8622
  xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0: 2395af7950abb996316c9ee00f68a639fb6eb1c0
  xe-pw-157474v1: 157474v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/index.html

--===============8710341817642137050==
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
<tr><td><b>Series:</b></td><td>drm/xe/pcode: Allow checking for mailbox com=
mand support during driver probe</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/157474/">https://patchwork.freedesktop.org/series/157474/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-157474v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-157474v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4096-2395af7950abb996316c9ee00f68a639f=
b6eb1c0_FULL -&gt; xe-pw-157474v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157474v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-157474v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1574=
74v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-adlp-3/igt@kms_fli=
p@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-157474v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend.h=
tml">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:=
</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-adlp-8/igt@xe_pmu@=
engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/=
shard-adlp-9/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_cl=
ass_copy0.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157474v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-adlp-2/igt@kms_ato=
mic_transition@plane-use-after-nonblocking-unbind-fencing.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/sha=
rd-adlp-8/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fenc=
ing.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-r=
otate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_bw@linear-tiling-4-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-ti=
led-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-=
tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +14 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Int=
el XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-433/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6168">Intel XE#6168</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2=
-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard=
-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>) +1 other test dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168=
">Intel XE#6168</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14968">i915#14968</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +16 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_chamelium_color@ctm-max.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-=
change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_chamelium_sharpness_filte=
r@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_content_protection@lic-=
type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_content_protection@ueve=
nt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-2/igt@kms_curs=
or_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-=
bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-=
flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Inte=
l XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_feature_discovery@psr1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
16">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-lnl-2/igt@kms_flip@flip-=
vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-adlp-8/igt@kms_fli=
p@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-adlp-3/igt@kms_flip@=
flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_flip@flip-vs-expired-vbla=
nk@d-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6313">Intel XE#6313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe=
-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5672">Intel XE#5672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-466/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +17 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_joiner@basic-max-non-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2925">Intel XE#2925</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-m=
ulti-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane=
-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plan=
e-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +13 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_setmode@invalid-clone-sin=
gle-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_sharpness_filter@filter-f=
ormats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6503">Intel XE#6503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@kms_sharpness_filter@invali=
d-plane-with-filter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@kms_vrr@flip-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">=
Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x8fffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-line=
ar-0x8fffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5300">Intel XE#5300</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2504">Intel XE#2504</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_create@multigpu-create-m=
assive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_eu_stall@blocking-re-ena=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@xe_eudebug@basic-exec-queues.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_eudebug@discovery-race-v=
mbind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@xe_exec_basic@many-basic.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-mmap-free-huge.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943=
</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-large-new-bo-map.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +111 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_oa@closed-fd-and-unmappe=
d-access.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-e=
xec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_comput=
e0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-lnl-8/igt@xe_pmu@e=
ngine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v=
1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_c=
lass_compute0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6251">Intel XE#6251</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-po=
st-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@xe_query@multigpu-query-inval=
id-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157474v1/shard-dg2-464/igt@xe_sriov_scheduling@nonpree=
mpt-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-463/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-b=
mg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> +3 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-7/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-adlp-9/igt@kms_fli=
p@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-adlp-3/igt@kms=
_flip@basic-flip-vs-dpms.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-4/igt@kms_flip=
@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-=
4/igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-435/igt@kms_fl=
ip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg=
2-464/igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-6/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-1/igt@kms_hdr@s=
tatic-toggle-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-adlp-2/igt@kms_pm_=
dc@dc5-dpms-negative.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-=
adlp-8/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-434/igt@kms_ro=
tation_crc@multiplane-rotation.html">INCOMPLETE</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-466/igt@kms_ro=
tation_crc@multiplane-rotation.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-lnl-3/igt@kms_shar=
pness_filter@filter-formats@pipe-a-edp-1-nv12.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537">Intel XE#4537=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1574=
74v1/shard-lnl-7/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-lnl-5/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-lnl-3/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-463/igt@xe_gt_=
freq@freq_fixed_idle.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6407">Intel XE#6407</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-432/igt@xe_gt_fr=
eq@freq_fixed_idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_=
enhance0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-lnl-8/igt@xe_pmu@e=
ngine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/62=
51">Intel XE#6251</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-157474v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@en=
gine-drm_xe_engine_class_video_enhance0.html">PASS</a> +2 other tests pass<=
/li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-463/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-157474v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1574=
74v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5=
390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
57474v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
57474v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/=
shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v=
1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-bmg-6/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157474v1/shard-dg2-435/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0/shard-adlp-3/igt@xe_srio=
v_scheduling@equal-throughput.html">DMESG-FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1574=
74v1/shard-adlp-4/igt@xe_sriov_scheduling@equal-throughput.html">DMESG-FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">=
Intel XE#3868</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5213">Intel XE#5213</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0 -&gt; xe-pw-157=
474v1</li>
</ul>
<p>IGT_8622: 8622<br />
  xe-4096-2395af7950abb996316c9ee00f68a639fb6eb1c0: 2395af7950abb996316c9ee=
00f68a639fb6eb1c0<br />
  xe-pw-157474v1: 157474v1</p>

</body>
</html>

--===============8710341817642137050==--
