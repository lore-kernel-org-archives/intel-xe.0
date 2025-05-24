Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46B6C54ED1
	for <intel-xe@archiver.kernel.org>; Sat, 24 May 2025 23:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A1010E21C;
	Sat, 24 May 2025 23:52:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1341D10E21C;
 Sat, 24 May 2025 23:52:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2817442767207725358=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Add_helper_funct?=
 =?utf-8?q?ion_to_inject_fault_into_ct=5Fdead=5Fcapture=28=29_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 24 May 2025 23:52:41 -0000
Message-ID: <174813076103.19168.13511533973336628088@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250524144613.11970-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250524144613.11970-1-satyanarayana.k.v.p@intel.com>
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

--===============2817442767207725358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add helper function to inject fault into ct_dead_capture() (rev6)
URL   : https://patchwork.freedesktop.org/series/148415/
State : failure

== Summary ==

CI Bug Log - changes from xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f_FULL -> xe-pw-148415v6_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148415v6_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148415v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148415v6_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-adlp:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_oa@mmio-triggered-reports-read.html

  
Known issues
------------

  Here are the changes found in xe-pw-148415v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-2-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][2] ([Intel XE#3767]) +15 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-2-4-mc-ccs.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1407])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#316]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#4543]) +2 other tests dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#316]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#2191])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2314] / [Intel XE#2894])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#2191])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#367]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#367])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#787]) +167 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2907]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][22] -> [INCOMPLETE][23] ([Intel XE#3862]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#787]) +20 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][27] ([Intel XE#3124] / [Intel XE#4345])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][28] ([Intel XE#1727] / [Intel XE#3113])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#3124])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][33] -> [DMESG-WARN][34] ([Intel XE#1727] / [Intel XE#3113])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#4416]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#306])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#306]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#373]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2252])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#373]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][42] ([Intel XE#1178])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-4/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#1178]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#3304])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#3278])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#1188])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1424])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#308])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2320])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2291]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#309])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2286])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#4354])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#4422])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1421])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][57] -> [FAIL][58] ([Intel XE#301] / [Intel XE#3321])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][59] -> [FAIL][60] ([Intel XE#301]) +6 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#301]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2316]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#301])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][66] -> [DMESG-WARN][67] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#886]) +2 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2293] / [Intel XE#2380])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2293])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-adlp:         [PASS][72] -> [DMESG-WARN][73] ([Intel XE#4173]) +4 other tests dmesg-warn
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#651]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#656]) +18 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#4141])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2352])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#651]) +12 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#651]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2311]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#656]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#653]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#653]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2313]) +6 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#1503])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1450]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1450] / [Intel XE#2568]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#4090])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#356])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][91] ([Intel XE#616]) +2 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#599]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#2763]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2763]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#870])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][98] ([Intel XE#718])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#908])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1489]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#2893])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1489]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1489]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#2168])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][108] -> [FAIL][109] ([Intel XE#4459]) +1 other test fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#1499])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#455]) +9 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#455]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#756])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#756])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1126])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#4497])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#4837]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable.html

  * igt@xe_eudebug@read-metadata:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#4837]) +5 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#4837]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#4837])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#688])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#261] / [Intel XE#688])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#688])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1392])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2322])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][126] -> [SKIP][127] ([Intel XE#1392]) +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1392]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#288]) +10 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#288]) +12 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_system_allocator@once-mmap-file-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#4915]) +104 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_exec_system_allocator@once-mmap-file-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#4943]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-mmap-huge.html

  * igt@xe_exec_system_allocator@process-many-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#4943]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@xe_exec_system_allocator@process-many-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#4915]) +87 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate:
    - shard-dg2-set2:     [PASS][135] -> [DMESG-WARN][136] ([Intel XE#3876])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@xe_exec_threads@threads-hang-userptr-invalidate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#2229])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162]) -> ([PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [SKIP][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188]) ([Intel XE#378])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-1/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-8/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-8/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-4/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-6/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-6/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-6/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-3/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-3/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-3/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-8/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-4/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-8/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-9/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-9/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-6/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-1/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-9/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-2/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-2/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-2/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-2/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-4/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-1/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-4/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-4/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-4/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-4/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-1/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-1/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-1/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-2/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-2/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-2/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-2/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-6/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-6/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-6/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-3/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-3/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-3/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-3/igt@xe_module_load@load.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@syncs-syncobj-none:
    - shard-adlp:         NOTRUN -> [SKIP][190] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_oa@syncs-syncobj-none.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#2541] / [Intel XE#3573])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][192] ([Intel XE#1173]) +1 other test fail
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][193] ([Intel XE#2427])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][194] ([Intel XE#2284] / [Intel XE#366])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][195] -> [ABORT][196] ([Intel XE#1794])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
    - shard-adlp:         NOTRUN -> [ABORT][197] ([Intel XE#1794])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][198] -> [ABORT][199] ([Intel XE#1794])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-8/igt@xe_pm@s4-exec-after.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][200] ([Intel XE#4733])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][201] ([Intel XE#944])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#944])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][203] ([Intel XE#3342])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][204] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][206] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-bmg:          [INCOMPLETE][208] ([Intel XE#3226]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][210] ([Intel XE#2291]) -> [PASS][211] +2 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][212] ([Intel XE#2316]) -> [PASS][213] +8 other tests pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][214] ([Intel XE#3321]) -> [PASS][215] +2 other tests pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][216] ([Intel XE#301]) -> [PASS][217] +3 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [FAIL][218] ([Intel XE#2882]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - shard-adlp:         [FAIL][220] ([Intel XE#2882]) -> [PASS][221] +1 other test pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     [INCOMPLETE][222] ([Intel XE#1035]) -> [PASS][223] +1 other test pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][224] ([Intel XE#1499]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-1/igt@kms_vrr@negative-basic.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-4/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@suspend-resume:
    - shard-dg2-set2:     [INCOMPLETE][226] ([Intel XE#4358]) -> [PASS][227] +1 other test pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-433/igt@xe_ccs@suspend-resume.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_ccs@suspend-resume.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1392]) -> [PASS][229] +9 other tests pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][230] ([Intel XE#5018]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind:
    - shard-dg2-set2:     [DMESG-WARN][232] ([Intel XE#3876]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-434/igt@xe_exec_threads@threads-hang-userptr-rebind.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-433/igt@xe_exec_threads@threads-hang-userptr-rebind.html

  * igt@xe_pm@s2idle-mocs:
    - shard-adlp:         [DMESG-WARN][234] ([Intel XE#4173]) -> [PASS][235] +2 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-1/igt@xe_pm@s2idle-mocs.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][236] ([Intel XE#1794]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-lnl-2/igt@xe_pm@s4-basic.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][238] ([Intel XE#1794]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][240] ([Intel XE#4819]) -> [PASS][241] +1 other test pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-434/igt@xe_pmu@gt-frequency.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-433/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic:
    - shard-adlp:         [DMESG-FAIL][242] ([Intel XE#4543] / [Intel XE#4626]) -> [DMESG-FAIL][243] ([Intel XE#4543])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-4/igt@kms_async_flips@crc-atomic.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-3/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][244] ([Intel XE#4626]) -> [FAIL][245] ([Intel XE#3884])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-3/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][246] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][247] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][248] ([Intel XE#2341]) -> [FAIL][249] ([Intel XE#1178])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][250] ([Intel XE#1188]) -> [SKIP][251] ([Intel XE#2341])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_content_protection@uevent.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][252] ([Intel XE#2312]) -> [SKIP][253] ([Intel XE#2311]) +11 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][254] ([Intel XE#2312]) -> [SKIP][255] ([Intel XE#4141]) +3 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][256] ([Intel XE#4141]) -> [SKIP][257] ([Intel XE#2312]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][258] ([Intel XE#2311]) -> [SKIP][259] ([Intel XE#2312]) +4 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][260] ([Intel XE#2313]) -> [SKIP][261] ([Intel XE#2312]) +7 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][262] ([Intel XE#2312]) -> [SKIP][263] ([Intel XE#2313]) +11 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4358
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4626
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f -> xe-pw-148415v6

  IGT_8380: 8380
  xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f: d57b26382f3d74ee116ca9ba777ddb349f44f10f
  xe-pw-148415v6: 148415v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/index.html

--===============2817442767207725358==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add helper function to inject fault =
into ct_dead_capture() (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148415/">https://patchwork.freedesktop.org/series/148415/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148415v6/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148415v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3138-d57b26382f3d74ee116ca9ba777ddb349=
f44f10f_FULL -&gt; xe-pw-148415v6_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148415v6_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148415v6_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1484=
15v6_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_oa@mmio-triggered-reports-read:<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_oa@mmio-triggered-reports=
-read.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148415v6_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d=
-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-432/igt@kms_async_flips@async-flip-=
with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-2-4-mc-ccs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel=
 XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/sha=
rd-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-r=
otate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-1/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_bw@connected-linear-til=
ing-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_bw@linear-tiling-1-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_bw@linear-tiling-2-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-ti=
led-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +167 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-463/igt@km=
s_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-bas=
ic-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_ccs@missing-ccs-buffer-y=
-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-46=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124=
">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg=
2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-463/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_chamelium_color@ctm-0-75.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_chamelium_color@degamma.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_chamelium_edid@hdmi-mod=
e-timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-stor=
m-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-wi=
th-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd-af=
ter-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-4/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_content_protection@lic-=
type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_content_protection@uevent=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_cursor_crc@cursor-offscre=
en-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_cursor_crc@cursor-random=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding=
-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-1/igt@kms_cursor_=
legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs=
-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_flip@2x-flip-vs-dpms.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/sha=
rd-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/sha=
rd-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired=
-vblank@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_flip=
@2x-plain-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148415v6/shard-bmg-1/igt@kms_flip@2x-plain-flip.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
6">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-7/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-3/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-6/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-lnl-3/igt@kms_flip=
@plain-flip-ts-check@b-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-5/igt@kms_flip@plain-fl=
ip-ts-check@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2=
380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-1/igt@kms_fli=
p_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-=
adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4173">Intel XE#4173</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_frontbuffer_tracking@drr=
s-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cpsr-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148415v6/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_invalid_mode@clock-too-hi=
gh@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1450">Intel XE#1450</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_invalid_mode@clock-too-hi=
gh@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_multipipe_modeset@basic-=
max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-432/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_plane_lowres@tiling-x@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_plane_scaling@planes-ups=
cale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_plane_scaling@planes-ups=
cale-20x20-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_plane_scaling@planes-up=
scale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_plane_scaling@planes-up=
scale-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_pm_backlight@bad-brightne=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">In=
tel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908=
">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-=
update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-prim=
ary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_psr2_sf@psr2-overlay-pla=
ne-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_psr@fbc-psr-primary-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_psr@psr-cursor-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_psr@psr2-cursor-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_vrr@cmrr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-lnl-8/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148415v6/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@kms_vrr@flip-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">=
Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@kms_vrr@flip-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_writeback@writeback-fb-=
id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@kms_writeback@writeback-pixe=
l-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_copy_basic@mem-set-linea=
r-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_eu_stall@invalid-sampling=
-rate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@xe_eudebug@basic-vm-access-pa=
rameters-userptr-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_eudebug@read-metadata.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_eudebug_online@resume-ds=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@xe_eudebug_online@writes-cach=
ing-vram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@xe_evict@evict-beng-large-ext=
ernal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_evict@evict-large-multi-v=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_evict_ccs@evict-overcommi=
t-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exe=
c-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_exec_fault_mode@many-user=
ptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_exec_system_allocator@onc=
e-mmap-file-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +104 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@xe_exec_system_allocator@proc=
ess-many-large-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@xe_exec_system_allocator@proc=
ess-many-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_exec_system_allocator@th=
reads-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +87 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-463/igt@xe_exe=
c_threads@threads-hang-userptr-invalidate.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@x=
e_exec_threads@threads-hang-userptr-invalidate.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#387=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@xe_live_ktest@xe_migrate@xe_v=
alidate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-ad=
lp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/sha=
rd-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10=
f/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f=
44f10f/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777dd=
b349f44f10f/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba=
777ddb349f44f10f/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116=
ca9ba777ddb349f44f10f/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74=
ee116ca9ba777ddb349f44f10f/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382=
f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b=
26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138=
-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-9/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-9/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-ad=
lp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10=
f/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f=
44f10f/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba777dd=
b349f44f10f/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116ca9ba=
777ddb349f44f10f/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3138-d57b26382f3d74ee116=
ca9ba777ddb349f44f10f/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/=
shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-4/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-148415v6/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1484=
15v6/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-148415v6/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-a=
dlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_module_load@load=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148415v6/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/sh=
ard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-148415v6/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148415v6/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415=
v6/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-6/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148415v6/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adl=
p-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48415v6/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148415v6/shard-adlp-3/igt@xe_module_load@load.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Int=
el XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_oa@missing-sample-flags.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_oa@syncs-syncobj-none.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_oa@whitelisted-registers-=
userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">=
Intel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_pm@d3cold-basic-exec.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-lnl-8/igt@xe_pm@s4=
-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148415v6/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1794">Intel XE#1794</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-8/igt@xe_pm@s=
4-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">=
Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_pxp@pxp-termination-key-u=
pdate-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_query@multigpu-query-cs-=
cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-bmg-2/igt@xe_query@multigpu-query-gt-li=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_sriov_flr@flr-vf1-clear.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-436/igt@kms_=
ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a> +1 oth=
er test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-2/igt@kms_curs=
or_legacy@cursor-vs-flip-toggle.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg=
-2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-4/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/s=
hard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">=
PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148415v6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b=
d-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415=
v6/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a=
6.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-432/igt@kms_fl=
ip@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-4=
36/igt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-6/igt@kms_fli=
p@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/sh=
ard-adlp-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-432/igt@kms_pl=
ane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/sh=
ard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-1/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-4/igt@kms_vrr@negative=
-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-433/igt@xe_ccs=
@suspend-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4358">Intel XE#4358</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@xe_ccs@=
suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-=
dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> +=
9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-lnl-6/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018"=
>Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148415v6/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-=
vm-many-large-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-434/igt@xe_exe=
c_threads@threads-hang-userptr-rebind.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/sha=
rd-dg2-433/igt@xe_exec_threads@threads-hang-userptr-rebind.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-1/igt@xe_pm@s=
2idle-mocs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-9/igt@xe_pm@s2idle-=
mocs.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-lnl-2/igt@xe_pm@s4=
-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148415v6/shard-lnl-1/igt@xe_pm@s4-basic.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-adlp-8/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-434/igt@xe_pmu=
@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4819">Intel XE#4819</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-433/igt@xe_pmu@gt-frequ=
ency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4626">Intel XE#4626</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-a=
dlp-3/igt@kms_async_flips@crc-atomic.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4626">Intel XE#4626</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard=
-adlp-3/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3=
884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-dg2-435/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-1/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-4/igt@kms_=
content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v6/shard-bmg-1/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1484=
15v6/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48415v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1484=
15v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148415v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48415v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
415v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f -&gt; xe-pw-148=
415v6</li>
</ul>
<p>IGT_8380: 8380<br />
  xe-3138-d57b26382f3d74ee116ca9ba777ddb349f44f10f: d57b26382f3d74ee116ca9b=
a777ddb349f44f10f<br />
  xe-pw-148415v6: 148415v6</p>

</body>
</html>

--===============2817442767207725358==--
