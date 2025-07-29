Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76988C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 18:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290A110E02F;
	Tue, 29 Jul 2025 18:55:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DD810E02F;
 Tue, 29 Jul 2025 18:55:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6861736034985798792=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Updates_for_drm/xe/configf?=
 =?utf-8?q?s_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Jul 2025 18:55:03 -0000
Message-ID: <175381530317.196634.10796296809347667856@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250729114215.177586-1-michal.wajdeczko@intel.com>
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

--===============6861736034985798792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Updates for drm/xe/configfs (rev6)
URL   : https://patchwork.freedesktop.org/series/151773/
State : failure

== Summary ==

CI Bug Log - changes from xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6_FULL -> xe-pw-151773v6_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151773v6_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151773v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151773v6_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-8/igt@xe_gt_freq@freq_suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-463/igt@xe_pm@d3cold-i2c.html
    - shard-lnl:          NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-4/igt@xe_pm@d3cold-i2c.html
    - shard-bmg:          NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@xe_pm@d3cold-i2c.html
    - shard-adlp:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-2/igt@xe_pm@d3cold-i2c.html

  
Known issues
------------

  Here are the changes found in xe-pw-151773v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#4963]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@core_hotunplug@hotreplug.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@pan:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2134]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@fbdev@pan.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@fbdev@pan.html

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1125] / [Intel XE#5574])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-9/igt@intel_hwmon@hwmon-write.html
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1125])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2327]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#4947]) +18 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#3658])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#316]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#607])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#610]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1428])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1124]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1124])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2314] / [Intel XE#2894])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2191])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#367])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +32 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2887])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#787]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#455] / [Intel XE#787])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#787]) +181 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][39] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +1 other test incomplete
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][42] ([Intel XE#2705] / [Intel XE#4212])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#4417]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#306]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#373])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-9/igt@kms_chamelium_frames@vga-frame-dump.html
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2252]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_chamelium_frames@vga-frame-dump.html
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#373]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-4/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#373]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1424])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2320]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#308])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2291]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#309])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][55] -> [FAIL][56] ([Intel XE#4633])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1340])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#4494] / [i915#3804])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#4331])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#4422])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4422])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#4422])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#4422])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#776])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#776])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1137])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#2316]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2316])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#4950]) +89 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][72] -> [FAIL][73] ([Intel XE#5352])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][74] ([Intel XE#5352]) +2 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip@absolute-wf_vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][75] -> [DMESG-WARN][76] ([Intel XE#4543]) +21 other tests dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][77] -> [FAIL][78] ([Intel XE#3098] / [Intel XE#5338])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][79] ([Intel XE#3098])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][80] ([Intel XE#5338])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2293]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2293] / [Intel XE#2380])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1397] / [Intel XE#1745])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1397])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#455]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [PASS][86] -> [DMESG-FAIL][87] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [FAIL][88] ([Intel XE#3106] / [Intel XE#4683]) +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2311]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#651])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#651]) +21 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [PASS][92] -> [DMESG-FAIL][93] ([Intel XE#4543]) +11 other tests dmesg-fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#656]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2312])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#5390]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#658])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#4947]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#653]) +22 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2313]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#656]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#653])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2927])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@kms_lease@invalid-create-leases.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_lease@invalid-create-leases.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2486])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#5021])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#5020])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2763]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#4950]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2763]) +7 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#870])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2938])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#718])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#908])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          [PASS][117] -> [SKIP][118] ([Intel XE#4962]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#4962])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1489]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1128])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2387])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2850] / [Intel XE#929]) +15 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-8/igt@kms_psr@fbc-psr2-sprite-blt.html
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_psr@fbc-psr2-sprite-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1406]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#4609])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#3414]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#3414] / [Intel XE#3904])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [PASS][130] -> [DMESG-WARN][131] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][132] -> [FAIL][133] ([Intel XE#4459]) +1 other test fail
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#455]) +11 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_vrr@flipline.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1123])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eudebug@basic-read-event:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#4837] / [Intel XE#5565]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-3/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#4837]) +11 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#4837]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#4837]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#688])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-1/igt@xe_evict@evict-large-external.html
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#261] / [Intel XE#5564])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-4/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1392]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2322])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [PASS][144] -> [SKIP][145] ([Intel XE#1392]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-435/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#288] / [Intel XE#5561])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#288]) +15 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#2360]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][149] ([Intel XE#3868])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-9/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_system_allocator@once-new-busy-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#4915] / [Intel XE#5560]) +19 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-1/igt@xe_exec_system_allocator@once-new-busy-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#4943]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#4943]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#4208]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset.html

  * igt@xe_exec_system_allocator@process-many-new-nomemset:
    - shard-bmg:          [PASS][154] -> [SKIP][155] ([Intel XE#4945]) +438 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@xe_exec_system_allocator@process-many-new-nomemset.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_exec_system_allocator@process-many-new-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#4945]) +31 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#4915]) +191 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html

  * igt@xe_intel_bb@simple-bb:
    - shard-dg2-set2:     [PASS][158] -> [SKIP][159] ([Intel XE#4208]) +6 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-464/igt@xe_intel_bb@simple-bb.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@xe_intel_bb@simple-bb.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][160] -> [SKIP][161] ([Intel XE#2229]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@xe_live_ktest@xe_bo.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][162] -> [FAIL][163] ([Intel XE#5679]) +1 other test fail
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@xe_module_load@reload-no-display.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#3573]) +6 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#4650])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][167] -> [FAIL][168] ([Intel XE#4819]) +1 other test fail
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-464/igt@xe_pmu@gt-frequency.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@xe_pmu@gt-frequency.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#944])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-6/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#944])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-8/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#944]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#4130]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#4351])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [SKIP][174] ([Intel XE#4963]) -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@core_hotunplug@hotrebind.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@core_hotunplug@hotrebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][176] ([Intel XE#4674]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-bmg:          [SKIP][178] ([Intel XE#2134]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@fbdev@info.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@fbdev@info.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [SKIP][180] -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@intel_hwmon@hwmon-read.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-dg2-set2:     [TIMEOUT][182] -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-464/igt@kms_async_flips@async-flip-suspend-resume.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][184] ([Intel XE#3884]) -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][186] ([Intel XE#4947]) -> [PASS][187] +18 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][188] ([Intel XE#4543]) -> [PASS][189] +7 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][190] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][192] ([Intel XE#2291]) -> [PASS][193] +3 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [SKIP][194] ([Intel XE#4950]) -> [PASS][195] +79 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][196] ([Intel XE#4302]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][198] ([Intel XE#2316]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][200] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][202] ([Intel XE#301]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][204] ([Intel XE#4543]) -> [PASS][205] +9 other tests pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][206] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][208] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][209] +4 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][210] ([Intel XE#616]) -> [PASS][211] +1 other test pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][212] ([Intel XE#718]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-adlp:         [SKIP][214] ([Intel XE#4962]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_pm_rpm@basic-rte.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-1/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [SKIP][216] ([Intel XE#4962]) -> [PASS][217] +2 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_properties@invalid-properties-legacy:
    - shard-adlp:         [SKIP][218] ([Intel XE#4950]) -> [PASS][219] +3 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_properties@invalid-properties-legacy.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-8/igt@kms_properties@invalid-properties-legacy.html

  * igt@kms_psr@psr2-suspend@edp-1:
    - shard-lnl:          [FAIL][220] ([Intel XE#5298]) -> [PASS][221] +1 other test pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-7/igt@kms_psr@psr2-suspend@edp-1.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_psr@psr2-suspend@edp-1.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [SKIP][222] ([Intel XE#4692]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][224] ([Intel XE#1435]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind:
    - shard-adlp:         [SKIP][226] ([Intel XE#4945]) -> [PASS][227] +1 other test pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-9/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1392]) -> [PASS][229] +7 other tests pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [DMESG-WARN][230] ([Intel XE#3876]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-9/igt@xe_exec_reset@parallel-gt-reset.html
    - shard-bmg:          [DMESG-WARN][232] ([Intel XE#3876]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][234] ([Intel XE#4945]) -> [PASS][235] +428 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][236] ([Intel XE#4950]) -> [SKIP][237] ([Intel XE#873])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][238] ([Intel XE#2370]) -> [SKIP][239] ([Intel XE#4950]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][240] ([Intel XE#2327]) -> [SKIP][241] ([Intel XE#4947]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][242] ([Intel XE#4947]) -> [SKIP][243] ([Intel XE#2327]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][244] ([Intel XE#4947]) -> [SKIP][245] ([Intel XE#1124]) +14 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][246] ([Intel XE#1124]) -> [SKIP][247] ([Intel XE#4947]) +12 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][248] ([Intel XE#4947]) -> [SKIP][249] ([Intel XE#2328])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [SKIP][250] ([Intel XE#4947]) -> [SKIP][251] ([Intel XE#1124])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#2191]) -> [SKIP][253] ([Intel XE#4208] / [i915#2575])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][254] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][255] ([Intel XE#4950])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][256] ([Intel XE#367]) -> [SKIP][257] ([Intel XE#4950]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][258] ([Intel XE#4950]) -> [SKIP][259] ([Intel XE#367]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][260] ([Intel XE#4947]) -> [SKIP][261] ([Intel XE#2887]) +13 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-adlp:         [SKIP][262] ([Intel XE#4947]) -> [SKIP][263] ([Intel XE#455] / [Intel XE#787])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][265] ([Intel XE#4208])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][266] ([Intel XE#2887]) -> [SKIP][267] ([Intel XE#4947]) +13 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][268] ([Intel XE#3432]) -> [SKIP][269] ([Intel XE#4947]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][270] ([Intel XE#2724]) -> [SKIP][271] ([Intel XE#4947])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          [SKIP][272] ([Intel XE#2325]) -> [SKIP][273] ([Intel XE#4950]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_chamelium_color@ctm-max.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][274] ([Intel XE#4950]) -> [SKIP][275] ([Intel XE#2325]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][276] ([Intel XE#2252]) -> [SKIP][277] ([Intel XE#4950]) +11 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#373]) -> [SKIP][279] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          [SKIP][280] ([Intel XE#4950]) -> [SKIP][281] ([Intel XE#2252]) +11 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-adlp:         [SKIP][282] ([Intel XE#4950]) -> [SKIP][283] ([Intel XE#373])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][284] ([Intel XE#1178]) -> [SKIP][285] ([Intel XE#4950])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][286] ([Intel XE#2341]) -> [SKIP][287] ([Intel XE#4950])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_content_protection@content-type-change.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][288] ([Intel XE#4950]) -> [SKIP][289] ([Intel XE#2390])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][290] ([Intel XE#1178]) -> [SKIP][291] ([Intel XE#2341]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-8/igt@kms_content_protection@srm.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#455]) -> [SKIP][293] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@kms_content_protection@type1.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][294] ([Intel XE#4950]) -> [SKIP][295] ([Intel XE#2320]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][296] ([Intel XE#4950]) -> [SKIP][297] ([Intel XE#2321])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][298] ([Intel XE#2321]) -> [SKIP][299] ([Intel XE#4950]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x512.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][300] ([Intel XE#2320]) -> [SKIP][301] ([Intel XE#4950]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][302] ([Intel XE#2291]) -> [SKIP][303] ([Intel XE#4950])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-adlp:         [SKIP][304] ([Intel XE#4950]) -> [SKIP][305] ([Intel XE#309])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][306] ([Intel XE#2286]) -> [SKIP][307] ([Intel XE#4950])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][308] ([Intel XE#5428]) -> [SKIP][309] ([Intel XE#4947])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][310] ([Intel XE#4947]) -> [SKIP][311] ([Intel XE#4354])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][312] ([Intel XE#4354]) -> [SKIP][313] ([Intel XE#4947])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][314] ([Intel XE#2244]) -> [SKIP][315] ([Intel XE#4947])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][316] ([Intel XE#5425]) -> [SKIP][317] ([Intel XE#4947])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][318] ([Intel XE#2375]) -> [SKIP][319] ([Intel XE#4950])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-bmg:          [SKIP][320] ([Intel XE#2316]) -> [SKIP][321] ([Intel XE#4950])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-bmg:          [SKIP][322] ([Intel XE#4950]) -> [FAIL][323] ([Intel XE#5352])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_flip@absolute-wf_vblank.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [ABORT][324] ([Intel XE#4056]) -> [SKIP][325] ([Intel XE#4950])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][326] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][327] ([Intel XE#4947]) +4 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][328] ([Intel XE#4947]) -> [SKIP][329] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#651]) -> [SKIP][331] ([Intel XE#2351] / [Intel XE#4208])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         [SKIP][332] ([Intel XE#4947]) -> [SKIP][333] ([Intel XE#651])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][334] ([Intel XE#2312]) -> [SKIP][335] ([Intel XE#2311]) +7 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][336] ([Intel XE#2312]) -> [SKIP][337] ([Intel XE#4947]) +8 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][338] ([Intel XE#2311]) -> [SKIP][339] ([Intel XE#4947]) +34 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][340] ([Intel XE#4947]) -> [SKIP][341] ([Intel XE#5390]) +13 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][342] ([Intel XE#2312]) -> [SKIP][343] ([Intel XE#5390]) +3 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][344] ([Intel XE#5390]) -> [SKIP][345] ([Intel XE#2312])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][346] ([Intel XE#5390]) -> [SKIP][347] ([Intel XE#4947]) +11 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][348] ([Intel XE#2311]) -> [SKIP][349] ([Intel XE#2312]) +6 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#651]) -> [SKIP][351] ([Intel XE#4208])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          [SKIP][352] ([Intel XE#4947]) -> [SKIP][353] ([Intel XE#2311]) +31 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][354] ([Intel XE#4947]) -> [SKIP][355] ([Intel XE#2352]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][356] ([Intel XE#4947]) -> [SKIP][357] ([Intel XE#2313]) +31 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][358] ([Intel XE#2313]) -> [SKIP][359] ([Intel XE#2312]) +7 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][360] ([Intel XE#4947]) -> [SKIP][361] ([Intel XE#2312]) +9 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][362] ([Intel XE#2313]) -> [SKIP][363] ([Intel XE#4947]) +29 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][364] ([Intel XE#2352]) -> [SKIP][365] ([Intel XE#4947])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][366] ([Intel XE#2312]) -> [SKIP][367] ([Intel XE#2313]) +5 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][368] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][369] ([Intel XE#4950])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][370] ([Intel XE#346]) -> [SKIP][371] ([Intel XE#4947])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][372] ([Intel XE#4947]) -> [SKIP][373] ([Intel XE#3012])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][374] ([Intel XE#2934]) -> [SKIP][375] ([Intel XE#4947])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][376] ([Intel XE#4947]) -> [SKIP][377] ([Intel XE#2927])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][378] ([Intel XE#2927]) -> [SKIP][379] ([Intel XE#4947])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2925]) -> [SKIP][381] ([Intel XE#4208])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][382] ([Intel XE#2501]) -> [SKIP][383] ([Intel XE#4950])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][384] ([Intel XE#5021]) -> [SKIP][385] ([Intel XE#4950])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][386] ([Intel XE#4950]) -> [SKIP][387] ([Intel XE#5020])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][388] ([Intel XE#4950]) -> [SKIP][389] ([Intel XE#2763]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][390] ([Intel XE#2763]) -> [SKIP][391] ([Intel XE#4950]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][392] ([Intel XE#4947]) -> [SKIP][393] ([Intel XE#870]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][394] ([Intel XE#870]) -> [SKIP][395] ([Intel XE#4947])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][396] ([Intel XE#4947]) -> [SKIP][397] ([Intel XE#3309])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][398] ([Intel XE#4962]) -> [SKIP][399] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          [SKIP][400] ([Intel XE#1489]) -> [SKIP][401] ([Intel XE#4947]) +7 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         [SKIP][402] ([Intel XE#4947]) -> [SKIP][403] ([Intel XE#1489])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][404] ([Intel XE#4947]) -> [SKIP][405] ([Intel XE#1489]) +6 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][406] ([Intel XE#2387]) -> [SKIP][407] ([Intel XE#4947])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][408] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][409] ([Intel XE#4947]) +12 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][410] ([Intel XE#4947]) -> [SKIP][411] ([Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][412] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][413] ([Intel XE#4950])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][414] ([Intel XE#2330]) -> [SKIP][415] ([Intel XE#4950])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][416] ([Intel XE#4950]) -> [SKIP][417] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][418] ([Intel XE#2413]) -> [SKIP][419] ([Intel XE#4950])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][420] ([Intel XE#4950]) -> [SKIP][421] ([Intel XE#1435])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#1500]) -> [SKIP][423] ([Intel XE#362])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][424] ([Intel XE#2450]) -> [SKIP][425] ([Intel XE#4950])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_tv_load_detect@load-detect.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][426] ([Intel XE#2168]) -> [SKIP][427] ([Intel XE#4950])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_vrr@cmrr.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          [SKIP][428] ([Intel XE#4950]) -> [SKIP][429] ([Intel XE#1499])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][430] ([Intel XE#1499]) -> [SKIP][431] ([Intel XE#4950]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_vrr@max-min.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_vrr@max-min.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][432] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][433] ([Intel XE#4950]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][434] ([Intel XE#2504]) -> [SKIP][435] ([Intel XE#4945])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-adlp:         [SKIP][436] ([Intel XE#4945]) -> [SKIP][437] ([Intel XE#4837] / [Intel XE#5565])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          [SKIP][438] ([Intel XE#4945]) -> [SKIP][439] ([Intel XE#4837]) +11 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          [SKIP][440] ([Intel XE#4837]) -> [SKIP][441] ([Intel XE#4945]) +11 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][442] ([Intel XE#4945]) -> [SKIP][443] ([Intel XE#4518]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][444] ([Intel XE#2322]) -> [SKIP][445] ([Intel XE#4945]) +6 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][446] ([Intel XE#4945]) -> [SKIP][447] ([Intel XE#2322]) +3 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#288]) -> [SKIP][449] ([Intel XE#4208]) +1 other test skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][450] ([Intel XE#4943]) -> [SKIP][451] ([Intel XE#4945]) +25 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-malloc-multi-fault:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#4915]) -> [SKIP][453] ([Intel XE#4208]) +14 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-malloc-multi-fault.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-malloc-multi-fault.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][454] ([Intel XE#4945]) -> [SKIP][455] ([Intel XE#4943]) +17 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-stride-new-race-nomemset:
    - shard-bmg:          [SKIP][456] ([Intel XE#4945]) -> [DMESG-WARN][457] ([Intel XE#3428])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-new-race-nomemset.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-new-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][458] ([Intel XE#5018]) -> [FAIL][459] ([Intel XE#4937] / [Intel XE#5018])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset:
    - shard-adlp:         [SKIP][460] ([Intel XE#4945]) -> [SKIP][461] ([Intel XE#4915] / [Intel XE#5560]) +5 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-3/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][462] ([Intel XE#2248]) -> [SKIP][463] ([Intel XE#4945])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@xe_oa@oa-tlb-invalidate.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][464] ([Intel XE#2245]) -> [SKIP][465] ([Intel XE#4945])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@xe_pat@pat-index-xelp.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][466] ([Intel XE#4945]) -> [SKIP][467] ([Intel XE#2236])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][468] ([Intel XE#2284]) -> [SKIP][469] ([Intel XE#4945]) +1 other test skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@xe_pm@d3cold-basic.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          [SKIP][470] ([Intel XE#4945]) -> [SKIP][471] ([Intel XE#2284])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][472] ([Intel XE#4945]) -> [SKIP][473] ([Intel XE#579])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-bmg:          [SKIP][474] ([Intel XE#4945]) -> [SKIP][475] ([Intel XE#4650])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_pmu@all-fn-engine-activity-load.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          [SKIP][476] ([Intel XE#4945]) -> [SKIP][477] ([Intel XE#4733]) +4 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          [SKIP][478] ([Intel XE#4733]) -> [SKIP][479] ([Intel XE#4945]) +1 other test skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@xe_pxp@display-pxp-fb.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          [SKIP][480] ([Intel XE#944]) -> [SKIP][481] ([Intel XE#4945]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@xe_query@multigpu-query-config.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_query@multigpu-query-config.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          [SKIP][482] ([Intel XE#4130]) -> [SKIP][483] ([Intel XE#4945]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-bmg:          [SKIP][484] ([Intel XE#4945]) -> [SKIP][485] ([Intel XE#4130]) +1 other test skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [SKIP][486] ([Intel XE#4945]) -> [SKIP][487] ([Intel XE#4273])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-1/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][488] ([Intel XE#3342]) -> [SKIP][489] ([Intel XE#4945])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
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
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4056]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4056
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5298
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5428
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5574]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5574
  [Intel XE#5679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8477 -> IGT_8478
  * Linux: xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6 -> xe-pw-151773v6

  IGT_8477: 3e5ec9d06ce17d6e135901bda13957dc31ae4bf4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6: c2d04724123c8df9ecec874f1db3007540c264e6
  xe-pw-151773v6: 151773v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/index.html

--===============6861736034985798792==
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
<tr><td><b>Series:</b></td><td>Updates for drm/xe/configfs (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151773/">https://patchwork.freedesktop.org/series/151773/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6_FULL -&gt; xe-pw-151773v6_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151773v6_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-151773v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-151773v6_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-8/igt@xe_gt_freq@freq_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@xe_gt_freq@freq_suspend.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-463/igt@xe_pm@d3cold-i2c.html">SKIP</a> +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-4/igt@xe_pm@d3cold-i2c.html">SKIP</a> +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@xe_pm@d3cold-i2c.html">SKIP</a> +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-2/igt@xe_pm@d3cold-i2c.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151773v6_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-9/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5574">Intel XE#5574</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-2/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +181 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-9/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-4/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_flip@absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip@absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352">Intel XE#5352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip@absolute-wf_vblank-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352">Intel XE#5352</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +21 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106">Intel XE#3106</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +11 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@kms_lease@invalid-create-leases.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_lease@invalid-create-leases.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-8/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-3/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +11 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-1/igt@xe_evict@evict-large-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-4/igt@xe_evict@evict-large-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-435/igt@xe_exec_basic@multigpu-once-null-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-9/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-busy-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-1/igt@xe_exec_system_allocator@once-new-busy-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5560</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@xe_exec_system_allocator@process-many-new-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_exec_system_allocator@process-many-new-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +438 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +191 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@simple-bb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-464/igt@xe_intel_bb@simple-bb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@xe_intel_bb@simple-bb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679">Intel XE#5679</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-464/igt@xe_pmu@gt-frequency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-432/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819">Intel XE#4819</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-6/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-8/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@core_hotunplug@hotrebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674">Intel XE#4674</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@intel_hwmon@hwmon-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-464/igt@kms_async_flips@async-flip-suspend-resume.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> +79 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-1/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_properties@invalid-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-8/igt@kms_properties@invalid-properties-legacy.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-7/igt@kms_psr@psr2-suspend@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5298">Intel XE#5298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-3/igt@kms_psr@psr2-suspend@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-9/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-9/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +428 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-8/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5428">Intel XE#5428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425">Intel XE#5425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_flip@absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352">Intel XE#5352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4056">Intel XE#4056</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-multi-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-malloc-multi-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-malloc-multi-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-new-race-nomemset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-adlp-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-adlp-3/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5560</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-6/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-7/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_pmu@all-fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@xe_pmu@all-fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-6/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-4/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-7/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-1/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151773v6/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8477 -&gt; IGT_8478</li>
<li>Linux: xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6 -&gt; xe-pw-151773v6</li>
</ul>
<p>IGT_8477: 3e5ec9d06ce17d6e135901bda13957dc31ae4bf4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6: c2d04724123c8df9ecec874f1db3007540c264e6<br />
  xe-pw-151773v6: 151773v6</p>

</body>
</html>

--===============6861736034985798792==--
