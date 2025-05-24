Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AD5C54FC6
	for <intel-xe@archiver.kernel.org>; Sat, 24 May 2025 12:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD2E10E069;
	Sat, 24 May 2025 12:40:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593F010E069;
 Sat, 24 May 2025 12:40:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8715269812408140673=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Add_user_command?=
 =?utf-8?q?s_to_WA_BB_via_configfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 24 May 2025 12:40:14 -0000
Message-ID: <174809041434.18984.16605962136537900687@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
In-Reply-To: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
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

--===============8715269812408140673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add user commands to WA BB via configfs
URL   : https://patchwork.freedesktop.org/series/149447/
State : failure

== Summary ==

CI Bug Log - changes from xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7_FULL -> xe-pw-149447v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149447v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149447v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149447v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-4/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
    - shard-dg2-set2:     NOTRUN -> [ABORT][3] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-8/igt@xe_pm@s4-mocs.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/igt@xe_pm@s4-mocs.html

  
Known issues
------------

  Here are the changes found in xe-pw-149447v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#827])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#3767]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#316]) +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#610])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#3658]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1124]) +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1407]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][14] ([Intel XE#4543]) +1 other test dmesg-fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#316]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1124])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2314] / [Intel XE#2894])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#2191]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2191]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2314] / [Intel XE#2894])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#367])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#367]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#787]) +132 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][28] -> [INCOMPLETE][29] ([Intel XE#3862]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#3432])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#2887]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +24 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#787]) +14 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][37] ([Intel XE#3124])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][38] ([Intel XE#1727] / [Intel XE#3113])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#4416]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#306]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2325])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#306]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2252])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#373]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#373]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#373]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#307])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#307])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#307])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2341])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#1178])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1424]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#455]) +6 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#308]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2320])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#309]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#323]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#309]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#2291])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#3009])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_dp_aux_dev.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#4356])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#2244])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1135])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-busy-flip:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#310]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][67] -> [FAIL][68] ([Intel XE#2882]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][69] -> [FAIL][70] ([Intel XE#301] / [Intel XE#3321])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][71] -> [FAIL][72] ([Intel XE#3321]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2316]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1421]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][76] ([Intel XE#301])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#301])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][79] -> [FAIL][80] ([Intel XE#301]) +2 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [PASS][81] -> [FAIL][82] ([Intel XE#886]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1397] / [Intel XE#1745])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1397])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1401] / [Intel XE#1745])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1401])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][87] -> [FAIL][88] ([Intel XE#1874])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][89] -> [DMESG-FAIL][90] ([Intel XE#4543])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#651]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2312]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2311])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#651]) +19 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#4141])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#651]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#656]) +9 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#653]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#656]) +16 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2313]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#653]) +11 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#3012])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2934])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#2927])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2763]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2763]) +11 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2763] / [Intel XE#455]) +7 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2763]) +11 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#2763]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2392])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [PASS][112] -> [FAIL][113] ([Intel XE#4741])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1489]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#1489]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2893] / [Intel XE#4608]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4608]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1489]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1406])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#4609])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1127])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1127])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#3414])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#3414] / [Intel XE#3904])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#3414])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][129] ([Intel XE#4212])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2450])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#2168])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][132] -> [SKIP][133] ([Intel XE#1499])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1499])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#756])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#455]) +12 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#5084])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-434/igt@xe_configfs@survivability-mode.html
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#5084])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@xe_configfs@survivability-mode.html
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#5084])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@xe_configfs@survivability-mode.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1123])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#4837]) +5 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#4837]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#4837]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#4837]) +6 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#261] / [Intel XE#688])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#688])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#688]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#1392]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1392]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2322])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html
    - shard-dg2-set2:     [PASS][151] -> [SKIP][152] ([Intel XE#1392]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#288]) +9 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html

  * igt@xe_exec_fault_mode@once-userptr-rebind-imm:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#288]) +11 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_exec_fault_mode@once-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#2360])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@many-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#4943]) +10 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@xe_exec_system_allocator@many-mmap-huge.html

  * igt@xe_exec_system_allocator@process-many-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#4943]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#4915]) +109 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#4915]) +114 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-nomemset.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#512])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185]) -> ([PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [SKIP][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211]) ([Intel XE#378])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-432/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-434/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-463/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-436/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-433/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-433/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-436/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-463/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-435/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-435/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-466/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-466/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-432/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-434/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-464/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-432/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-432/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-464/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-463/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-463/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-466/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-433/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-433/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-436/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-436/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-466/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-466/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-466/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-464/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-464/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-434/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-434/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-432/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-432/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-432/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - shard-dg2-set2:     NOTRUN -> [SKIP][212] ([Intel XE#2541] / [Intel XE#3573])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html

  * igt@xe_oa@rc6-disable:
    - shard-adlp:         NOTRUN -> [SKIP][213] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@xe_oa@rc6-disable.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#979])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-adlp:         NOTRUN -> [SKIP][215] ([Intel XE#1061])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@xe_peer2peer@write.html
    - shard-lnl:          NOTRUN -> [SKIP][216] ([Intel XE#1061])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][217] ([Intel XE#2284] / [Intel XE#366])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][218] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][219] ([Intel XE#2284])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][220] ([Intel XE#584]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@xe_pm@s3-mocs.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-adlp:         [PASS][221] -> [DMESG-WARN][222] ([Intel XE#4173]) +4 other tests dmesg-warn
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-lnl:          NOTRUN -> [SKIP][223] ([Intel XE#4650])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][224] ([Intel XE#4733])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][225] ([Intel XE#944]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][226] ([Intel XE#944])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-adlp:         NOTRUN -> [SKIP][227] ([Intel XE#944]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][228] ([Intel XE#4821])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][229] ([Intel XE#4351])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [FAIL][230] ([Intel XE#827]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][232] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][234] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][236] ([Intel XE#3124]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][238] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][240] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][242] ([Intel XE#4294]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][244] ([Intel XE#301]) -> [PASS][245] +2 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][246] ([Intel XE#3321]) -> [PASS][247] +2 other tests pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [SKIP][248] ([Intel XE#2316]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][250] ([Intel XE#886]) -> [PASS][251] +1 other test pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][252] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][253] +1 other test pass
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][254] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][256] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][257] +1 other test pass
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         [DMESG-FAIL][258] ([Intel XE#4543]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][260] ([Intel XE#1874]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-adlp:         [DMESG-WARN][262] ([Intel XE#4173]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#1392]) -> [PASS][265] +3 other tests pass
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [DMESG-WARN][266] ([Intel XE#3868]) -> [PASS][267]
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][268] ([Intel XE#1794]) -> [PASS][269] +1 other test pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-3/igt@xe_pm@s4-exec-after.html
    - shard-lnl:          [ABORT][270] ([Intel XE#1794]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-1/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][272] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][273] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][274] ([Intel XE#2049] / [Intel XE#2597]) -> [SKIP][275] ([Intel XE#2316])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][276] ([Intel XE#2312]) -> [SKIP][277] ([Intel XE#2311]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][278] ([Intel XE#2311]) -> [SKIP][279] ([Intel XE#2312]) +6 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][280] ([Intel XE#4141]) -> [SKIP][281] ([Intel XE#2312]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][282] ([Intel XE#2312]) -> [SKIP][283] ([Intel XE#4141]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][284] ([Intel XE#2312]) -> [SKIP][285] ([Intel XE#2313]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][286] ([Intel XE#2313]) -> [SKIP][287] ([Intel XE#2312]) +5 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][288] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][289] ([Intel XE#3544])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5084
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7 -> xe-pw-149447v1

  IGT_8379: 8379
  xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7: 5ed61f4a36b342006a85c561ce0d1ccdd035f9c7
  xe-pw-149447v1: 149447v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/index.html

--===============8715269812408140673==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add user commands to WA BB via confi=
gfs</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149447/">https://patchwork.freedesktop.org/series/149447/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149447v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149447v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd=
035f9c7_FULL -&gt; xe-pw-149447v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149447v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-149447v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1494=
47v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-2/igt@kms_atom=
ic_transition@plane-all-transition-fencing@pipe-a-dp-2.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-=
bmg-4/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.ht=
ml">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_setmode@invalid-clone-s=
ingle-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">ABORT</a> +1 other test abor=
t</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-8/igt@xe_pm@s4=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149447v1/shard-bmg-6/igt@xe_pm@s4-mocs.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149447v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-2/igt@kms_asyn=
c_flips@alternate-sync-async-flip@pipe-b-dp-2.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/ig=
t@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#8=
27</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a=
-hdmi-a-6-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@kms_async_flips@async-flip-=
with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">In=
tel XE#3767</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_big_fb@x-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-st=
ride-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmes=
g-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_bw@connected-linear-tili=
ng-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_bw@connected-linear-tilin=
g-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_bw@linear-tiling-2-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_bw@linear-tiling-3-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +132 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-bas=
ic-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +24 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y=
-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-46=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3124">Intel XE#3124</a>) +1 other test incomplete</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_chamelium_color@ctm-0-25=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_chamelium_color@ctm-red=
-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_chamelium_frames@vga-fram=
e-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-s=
torm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_content_protection@dp-ms=
t-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-434/igt@kms_content_protection@dp-m=
st-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_content_protection@srm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-432/igt@kms_content_protection@srm@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_cursor_crc@cursor-offscre=
en-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_cursor_crc@cursor-offscr=
een-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_cursor_legacy@2x-nonblock=
ing-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_cursor_legacy@basic-busy=
-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_cursor_=
legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_dp_link_training@uhbr-s=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_dsc@dsc-with-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_feature_discovery@psr1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_flip@2x-busy-flip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
0">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/s=
hard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-=
hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/sha=
rd-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-4/igt@kms=
_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_flip=
@2x-modeset-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_=
flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_flip@2x-plain-flip-fb-rec=
reate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@a-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-7/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_fli=
p@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-lnl-6/igt@kms_flip=
@plain-flip-ts-check@a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-6/igt@kms_flip@plain-fl=
ip-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE=
#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-1/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp=
-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-1/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp=
-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_frontbuffer_tracking@dr=
rs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_joiner@invalid-modeset-f=
orce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">I=
ntel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-463/igt@kms_pm=
_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@kms_pm_rpm@basic-pc=
i-d3-state.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4741">Intel XE#4741</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_psr@fbc-psr-primary-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page=
-flip@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-2/igt@kms_psr@pr-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">=
Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_psr@psr2-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_rotation_crc@primary-4-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-3/igt@kms_rotation_crc@primary-y-t=
iled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-1/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rot=
ation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@kms_setmode@invalid-clone-s=
ingle-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_vrr@lobf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_vrr@=
negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@kms_vrr@negative-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
9">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@kms_writeback@writeback-inva=
lid-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine=
_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@xe_compute_preempt@compute-=
preempt-many-all-ram@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-434/igt@xe_configfs@survivability-m=
ode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5084">Intel XE#5084</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@xe_configfs@survivability-mod=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5084">Intel XE#5084</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@xe_configfs@survivability-mo=
de.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5084">Intel XE#5084</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-line=
ar-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_eudebug@attach-debug-meta=
data.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@xe_eudebug@discovery-empty.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@xe_eudebug@vma-ufence-faultab=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_eudebug_online@resume-ds=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_evict@evict-beng-small-cm=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommi=
t-standalone-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit=
-standalone-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-n=
ull.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-once-null-rebind.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-432/igt@xe_exec_b=
asic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@xe_exec_fault_mode@many-exe=
cqueues-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_exec_fault_mode@once-user=
ptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@xe_exec_system_allocator@many=
-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4943">Intel XE#4943</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/igt@xe_exec_system_allocator@proc=
ess-many-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-large-malloc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +109 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-=
nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-large-mmap-new-race-nomemset.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a=
>) +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">In=
tel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-432/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-4=
63/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7=
/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd0=
35f9c7/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d=
1ccdd035f9c7/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c=
561ce0d1ccdd035f9c7/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b3420=
06a85c561ce0d1ccdd035f9c7/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a3=
6b342006a85c561ce0d1ccdd035f9c7/shard-dg2-435/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed=
61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-466/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-31=
33-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-466/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-432/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-464=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-d=
g2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/s=
hard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035=
f9c7/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561ce0d1c=
cdd035f9c7/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a85c561=
ce0d1ccdd035f9c7/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b342006a=
85c561ce0d1ccdd035f9c7/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f4a36b3=
42006a85c561ce0d1ccdd035f9c7/shard-dg2-433/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-5ed61f=
4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-433/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3133-=
5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-436/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-436/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149447v1/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/sh=
ard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-466/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149447v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-4=
63/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49447v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/s=
hard-dg2-436/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149447v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-=
436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149447v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/=
shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-464/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149447v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2=
-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-434/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149447v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-432/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149447v1/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-str=
eam-exec-q.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@xe_oa@rc6-disable.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">=
Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
9">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@xe_peer2peer@write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061"=
>Intel XE#1061</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">=
Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_pm@d3cold-basic-exec.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-463/igt@xe_pm@d3cold-mocs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@xe_pm@s3-mocs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel =
XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-8/igt@xe_pm_r=
esidency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-9/igt@xe_pm_residency@gt=
-c6-freeze@gt0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-3/igt@xe_pmu@fn-engine-activity-loa=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-po=
st-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-433/igt@xe_query@multigpu-query-eng=
ines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-lnl-2/igt@xe_query@multigpu-query-inval=
id-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-adlp-2/igt@xe_query@multigpu-query-uc-f=
w-version-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@xe_spin_batch@spin-mem-copy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149447v1/shard-dg2-436/igt@xe_sriov_scheduling@nonpree=
mpt-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-2/igt@kms_asyn=
c_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/sha=
rd-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149447v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel X=
E#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149447v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149447v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2-4=
66/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-1/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard=
-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard=
-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-6/i=
gt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-lnl-5/igt@kms_flip=
@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-7/igt@kms_f=
lip@flip-vs-absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/sha=
rd-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-432/igt@kms_fl=
ip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg=
2-433/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1=
/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-1/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149447v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a=
-1-x-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-1/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1494=
47v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-=
to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-8/igt@kms_pm_=
rpm@drm-resources-equal.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-8/igt@=
kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shar=
d-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">PASS</=
a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-3/igt@xe_exec=
_reset@cm-close-fd.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-1/igt@xe_ex=
ec_reset@cm-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-adlp-9/igt@xe_pm@s=
4-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-adlp-3/igt@xe_pm@s4-exec-af=
ter.html">PASS</a> +1 other test pass</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-lnl-2/igt@xe_pm@s4=
-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-lnl-1/igt@xe_pm@s4-exec-afte=
r.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-dg2=
-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-b=
mg-1/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
447v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149447v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49447v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9447v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
447v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v=
1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7/shard-bmg-6/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149447v1/shard-bmg-1/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7 -&gt; xe-pw-149=
447v1</li>
</ul>
<p>IGT_8379: 8379<br />
  xe-3133-5ed61f4a36b342006a85c561ce0d1ccdd035f9c7: 5ed61f4a36b342006a85c56=
1ce0d1ccdd035f9c7<br />
  xe-pw-149447v1: 149447v1</p>

</body>
</html>

--===============8715269812408140673==--
