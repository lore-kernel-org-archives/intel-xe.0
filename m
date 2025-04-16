Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37899C369AB
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 01:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAC810E06F;
	Wed, 16 Apr 2025 01:07:01 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5767F10E06F;
 Wed, 16 Apr 2025 01:07:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6268236646665001044=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Large_devcoredump_file_sup?=
 =?utf-8?q?port?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Apr 2025 01:07:00 -0000
Message-ID: <174476562032.8504.1193662470391024282@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250415173613.294522-1-matthew.brost@intel.com>
In-Reply-To: <20250415173613.294522-1-matthew.brost@intel.com>
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

--===============6268236646665001044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Large devcoredump file support
URL   : https://patchwork.freedesktop.org/series/147778/
State : failure

== Summary ==

CI Bug Log - changes from xe-2956-b61f5de7570012cb79e72624a97b216d395f7380_FULL -> xe-pw-147778v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147778v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147778v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147778v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_oa@polling-small-buf:
    - shard-lnl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@xe_oa@polling-small-buf.html
    - shard-bmg:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@xe_oa@polling-small-buf.html

  
Known issues
------------

  Here are the changes found in xe-pw-147778v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#827])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#3768])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#3768])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_async_flips@overlay-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#4761])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_async_flips@overlay-atomic.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1407])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#316]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2327])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1124])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][16] -> [DMESG-FAIL][17] ([Intel XE#4543])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [PASS][18] -> [DMESG-WARN][19] ([Intel XE#2953] / [Intel XE#4173])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2328])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#607])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2191])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2314] / [Intel XE#2894])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2314] / [Intel XE#2894])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2191]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1512])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#787]) +155 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2887]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#2669]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][33] ([Intel XE#1727] / [Intel XE#3113])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#306])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_chamelium_color@ctm-negative.html
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2325])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2252])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#373])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#3278])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][42] ([Intel XE#1178]) +2 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#1178])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#455]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2320])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1424])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#309]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#309]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2291]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#309])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [PASS][53] -> [SKIP][54] ([Intel XE#4354])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-434/igt@kms_dp_link_training@non-uhbr-sst.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2244])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_dsc@dsc-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2244])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#702])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1421])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#310])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#3321])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#310])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-dg2-set2:     [PASS][63] -> [SKIP][64] ([Intel XE#310]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-432/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#2316]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
    - shard-bmg:          [PASS][67] -> [FAIL][68] ([Intel XE#2882]) +2 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][69] -> [FAIL][70] ([Intel XE#301])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp2:
    - shard-bmg:          [PASS][71] -> [INCOMPLETE][72] ([Intel XE#2049] / [Intel XE#2597])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp2.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp2.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#886])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1401] / [Intel XE#1745])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1401])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2311]) +8 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#651])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#656]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#656]) +10 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#4141]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][82] -> [SKIP][83] ([Intel XE#656]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#651]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#651]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2313]) +5 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2312]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#653]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#656]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#346])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#346])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2934])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#4298])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][94] -> [SKIP][95] ([Intel XE#3012])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#4328])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_lease@lease-uevent:
    - shard-bmg:          [PASS][98] -> [DMESG-WARN][99] ([Intel XE#3428])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-8/igt@kms_lease@lease-uevent.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-6/igt@kms_lease@lease-uevent.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][100] ([Intel XE#616]) +2 other tests fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][101] -> [SKIP][102] ([Intel XE#4596])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([Intel XE#4596])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-4.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][105] ([Intel XE#4658]) +3 other tests fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#3307])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [ABORT][107] ([Intel XE#4502] / [Intel XE#4760])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1489]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1406]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2850] / [Intel XE#929])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#4609])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#2939])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#3414] / [Intel XE#3904])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#3414] / [Intel XE#3904])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1127])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [PASS][117] -> [SKIP][118] ([Intel XE#455])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-434/igt@kms_vrr@negative-basic.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_vrr@negative-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1123])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1062])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@xe_create@create-big-vram.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2504])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#944])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-434/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-close:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#2905]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#2905] / [Intel XE#3889])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2905])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2905]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_evict@evict-small-external:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#688])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@xe_evict@evict-small-external.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][128] -> [SKIP][129] ([Intel XE#1392]) +6 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1392]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2322])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-basic:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#288]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#288]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-adlp:         [PASS][134] -> [DMESG-WARN][135] ([Intel XE#4173]) +8 other tests dmesg-warn
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][136] ([Intel XE#1999]) +2 other tests fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@buffer-size:
    - shard-bmg:          [PASS][137] -> [FAIL][138] ([Intel XE#4541])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@xe_oa@buffer-size.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-2/igt@xe_oa@buffer-size.html

  * igt@xe_oa@buffer-size@ccs-0-128k:
    - shard-bmg:          NOTRUN -> [FAIL][139] ([Intel XE#4541])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-2/igt@xe_oa@buffer-size@ccs-0-128k.html

  * igt@xe_oa@enable-disable@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][140] ([Intel XE#4804])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-2/igt@xe_oa@enable-disable@ccs-0.html

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#2541] / [Intel XE#3573])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][142] ([Intel XE#1173])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#2284] / [Intel XE#366])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#584])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][145] -> [ABORT][146] ([Intel XE#1794])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-3/igt@xe_pm@s4-exec-after.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#4733])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#944]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#944])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#4130])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][151] ([Intel XE#4543]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][153] ([Intel XE#3862]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][155] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][157] ([Intel XE#2291]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#309]) -> [PASS][160] +4 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][161] ([Intel XE#3009]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@kms_dp_aux_dev.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-8/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][163] ([Intel XE#2316]) -> [PASS][164] +5 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][165] ([Intel XE#3321]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#310]) -> [PASS][168] +3 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][169] ([Intel XE#301]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][171] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][172] +3 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
    - shard-bmg:          [INCOMPLETE][173] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][175] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [FAIL][177] ([Intel XE#2882]) -> [PASS][178] +2 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-3/igt@kms_flip@plain-flip-ts-check.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-3/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#656]) -> [PASS][180] +2 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-lnl:          [ABORT][181] -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-suspend.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#836]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1392]) -> [PASS][186] +4 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [DMESG-WARN][187] ([Intel XE#4173]) -> [PASS][188] +2 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][189] ([Intel XE#1794]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][191] ([Intel XE#1794]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#787]) -> [SKIP][194] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][196] ([Intel XE#787]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][197] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][198] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][199] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][200] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][201] ([Intel XE#1178]) -> [SKIP][202] ([Intel XE#455])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-434/igt@kms_content_protection@atomic.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#455]) -> [FAIL][204] ([Intel XE#1178])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-432/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][205] ([Intel XE#2341]) -> [FAIL][206] ([Intel XE#1178])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@kms_content_protection@srm.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-8/igt@kms_content_protection@srm.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][207] ([Intel XE#3321]) -> [SKIP][208] ([Intel XE#2316])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][209] ([Intel XE#301]) -> [SKIP][210] ([Intel XE#310]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#656]) -> [SKIP][212] ([Intel XE#651]) +9 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][213] ([Intel XE#2311]) -> [SKIP][214] ([Intel XE#2312]) +5 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][215] ([Intel XE#2312]) -> [SKIP][216] ([Intel XE#4141]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][217] ([Intel XE#4141]) -> [SKIP][218] ([Intel XE#2312]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][219] ([Intel XE#2312]) -> [SKIP][220] ([Intel XE#2311]) +6 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#651]) -> [SKIP][222] ([Intel XE#656]) +11 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#656]) -> [SKIP][224] ([Intel XE#653]) +10 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][225] ([Intel XE#2312]) -> [SKIP][226] ([Intel XE#2313]) +5 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#653]) -> [SKIP][228] ([Intel XE#656]) +9 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][229] ([Intel XE#2313]) -> [SKIP][230] ([Intel XE#2312]) +5 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#4596]) -> [SKIP][232] ([Intel XE#455])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][233] ([Intel XE#4760]) -> [ABORT][234] ([Intel XE#2705] / [Intel XE#4760])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [SKIP][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260]) ([Intel XE#378]) -> ([PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [DMESG-WARN][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [SKIP][286]) ([Intel XE#378] / [Intel XE#4173])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-3/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-3/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-3/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-2/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-1/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-1/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-1/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-1/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-2/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-9/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-4/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-4/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-4/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-4/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-3/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-6/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-6/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-9/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-9/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-2/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-9/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-8/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-8/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-8/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-2/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-6/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-4/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-4/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-3/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-6/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-3/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-6/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-6/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-4/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-4/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-6/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-1/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-3/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-3/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-8/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-8/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-8/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-1/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-1/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-9/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-1/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-9/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-8/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-3/igt@xe_module_load@load.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1061]) -> [FAIL][288] ([Intel XE#1173])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-432/igt@xe_peer2peer@read.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-433/igt@xe_peer2peer@read.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4658
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4761
  [Intel XE#4804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4804
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2956-b61f5de7570012cb79e72624a97b216d395f7380 -> xe-pw-147778v1

  IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2956-b61f5de7570012cb79e72624a97b216d395f7380: b61f5de7570012cb79e72624a97b216d395f7380
  xe-pw-147778v1: 147778v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/index.html

--===============6268236646665001044==
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
<tr><td><b>Series:</b></td><td>Large devcoredump file support</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147778/">https://patchwork.freedesktop.org/series/147778/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147778v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147778v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2956-b61f5de7570012cb79e72624a97b216d3=
95f7380_FULL -&gt; xe-pw-147778v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147778v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-147778v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1477=
78v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_oa@polling-small-buf:<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@xe_oa@polling-small-buf.html"=
>FAIL</a></li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@xe_oa@polling-small-buf.html"=
>FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147778v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_=
async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3701">Intel XE#3701</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel =
XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-3.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shar=
d-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_async_flips@invalid-async=
-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3768">Intel XE#3768</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_async_flips@invalid-async=
-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@overlay-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_async_flips@overlay-atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4761">Intel XE#4761</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_big_fb@4-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/sha=
rd-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-8=
/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953=
">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_bw@connected-linear-tilin=
g-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_bw@connected-linear-til=
ing-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_bw@linear-tiling-4-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +155 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Int=
el XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-=
tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_chamelium_frames@vga-fram=
e-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-af=
ter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_content_protection@lic-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-432/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_content_protection@ueve=
nt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_cursor_legacy@2x-cursor-v=
s-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-432/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@k=
ms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/sh=
ard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs=
-flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-434/igt@kms_dp=
_link_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_dp_link_tra=
ining@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_dsc@dsc-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_feature_discovery@display=
-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_flip@2x-absolute-wf_vblan=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@kms_flip@2x-dpms-vs-vblank-r=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard=
-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset=
-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-432/igt@kms_fl=
ip@2x-nonexisting-fb-interruptible.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_flip=
@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_=
flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-3/igt@kms_flip=
@flip-vs-absolute-wf_vblank@a-dp2.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-6/igt@kms_flip@fl=
ip-vs-absolute-wf_vblank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-4/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible@a-dp2.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend-interruptible@a-dp2.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE=
#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-lnl-1/igt@kms_flip=
@plain-flip-ts-check@b-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-7/igt@kms_flip@plain-fl=
ip-ts-check@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drr=
s-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-d=
g2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-434/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-434/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@kms_joiner@basic-max-non-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_joine=
r@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-463/igt@kms_jo=
iner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_j=
oiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-8/igt@kms_leas=
e@lease-uevent.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147778v1/shard-bmg-6/igt@kms_lease@lease-uevent.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-433/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_plane_multiple@2x-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-463/igt@kms_pl=
ane_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_plane_multiple=
@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_plane_multiple@tiling-x@p=
ipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4658">Intel XE#4658</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_plane_scaling@intel-max-s=
rc-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4502">Intel XE#4502</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-=
plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-rende=
r@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_psr@psr2-cursor-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@kms_psr_stress_test@invalida=
te-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-434/igt@kms_vr=
r@negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_vrr@negative-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-line=
ar-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@xe_create@create-big-vram.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2504">Intel XE#2504</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-434/igt@xe_create@multigpu-create-m=
assive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@xe_eudebug@basic-close.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
05">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@xe_eudebug@basic-vm-bind-ufe=
nce-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@xe_eudebug@multigpu-basic-c=
lient-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@xe_evict@evict-small-external=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 ot=
her tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-b=
asic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-b=
asic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@xe_exec_fault_mode@many-basi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@xe_exec_fault_mode@many-exe=
cqueues-basic-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-2/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-a=
dlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4173">Intel XE#4173</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_li=
ve_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@xe_oa@bu=
ffer-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-147778v1/shard-bmg-2/igt@xe_oa@buffer-size.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel X=
E#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@ccs-0-128k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-2/igt@xe_oa@buffer-size@ccs-0-128k.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-2/igt@xe_oa@enable-disable@ccs-0.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4804">Intel XE#4804</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-str=
eam-exec-q.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-433/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@xe_pm@s3-mocs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel =
XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-3/igt@xe_pm@s=
4-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147778v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">=
Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@xe_pxp@regular-src-to-pxp-des=
t-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-bmg-1/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-147778v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-=
rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard=
-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-436/igt@kms_ccs@random-cc=
s-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-8/i=
gt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/s=
hard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html=
">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-8/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-8/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147778v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b=
d-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-463/igt@k=
ms_flip@2x-flip-vs-panning-vs-hang.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shar=
d-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adl=
p-9/igt@kms_flip@flip-vs-suspend.html">PASS</a> +3 other tests pass</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-=
4/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/sh=
ard-dg2-434/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-3/igt@kms_flip=
@plain-flip-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-3/igt@kms_flip@p=
lain-flip-ts-check.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47778v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indf=
b-draw-render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@psr-suspend.html">ABORT</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-3/igt@kms_frontbuffer=
_tracking@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_pm=
_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-43=
2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/=
shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html=
">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-1/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">I=
ntel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-147778v1/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-fun=
ction-xe_guc_relay_init.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-9/igt@xe_pm@s=
4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@xe_pm@s4-d=
3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-lnl-2/igt@xe_pm@s4=
-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-lnl-8/igt@xe_pm@s4-multi=
ple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-463/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778=
v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-=
a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147778v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d=
-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-147778v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-147778v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel X=
E#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-434/igt@kms_co=
ntent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/igt@kms_c=
ontent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_co=
ntent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-432/igt@kms=
_content_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-8/igt@kms_content_=
protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-bmg-4/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-432/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-=
dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel=
 XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778=
v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147778v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1477=
78v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1477=
78v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147778v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147778v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1477=
78v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indf=
b-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
778v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47778v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1477=
78v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-464/igt@kms_pl=
ane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-432/igt@kms_=
plane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-432/igt@kms_pl=
ane_scaling@intel-max-src-size.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-464/=
igt@kms_plane_scaling@intel-max-src-size.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#=
4760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-3/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/sha=
rd-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f738=
0/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d39=
5f7380/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b2=
16d395f7380/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624=
a97b216d395f7380/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e=
72624a97b216d395f7380/shard-adlp-9/igt@xe_module_load@load.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012=
cb79e72624a97b216d395f7380/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de75=
70012cb79e72624a97b216d395f7380/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f=
5de7570012cb79e72624a97b216d395f7380/shard-adlp-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956=
-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-3/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-adlp-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-ad=
lp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d395f738=
0/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b216d39=
5f7380/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624a97b2=
16d395f7380/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e72624=
a97b216d395f7380/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012cb79e=
72624a97b216d395f7380/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2956-b61f5de7570012=
cb79e72624a97b216d395f7380/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-147778v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1477=
78v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147778v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-a=
dlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147778v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147778v1/shard-adlp-4/igt@xe_module_load@load.html">DMESG=
-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14777=
8v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-147778v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-ad=
lp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-8/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147778v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-147778v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/sha=
rd-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-1/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-147778v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-1/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-147778v1/shard-adlp-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778=
v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-adlp-3/igt@xe_module=
_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378">Intel XE#378</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2956-b61f5de7570012cb79e72624a97b216d395f7380/shard-dg2-432/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147778v1/shard-dg2-433/igt@xe_peer2peer@read=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2956-b61f5de7570012cb79e72624a97b216d395f7380 -&gt; xe-pw-147=
778v1</li>
</ul>
<p>IGT_8320: cd3b5612be3cef838f16e074bf1bc421399d584d @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2956-b61f5de7570012cb79e72624a97b216d395f7380: b61f5de7570012cb79e7262=
4a97b216d395f7380<br />
  xe-pw-147778v1: 147778v1</p>

</body>
</html>

--===============6268236646665001044==--
