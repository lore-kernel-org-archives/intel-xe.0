Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC26C5AD49
	for <intel-xe@archiver.kernel.org>; Sun,  8 Jun 2025 14:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8AAE10E02D;
	Sun,  8 Jun 2025 14:39:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF23510E02D;
 Sun,  8 Jun 2025 14:39:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6882867197046899420=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_drm/xe=3A_Move_DSB_l2_flush_to_a_more_sensible_place?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 08 Jun 2025 14:39:12 -0000
Message-ID: <174939355270.58178.1587018831512113243@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250606104546.1996818-3-matthew.auld@intel.com>
In-Reply-To: <20250606104546.1996818-3-matthew.auld@intel.com>
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

--===============6882867197046899420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Move DSB l2 flush to a more sensible place
URL   : https://patchwork.freedesktop.org/series/149935/
State : failure

== Summary ==

CI Bug Log - changes from xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee_FULL -> xe-pw-149935v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149935v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149935v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149935v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-bmg:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-1/igt@xe_pm@s4-multiple-execs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-463/igt@xe_pm@s4-vm-bind-unbind-all.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html

  
Known issues
------------

  Here are the changes found in xe-pw-149935v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1125])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#3767]) +15 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#3768])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#316]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-adlp:         [PASS][13] -> [DMESG-WARN][14] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-9/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124]) +7 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2314] / [Intel XE#2894])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1512])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#787]) +209 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +44 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2907])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][27] -> [INCOMPLETE][28] ([Intel XE#3862]) +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#787]) +17 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2669]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#4212])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#4418])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#306])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#306])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-8/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#306])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#373]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#373]) +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#373])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#307])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#5176])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1178])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#308])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1424]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#309])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2291]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#323])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#4494] / [i915#3804])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#4354])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#4294])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#4331])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#2316]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][58] -> [INCOMPLETE][59] ([Intel XE#2049] / [Intel XE#2597]) +3 other tests incomplete
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][60] -> [INCOMPLETE][61] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-bmg:          [PASS][62] -> [FAIL][63] ([Intel XE#2882]) +2 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][64] ([Intel XE#886])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1401] / [Intel XE#1745])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1401])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#455]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#352])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#651]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#656]) +7 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#651]) +21 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1151])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#658])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#653])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#653]) +25 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#656]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2927])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#356])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][79] ([Intel XE#616]) +3 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#4596])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#2763]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#2893])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1489]) +6 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1489])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1406]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#4609])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#3414])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [FAIL][90] ([Intel XE#4689])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][91] ([Intel XE#2883]) +4 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][92] ([Intel XE#1729])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#330])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#455]) +18 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1126])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#4497])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#4837]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#4837]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#688])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][100] -> [SKIP][101] ([Intel XE#1392]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1392]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#288]) +21 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#288])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-8/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2360]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][106] ([Intel XE#3876])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@threads-many-large-free:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#4915]) +21 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-free.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#4915]) +198 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#4943]) +4 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][110] -> [FAIL][111] ([Intel XE#5018])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#512])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@xe_mmap@small-bar.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1416])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@xe_mmap@vram.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#584])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#4650])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#4733]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#4130])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#3342])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#4351])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-adlp:         [SKIP][122] ([Intel XE#5034]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@core_setmaster@master-drop-set-shared-fd.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_addfb_basic@master-rmfb:
    - shard-adlp:         [DMESG-WARN][124] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-8/igt@kms_addfb_basic@master-rmfb.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-9/igt@kms_addfb_basic@master-rmfb.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][126] ([Intel XE#827]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-adlp:         [SKIP][128] ([Intel XE#4947]) -> [PASS][129] +5 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][130] ([Intel XE#3862]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-adlp:         [SKIP][132] ([Intel XE#4950]) -> [PASS][133] +15 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][134] ([Intel XE#2291]) -> [PASS][135] +2 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][136] ([Intel XE#1340]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][138] ([Intel XE#2316]) -> [PASS][139] +8 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][140] ([Intel XE#301]) -> [PASS][141] +2 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][142] ([Intel XE#3321]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][144] ([Intel XE#2049]) -> [PASS][145] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-436/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [FAIL][146] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:
    - shard-adlp:         [FAIL][148] ([Intel XE#2882]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-3/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:
    - shard-lnl:          [FAIL][150] ([Intel XE#886]) -> [PASS][151] +2 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][152] ([Intel XE#4543]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][154] ([Intel XE#1503]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][156] ([Intel XE#4596]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-adlp:         [SKIP][158] ([Intel XE#5177]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1392]) -> [PASS][161] +3 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][162] ([Intel XE#4937] / [Intel XE#5018]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         [FAIL][164] ([Intel XE#3099]) -> [PASS][165] +2 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_mmap@bad-flags:
    - shard-adlp:         [SKIP][166] ([Intel XE#4945]) -> [PASS][167] +24 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_mmap@bad-flags.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_mmap@bad-flags.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][168] ([Intel XE#1794]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-6/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][170] ([Intel XE#1794]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-adlp:         [SKIP][172] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][173] ([Intel XE#1124])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-adlp:         [SKIP][174] ([Intel XE#4947]) -> [SKIP][175] ([Intel XE#316])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         [SKIP][176] ([Intel XE#4947]) -> [SKIP][177] ([Intel XE#607])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         [SKIP][178] ([Intel XE#4950]) -> [SKIP][179] ([Intel XE#2191])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-adlp:         [SKIP][180] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][181] ([Intel XE#455] / [Intel XE#787])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-adlp:         [SKIP][182] ([Intel XE#4947]) -> [SKIP][183] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         [SKIP][184] ([Intel XE#4950]) -> [SKIP][185] ([Intel XE#306])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_chamelium_color@ctm-negative.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-adlp:         [SKIP][186] ([Intel XE#4950]) -> [SKIP][187] ([Intel XE#373]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-adlp:         [SKIP][188] ([Intel XE#4950]) -> [SKIP][189] ([Intel XE#309])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-adlp:         [SKIP][190] ([Intel XE#4947]) -> [SKIP][191] ([Intel XE#455]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         [SKIP][192] ([Intel XE#4950]) -> [SKIP][193] ([Intel XE#310]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [FAIL][194] ([Intel XE#3098]) -> [FAIL][195] ([Intel XE#2882] / [Intel XE#886])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-434/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          [ABORT][196] ([Intel XE#4760]) -> [SKIP][197] ([Intel XE#1397] / [Intel XE#1745])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          [ABORT][198] ([Intel XE#4760]) -> [SKIP][199] ([Intel XE#1397])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][200] ([Intel XE#2311]) -> [SKIP][201] ([Intel XE#2312]) +6 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-adlp:         [SKIP][202] ([Intel XE#4947]) -> [SKIP][203] ([Intel XE#651]) +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         [SKIP][204] ([Intel XE#4947]) -> [SKIP][205] ([Intel XE#656]) +7 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][206] ([Intel XE#4141]) -> [SKIP][207] ([Intel XE#2312]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][208] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][209] ([Intel XE#656])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][210] ([Intel XE#2312]) -> [SKIP][211] ([Intel XE#4141]) +4 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][212] ([Intel XE#2312]) -> [SKIP][213] ([Intel XE#2311]) +12 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         [SKIP][214] ([Intel XE#4947]) -> [SKIP][215] ([Intel XE#653]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][216] ([Intel XE#2313]) -> [SKIP][217] ([Intel XE#2312]) +4 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][218] ([Intel XE#2312]) -> [SKIP][219] ([Intel XE#2313]) +13 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][220] ([Intel XE#3544]) -> [SKIP][221] ([Intel XE#3374] / [Intel XE#3544])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         [SKIP][222] ([Intel XE#4947]) -> [SKIP][223] ([Intel XE#2925])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_joiner@basic-force-ultra-joiner.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][224] ([Intel XE#3325]) -> [SKIP][225] ([Intel XE#734])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         [SKIP][226] ([Intel XE#4947]) -> [SKIP][227] ([Intel XE#1489]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@pr-sprite-render:
    - shard-adlp:         [SKIP][228] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][229] ([Intel XE#2850] / [Intel XE#929])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_psr@pr-sprite-render.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-suspend:
    - shard-adlp:         [SKIP][230] ([Intel XE#4947]) -> [SKIP][231] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_psr@psr2-suspend.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         [SKIP][232] ([Intel XE#4950]) -> [SKIP][233] ([Intel XE#1127])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-adlp:         [SKIP][234] ([Intel XE#4950]) -> [SKIP][235] ([Intel XE#455]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_scaling_modes@scaling-mode-center.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-adlp:         [SKIP][236] ([Intel XE#4945]) -> [SKIP][237] ([Intel XE#944])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_create@multigpu-create-massive-size.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-adlp:         [SKIP][238] ([Intel XE#4945]) -> [SKIP][239] ([Intel XE#4837]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_eudebug_online@interrupt-other.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-adlp:         [SKIP][240] ([Intel XE#4945]) -> [SKIP][241] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_evict@evict-small-multi-vm.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-adlp:         [SKIP][242] ([Intel XE#4945]) -> [SKIP][243] ([Intel XE#1392]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         [SKIP][244] ([Intel XE#4945]) -> [SKIP][245] ([Intel XE#288]) +5 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_system_allocator@twice-large-malloc-race-nomemset:
    - shard-adlp:         [SKIP][246] ([Intel XE#4945]) -> [SKIP][247] ([Intel XE#4915]) +54 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_exec_system_allocator@twice-large-malloc-race-nomemset.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_exec_system_allocator@twice-large-malloc-race-nomemset.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         [SKIP][248] ([Intel XE#4945]) -> [SKIP][249] ([Intel XE#1337])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_pat@display-vs-wb-transient.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-adlp:         [SKIP][250] ([Intel XE#4945]) -> [SKIP][251] ([Intel XE#2284] / [Intel XE#366])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_pm@s4-d3cold-basic-exec.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-adlp:         [SKIP][252] ([Intel XE#4945]) -> [SKIP][253] ([Intel XE#4733])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-adlp:         [SKIP][254] ([Intel XE#4945]) -> [SKIP][255] ([Intel XE#4814])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_render_copy@render-stress-2-copies.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_render_copy@render-stress-2-copies.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5034
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5172
  [Intel XE#5176]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5176
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee -> xe-pw-149935v1

  IGT_8400: 90a23a10be60c805ab0da456e846d1ec45799f9d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee: 180cee22a876c2dfec1099123ba7ded61fbb24ee
  xe-pw-149935v1: 149935v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/index.html

--===============6882867197046899420==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Move DSB l2 flush to a more sensible place</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149935/">https://patchwork.freedesktop.org/series/149935/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee_FULL -&gt; xe-pw-149935v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149935v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149935v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-149935v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-1/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@xe_pm@s4-multiple-execs.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-463/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149935v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-9/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +209 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-8/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5176">Intel XE#5176</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_psr@fbc-psr2-basic@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689">Intel XE#4689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@xe_eudebug@attach-debug-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@xe_evict@evict-beng-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-8/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-free:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-free.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +198 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@xe_pmu@all-fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-466/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-435/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5034">Intel XE#5034</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@master-rmfb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-8/igt@kms_addfb_basic@master-rmfb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-9/igt@kms_addfb_basic@master-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-436/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-3/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@bad-flags:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_mmap@bad-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_mmap@bad-flags.html">PASS</a> +24 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-6/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-dg2-434/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325">Intel XE#3325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-race-nomemset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_exec_system_allocator@twice-large-malloc-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_exec_system_allocator@twice-large-malloc-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee/shard-adlp-4/igt@xe_render_copy@render-stress-2-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149935v1/shard-adlp-4/igt@xe_render_copy@render-stress-2-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee -&gt; xe-pw-149935v1</li>
</ul>
<p>IGT_8400: 90a23a10be60c805ab0da456e846d1ec45799f9d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3207-180cee22a876c2dfec1099123ba7ded61fbb24ee: 180cee22a876c2dfec1099123ba7ded61fbb24ee<br />
  xe-pw-149935v1: 149935v1</p>

</body>
</html>

--===============6882867197046899420==--
