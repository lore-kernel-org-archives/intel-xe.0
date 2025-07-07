Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01779C8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 18:02:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A0610E507;
	Mon,  7 Jul 2025 18:02:21 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3CD10E506;
 Mon,  7 Jul 2025 18:02:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0834351426537193738=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Cleaning_up_code_related_t?=
 =?utf-8?q?o_VRAM_regions_and_its_initialization_-_part_2_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Jul 2025 18:02:20 -0000
Message-ID: <175191134048.140981.14769518514305155409@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250707145609.3857467-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250707145609.3857467-1-piotr.piorkowski@intel.com>
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

--===============0834351426537193738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cleaning up code related to VRAM regions and its initialization - part 2 (rev12)
URL   : https://patchwork.freedesktop.org/series/149503/
State : failure

== Summary ==

CI Bug Log - changes from xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80_FULL -> xe-pw-149503v12_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149503v12_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149503v12_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149503v12_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html

  
#### Warnings ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][3] ([Intel XE#4156]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html

  
Known issues
------------

  Here are the changes found in xe-pw-149503v12_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6] ([Intel XE#4208])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@eof:
    - shard-adlp:         [PASS][7] -> [SKIP][8] ([Intel XE#2134])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-3/igt@fbdev@eof.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@fbdev@eof.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][9] -> [SKIP][10] ([Intel XE#2134]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@fbdev@read.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@fbdev@read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#4950])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][12] -> [DMESG-WARN][13] ([Intel XE#4543]) +11 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#664])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-3/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1407])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2327])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#4543]) +9 other tests dmesg-fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][20] ([Intel XE#4543])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#2191])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2191])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#367])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#367])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +6 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-4/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#787]) +23 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#3442])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][33] ([Intel XE#1727] / [Intel XE#3113]) +1 other test incomplete
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1727] / [Intel XE#3113])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#787]) +90 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#306])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2325])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#306])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-3/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2252]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#373]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#373]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#1178]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@kms_content_protection@atomic.html
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#3278])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#307])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#307])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#307])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2390])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#1178])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#308]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2321])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#308])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2321])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#2291]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-adlp:         [PASS][57] -> [SKIP][58] ([Intel XE#4950]) +6 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][59] -> [FAIL][60] ([Intel XE#5299])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#4354]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst.html
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#4356])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@kms_dp_link_training@uhbr-mst.html
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#4354])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#310]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-plain-flip:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1421]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2316])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#2316]) +7 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#4208] / [i915#2575]) +148 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@kms_flip@absolute-wf_vblank.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [TIMEOUT][71] ([Intel XE#1504]) +1 other test timeout
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-5/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][73] ([Intel XE#301]) +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][74] -> [DMESG-WARN][75] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1401]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#455]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1397] / [Intel XE#1745])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1397])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2293]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][83] -> [FAIL][84] ([Intel XE#1874]) +2 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#651])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2311]) +9 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#651]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#656]) +10 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         [PASS][89] -> [SKIP][90] ([Intel XE#4947])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][91] -> [SKIP][92] ([Intel XE#2351] / [Intel XE#4208]) +23 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#5390]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#651]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#656]) +17 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2312]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2351] / [Intel XE#4208])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#653])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2352])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1469])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2313]) +9 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#653]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#455]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#1503])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][105] -> [SKIP][106] ([Intel XE#3012])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#4596])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2763]) +4 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2763]) +7 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][111] -> [FAIL][112] ([Intel XE#718])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#3309])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-7/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#3309])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2893] / [Intel XE#4608])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4608]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#2893])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1489]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#1489]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1489]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1406]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-4/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-464/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-dpms@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#4609])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-1/igt@kms_psr@fbc-psr2-dpms@edp-1.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-4/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2234])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-8/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1127])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2330]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1127])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1127]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][132] -> [FAIL][133] ([Intel XE#2883]) +2 other tests fail
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-8/igt@kms_setmode@basic.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][134] -> [SKIP][135] ([Intel XE#1435]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1126])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-read-event:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#4837]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#4837])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-4/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#4837])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#4837])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#688])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][142] -> [SKIP][143] ([Intel XE#4208]) +295 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#1392]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2322]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#1392])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1392]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@twice-basic:
    - shard-adlp:         [PASS][148] -> [SKIP][149] ([Intel XE#4945]) +7 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-2/igt@xe_exec_compute_mode@twice-basic.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#288]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#288]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#2360])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][153] -> [DMESG-WARN][154] ([Intel XE#3876])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-stride-mmap-new-huge:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#4915]) +44 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-2/igt@xe_exec_system_allocator@many-stride-mmap-new-huge.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#4943]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#4208]) +36 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-ro-dontunmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#4915]) +31 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@twice-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#4943]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-7/igt@xe_exec_system_allocator@twice-mmap-new-huge-nomemset.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#584])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#586])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@xe_mmap@small-bar.html
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#512])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-1/igt@xe_mmap@small-bar.html

  * igt@xe_oa@invalid-map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#2541] / [Intel XE#3573])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@xe_oa@invalid-map-oa-buffer.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#5103])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#1337])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#944]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#944]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#944]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#944])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#4814])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@xe_render_copy@render-stress-1-copies.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#4814])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-434/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#3342])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#3342])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid:
    - shard-adlp:         NOTRUN -> [SKIP][174] ([Intel XE#4945])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_sysfs_scheduler@job_timeout_ms-invalid.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][175] ([Intel XE#911]) -> [PASS][176] +3 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb.html
    - shard-adlp:         [SKIP][179] ([Intel XE#2351] / [Intel XE#4947]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_big_fb@x-tiled-addfb.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-FAIL][181] ([Intel XE#4543]) -> [PASS][182] +6 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [FAIL][183] ([Intel XE#5376]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#4208] / [i915#2575]) -> [PASS][186] +9 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][187] ([Intel XE#2291]) -> [PASS][188] +5 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@default-dirtyfb-ioctl:
    - shard-adlp:         [SKIP][189] ([Intel XE#4947]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_dirtyfb@default-dirtyfb-ioctl.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@kms_dirtyfb@default-dirtyfb-ioctl.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][191] ([Intel XE#4294]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][193] ([Intel XE#2373]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-5/igt@kms_feature_discovery@display-2x.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][195] ([Intel XE#2316]) -> [PASS][196] +5 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][197] ([Intel XE#4543]) -> [PASS][198] +16 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-adlp:         [FAIL][199] ([Intel XE#3098]) -> [PASS][200] +1 other test pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-9/igt@kms_flip@plain-flip-fb-recreate.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][201] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][202] +1 other test pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][203] ([Intel XE#1503]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-6/igt@kms_hdr@static-swap.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_hdr@static-swap.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][205] ([Intel XE#4596]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][207] ([Intel XE#2571]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][209] ([Intel XE#718]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-adlp:         [SKIP][211] ([Intel XE#4962]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_pm_rpm@dpms-lpsp.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [SKIP][213] ([Intel XE#4692]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_vblank@query-busy:
    - shard-adlp:         [SKIP][215] ([Intel XE#4950]) -> [PASS][216] +12 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_vblank@query-busy.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_vblank@query-busy.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][217] ([Intel XE#4459]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_create@create-massive-size:
    - shard-adlp:         [SKIP][219] ([Intel XE#4945]) -> [PASS][220] +31 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_create@create-massive-size.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@xe_create@create-massive-size.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#4208]) -> [PASS][222] +32 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1392]) -> [PASS][224] +3 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_module_load@reload-no-display:
    - shard-adlp:         [DMESG-WARN][225] ([Intel XE#4792]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-8/igt@xe_module_load@reload-no-display.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-adlp:         [ABORT][227] ([Intel XE#4847]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-8/igt@xe_pm@s3-vm-bind-prefetch.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@xe_pm@s3-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-adlp:         [SKIP][229] ([Intel XE#1124]) -> [SKIP][230] ([Intel XE#4947]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#316]) -> [SKIP][232] ([Intel XE#4208]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#316]) -> [SKIP][234] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-adlp:         [SKIP][235] ([Intel XE#4947]) -> [SKIP][236] ([Intel XE#316])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         [SKIP][237] ([Intel XE#316]) -> [SKIP][238] ([Intel XE#4947])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][239] ([Intel XE#4543]) -> [SKIP][240] ([Intel XE#4947])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1124]) -> [SKIP][242] ([Intel XE#4208]) +12 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [SKIP][243] ([Intel XE#4947]) -> [DMESG-FAIL][244] ([Intel XE#4543])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][246] ([Intel XE#1124])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1124]) -> [SKIP][248] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         [SKIP][249] ([Intel XE#4947]) -> [SKIP][250] ([Intel XE#1124])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2191]) -> [SKIP][252] ([Intel XE#4208] / [i915#2575])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#367]) -> [SKIP][254] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         [SKIP][255] ([Intel XE#4950]) -> [SKIP][256] ([Intel XE#367])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][258] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-adlp:         [SKIP][259] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][260] ([Intel XE#4947])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#4208]) -> [SKIP][262] ([Intel XE#455] / [Intel XE#787])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-adlp:         [SKIP][263] ([Intel XE#4947]) -> [SKIP][264] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][266] ([Intel XE#455] / [Intel XE#787])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#3442]) -> [SKIP][268] ([Intel XE#4208])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-adlp:         [SKIP][269] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][270] ([Intel XE#455] / [Intel XE#787])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2907]) -> [SKIP][272] ([Intel XE#4208])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][273] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][274] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][276] ([Intel XE#4208]) +14 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#4418]) -> [SKIP][278] ([Intel XE#2351] / [Intel XE#4208])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         [SKIP][279] ([Intel XE#4950]) -> [SKIP][280] ([Intel XE#306])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_chamelium_color@ctm-0-50.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#306]) -> [SKIP][282] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_chamelium_color@gamma.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-adlp:         [SKIP][283] ([Intel XE#373]) -> [SKIP][284] ([Intel XE#4950])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-2/igt@kms_chamelium_edid@dp-mode-timings.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-adlp:         [SKIP][285] ([Intel XE#4950]) -> [SKIP][286] ([Intel XE#373]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#373]) -> [SKIP][288] ([Intel XE#4208] / [i915#2575]) +12 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-adlp:         [SKIP][289] ([Intel XE#4950]) -> [SKIP][290] ([Intel XE#455])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_content_protection@atomic.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][291] ([Intel XE#1178]) -> [SKIP][292] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#308]) -> [SKIP][294] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-adlp:         [SKIP][295] ([Intel XE#455]) -> [SKIP][296] ([Intel XE#4950]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-adlp:         [SKIP][297] ([Intel XE#309]) -> [SKIP][298] ([Intel XE#4950])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][299] ([Intel XE#4210]) -> [SKIP][300] ([Intel XE#5428])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#4354]) -> [SKIP][302] ([Intel XE#4208])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_dp_link_training@non-uhbr-mst.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-adlp:         [SKIP][303] ([Intel XE#4947]) -> [SKIP][304] ([Intel XE#4354])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-sst.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#4356]) -> [SKIP][306] ([Intel XE#4208])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-435/igt@kms_dp_link_training@uhbr-sst.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][307] ([Intel XE#4156]) -> [SKIP][308] ([Intel XE#5425])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#1138]) -> [SKIP][310] ([Intel XE#4208] / [i915#2575])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-adlp:         [SKIP][311] ([Intel XE#310]) -> [SKIP][312] ([Intel XE#4950])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-3/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         [SKIP][313] ([Intel XE#4950]) -> [SKIP][314] ([Intel XE#310])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_flip@2x-plain-flip.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-2/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-adlp:         [SKIP][315] ([Intel XE#4947]) -> [SKIP][316] ([Intel XE#455]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#455]) -> [SKIP][318] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#455]) -> [SKIP][320] ([Intel XE#4208]) +4 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][321] ([Intel XE#4947]) -> [SKIP][322] ([Intel XE#651]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#4208]) -> [SKIP][324] ([Intel XE#651]) +2 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][325] ([Intel XE#2312]) -> [SKIP][326] ([Intel XE#2311]) +14 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         [SKIP][327] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][328] ([Intel XE#656]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][329] ([Intel XE#2311]) -> [SKIP][330] ([Intel XE#2312]) +18 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][332] ([Intel XE#651])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-adlp:         [SKIP][333] ([Intel XE#651]) -> [INCOMPLETE][334] ([Intel XE#2594])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][335] ([Intel XE#2312]) -> [SKIP][336] ([Intel XE#5390]) +4 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [SKIP][337] ([Intel XE#4141]) -> [SKIP][338] ([Intel XE#5427])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         [SKIP][339] ([Intel XE#4947]) -> [SKIP][340] ([Intel XE#656]) +9 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][341] ([Intel XE#4141]) -> [SKIP][342] ([Intel XE#2312]) +11 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][343] ([Intel XE#4141]) -> [SKIP][344] ([Intel XE#5390]) +58 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#658]) -> [SKIP][346] ([Intel XE#2351] / [Intel XE#4208])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#651]) -> [SKIP][348] ([Intel XE#4208]) +28 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][349] ([Intel XE#651]) -> [SKIP][350] ([Intel XE#4947]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#651]) -> [SKIP][352] ([Intel XE#2351] / [Intel XE#4208]) +18 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-adlp:         [SKIP][353] ([Intel XE#656]) -> [SKIP][354] ([Intel XE#4947]) +2 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][356] ([Intel XE#653])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-adlp:         [SKIP][357] ([Intel XE#653]) -> [SKIP][358] ([Intel XE#4947])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-adlp:         [SKIP][359] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][360] ([Intel XE#653])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][361] ([Intel XE#4141]) -> [SKIP][362] ([Intel XE#5426])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-adlp:         [SKIP][363] ([Intel XE#4947]) -> [SKIP][364] ([Intel XE#653]) +3 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#653]) -> [SKIP][366] ([Intel XE#4208]) +31 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][367] ([Intel XE#2313]) -> [SKIP][368] ([Intel XE#2312]) +16 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#4208]) -> [SKIP][370] ([Intel XE#653]) +5 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][371] ([Intel XE#2312]) -> [SKIP][372] ([Intel XE#2313]) +8 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#653]) -> [SKIP][374] ([Intel XE#2351] / [Intel XE#4208]) +15 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][375] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][376] ([Intel XE#3544])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#4298]) -> [SKIP][378] ([Intel XE#4208])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#2927]) -> [SKIP][380] ([Intel XE#4208])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#2925]) -> [SKIP][382] ([Intel XE#4208]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#455]) -> [SKIP][384] ([Intel XE#4208] / [i915#2575]) +12 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#5020]) -> [SKIP][386] ([Intel XE#4208] / [i915#2575])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#1129]) -> [SKIP][388] ([Intel XE#4208])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#4208]) -> [SKIP][390] ([Intel XE#3309])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         [SKIP][391] ([Intel XE#4947]) -> [SKIP][392] ([Intel XE#3309])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_pm_dc@dc5-retention-flops.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         [SKIP][393] ([Intel XE#5319]) -> [SKIP][394] ([Intel XE#836])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#1489]) -> [SKIP][396] ([Intel XE#4208]) +12 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         [SKIP][397] ([Intel XE#4947]) -> [SKIP][398] ([Intel XE#1489])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][399] ([Intel XE#1489]) -> [SKIP][400] ([Intel XE#2893])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#1122]) -> [SKIP][402] ([Intel XE#4208])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#4208]) -> [SKIP][404] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-adlp:         [SKIP][405] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][406] ([Intel XE#4947]) +2 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_psr@fbc-pr-no-drrs.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][408] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][410] ([Intel XE#4208]) +14 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-render.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         [SKIP][411] ([Intel XE#4947]) -> [SKIP][412] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_psr@psr-basic.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@kms_psr@psr-basic.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2939]) -> [SKIP][414] ([Intel XE#4208])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#3414]) -> [SKIP][416] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#1127]) -> [SKIP][418] ([Intel XE#4208] / [i915#2575])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#330]) -> [SKIP][420] ([Intel XE#4208] / [i915#2575])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_ccs@large-ctrl-surf-copy:
    - shard-adlp:         [SKIP][421] ([Intel XE#4945]) -> [SKIP][422] ([Intel XE#3576])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_ccs@large-ctrl-surf-copy.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_ccs@large-ctrl-surf-copy.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1123]) -> [SKIP][424] ([Intel XE#4208])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-adlp:         [SKIP][425] ([Intel XE#944]) -> [SKIP][426] ([Intel XE#4945])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_create@multigpu-create-massive-size.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#5419]) -> [SKIP][428] ([Intel XE#4208]) +3 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_eu_stall@invalid-event-report-count.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#4208]) -> [SKIP][430] ([Intel XE#5419])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_eu_stall@invalid-gt-id.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-463/igt@xe_eu_stall@invalid-gt-id.html
    - shard-adlp:         [SKIP][431] ([Intel XE#4945]) -> [SKIP][432] ([Intel XE#5419])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_eu_stall@invalid-gt-id.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#4208]) -> [SKIP][434] ([Intel XE#4837]) +1 other test skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-466/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
    - shard-adlp:         [SKIP][435] ([Intel XE#4945]) -> [SKIP][436] ([Intel XE#4837])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-2/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#4837]) -> [SKIP][438] ([Intel XE#4208]) +23 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@xe_eudebug@vm-bind-clear-faultable.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-adlp:         [SKIP][439] ([Intel XE#4945]) -> [SKIP][440] ([Intel XE#688])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-adlp:         [SKIP][441] ([Intel XE#1392]) -> [SKIP][442] ([Intel XE#4945]) +2 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#1392]) -> [SKIP][444] ([Intel XE#4208])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         [SKIP][445] ([Intel XE#4945]) -> [SKIP][446] ([Intel XE#288]) +5 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#288]) -> [SKIP][448] ([Intel XE#4208]) +38 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-463/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#4208]) -> [SKIP][450] ([Intel XE#288]) +4 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-adlp:         [SKIP][451] ([Intel XE#2360]) -> [SKIP][452] ([Intel XE#4945])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-9/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#2360]) -> [SKIP][454] ([Intel XE#4208])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@many-large-mmap-file-mlock:
    - shard-adlp:         [SKIP][455] ([Intel XE#4915]) -> [SKIP][456] ([Intel XE#4945]) +19 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-3/igt@xe_exec_system_allocator@many-large-mmap-file-mlock.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_exec_system_allocator@many-large-mmap-file-mlock.html

  * igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#4208]) -> [SKIP][458] ([Intel XE#4915]) +31 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-466/igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:
    - shard-adlp:         [SKIP][459] ([Intel XE#4945]) -> [SKIP][460] ([Intel XE#4915]) +49 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#4915]) -> [SKIP][462] ([Intel XE#4208]) +394 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#255]) -> [SKIP][464] ([Intel XE#4208])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         [SKIP][465] ([Intel XE#4945]) -> [SKIP][466] ([Intel XE#512])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_mmap@small-bar.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@xe_mmap@small-bar.html
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#4208]) -> [SKIP][468] ([Intel XE#512])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_mmap@small-bar.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-464/igt@xe_mmap@small-bar.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-adlp:         [SKIP][469] ([Intel XE#4945]) -> [SKIP][470] ([Intel XE#2541] / [Intel XE#3573])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_oa@invalid-oa-format-id.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_oa@invalid-oa-format-id.html
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#4208]) -> [SKIP][472] ([Intel XE#2541] / [Intel XE#3573])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_oa@invalid-oa-format-id.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][474] ([Intel XE#4208]) +9 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-adlp:         [SKIP][475] ([Intel XE#4945]) -> [SKIP][476] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_oa@syncs-ufence-wait.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][478] ([Intel XE#4208]) +2 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-435/igt@xe_oa@syncs-userptr-wait-cfg.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         [SKIP][479] ([Intel XE#977]) -> [SKIP][480] ([Intel XE#4945])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-2/igt@xe_pat@pat-index-xe2.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#979]) -> [SKIP][482] ([Intel XE#4208])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-dg2-set2:     [FAIL][483] ([Intel XE#5421]) -> [SKIP][484] ([Intel XE#4208])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@xe_pm@d3hot-mmap-vram.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][486] ([Intel XE#4208])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#579]) -> [SKIP][488] ([Intel XE#4208])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#4650]) -> [SKIP][490] ([Intel XE#4208])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#4733]) -> [SKIP][492] ([Intel XE#4208]) +3 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#944]) -> [SKIP][494] ([Intel XE#4208]) +4 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#4208]) -> [SKIP][496] ([Intel XE#944])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html
    - shard-adlp:         [SKIP][497] ([Intel XE#4945]) -> [SKIP][498] ([Intel XE#944])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_query@multigpu-query-oa-units.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-2/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#4130]) -> [SKIP][500] ([Intel XE#4208])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#3342]) -> [SKIP][502] ([Intel XE#4208])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#4273]) -> [SKIP][504] ([Intel XE#4208])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@xe_sriov_flr@flr-twice.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_sriov_flr@flr-twice.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4847]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4847
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5319
  [Intel XE#5376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419
  [Intel XE#5421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5421
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5426
  [Intel XE#5427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427
  [Intel XE#5428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5428
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8438 -> IGT_8445
  * Linux: xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80 -> xe-pw-149503v12

  IGT_8438: 8438
  IGT_8445: 8445
  xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80: bf8cb3609bc5e03d788964e62c5d1f2c3e141e80
  xe-pw-149503v12: 149503v12

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/index.html

--===============0834351426537193738==
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
<tr><td><b>Series:</b></td><td>Cleaning up code related to VRAM regions and=
 its initialization - part 2 (rev12)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149503/">https://patchwork.freedesktop.org/series/149503/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149503v12/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149503v12/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3=
e141e80_FULL -&gt; xe-pw-149503v12_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149503v12_FULL absolutely need=
 to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-149503v12_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1495=
03v12_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-m=
ap-nomemset:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-lnl-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149503v12/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-=
execqueues-new-bo-map-nomemset.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_fbcon_fbt@fbc-suspend:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-3/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4156">Intel XE#4156</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@kms_fbcon_fb=
t@fbc-suspend.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149503v12_FULL that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@core_s=
etmaster@master-drop-set-user.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@core_setmast=
er@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-3/igt@fbdev@e=
of.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149503v12/shard-adlp-1/igt@fbdev@eof.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</=
li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@fbdev@=
read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149503v12/shard-dg2-436/igt@fbdev@read.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_async_flips@async-flip-=
with-page-flip-events-tiled-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a=
-1-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-3/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
03v12/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events-til=
ed@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +11 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-3/igt@kms_async_flips@test-cursor-=
atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_big_fb@4-tiled-8bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-5/igt@kms_big_fb@x-tiled-64bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-4/igt@kms_big_fb@x-tiled-64bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-=
adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.htm=
l">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4543">Intel XE#4543</a>) +9 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-ro=
tate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-=
rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_big_fb@yf-tiled-32bpp-ro=
tate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_bw@connected-linear-til=
ing-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_bw@connected-linear-ti=
ling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_bw@linear-tiling-2-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-7/igt@kms_bw@linear-tiling-2-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-4/igt@kms_ccs@bad-pixel-format-yf-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_ccs@bad-rotation-90-y-t=
iled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests=
 skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a=
-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@kms_ccs@crc-primary-suspend=
-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-mc-ccs@pipe-d-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#311=
3</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-=
tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +90 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-=
tiled-mtl-mc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_chamelium_color@ctm-0-=
25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2325">Intel XE#2325</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-3/igt@kms_chamelium_color@ctm-0-50=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid=
-change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid=
-change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-fa=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@kms_content_protection@atomi=
c.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1178">Intel XE#1178</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-1/igt@kms_content_protection@atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_content_protection@dp-=
mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_content_protection@dp-ms=
t-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@kms_content_protection@dp-m=
st-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@kms_content_protection@dp-ms=
t-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-432/igt@kms_content_protection@leg=
acy@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_cursor_crc@cursor-offs=
creen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_cursor_crc@cursor-offscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2321">Intel XE#2321</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@kms_cursor_crc@cursor-offsc=
reen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@kms_cursor_crc@cursor-offscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-7/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_curso=
r_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-3/igt@kms_cur=
sor_legacy@cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_cursor=
_legacy@cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_cursor_l=
egacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-7/igt@kms_dp_link_training@uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@kms_dp_link_training@uhbr-m=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4356">Intel XE#4356</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-3/igt@kms_dp_link_training@uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-5/igt@kms_flip@2x-plain-flip.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-1/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_fli=
p@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@kms_fl=
ip@absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_flip@absolute-wf=
_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +148 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-5/igt@kms_flip@bo-too-big-interrup=
tible@a-edp1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_flip@flip-vs-dpms-off-=
vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-1/igt@kms_flip@flip-vs-expired-vbl=
ank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-2/igt@kms_flip@fl=
ip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32b=
pp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#=
2380</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32b=
pp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#=
1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32b=
pp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Int=
el XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64=
bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#=
1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#22=
93</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adl=
p-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"=
>Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@kms_frontbuffer_tracking@dr=
rs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-7/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-463/igt@kms_frontbuffer_tracking@d=
rrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-a=
dlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-=
436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">I=
ntel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc=
drrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other=
 tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_frontbuffer_tracking@f=
bcpsr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@kms_frontbuffer_tracking@fb=
cpsr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc=
psr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2352">Intel XE#2352</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc=
psr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-6/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_frontbuffer_tracking@p=
sr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503=
">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-3/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-6/igt@kms_joiner@basic-f=
orce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_plane_multiple@2x=
-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-lnl-1/igt@kms_pm_d=
c@dc5-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149503v12/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel X=
E#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-7/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
9">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay=
-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay=
-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-7/igt@kms_psr2_sf@pr-cursor-plane-=
move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-pl=
ane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-4/igt@kms_psr@fbc-pr-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406=
">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_psr@fbc-pr-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-464/igt@kms_psr@fbc-psr2-dpms.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-1/igt@kms_psr@fbc-psr2-dpms@edp-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-4/igt@kms_psr@psr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">=
Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-8/igt@kms_psr@psr2-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-4/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-463/igt@kms_rotation_crc@primary-y=
f-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-6/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-8/igt@kms_setm=
ode@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149503v12/shard-bmg-4/igt@kms_setmode@basic.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel =
XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-3/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@kms_setmode@clone-e=
xclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@xe_copy_basic@mem-set-linea=
r-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@xe_eudebug@basic-read-even=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-4/igt@xe_eudebug@basic-vm-access-u=
serptr-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-5/igt@xe_eudebug@basic-vm-access-u=
serptr-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@xe_eudebug_online@debugger-=
reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-1/igt@xe_evict_ccs@evict-overcommi=
t-standalone-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_exe=
c_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_exec_ba=
lancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +295 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel X=
E#1392</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE=
#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-432/igt@xe_exec_basic@multigpu-no-=
exec-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-1/igt@xe_exec_basic@multigpu-no-ex=
ec-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-2/igt@xe_exec=
_compute_mode@twice-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_exec_compute_m=
ode@twice-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4945">Intel XE#4945</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@xe_exec_fault_mode@once-bin=
dexecqueue-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@xe_exec_fault_mode@once-bi=
ndexecqueue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@xe_exe=
c_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-435/igt@xe_exec_reset@pa=
rallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-huge:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-2/igt@xe_exec_system_allocator@ma=
ny-stride-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +44 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-6/igt@xe_exec_system_allocator@pro=
cess-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro=
-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_exec_system_allocator@t=
hreads-many-large-execqueues-mmap-remap-ro-eocheck.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-ro=
-dontunmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-463/igt@xe_exec_system_allocator@t=
hreads-shared-vm-many-stride-mmap-remap-ro-dontunmap.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-7/igt@xe_exec_system_allocator@twi=
ce-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-1/igt@xe_gt_freq@freq_suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">I=
ntel XE#586</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-1/igt@xe_mmap@small-bar.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">I=
ntel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@xe_oa@invalid-map-oa-buffer=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@xe_oa@mmio-triggered-repor=
ts-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5103">Intel XE#5103</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@xe_pat@display-vs-wb-transi=
ent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_query@multigpu-query-inv=
alid-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@xe_query@multigpu-query-topo=
logy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/igt@xe_query@multigpu-query-topo=
logy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@xe_query@multigpu-query-to=
pology-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@xe_render_copy@render-stres=
s-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-dg2-434/igt@xe_render_copy@render-stre=
ss-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3342">Intel XE#3342</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_sysfs_scheduler@job_time=
out_ms-invalid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-lnl-4/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel=
 XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149503v12/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-even=
ts-linear@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_bi=
g_fb@x-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-434=
/igt@kms_big_fb@x-tiled-addfb.html">PASS</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_big=
_fb@x-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/=
igt@kms_big_fb@x-tiled-addfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
503v12/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hfl=
ip.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-6/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5376">Intel XE#5376</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-=
bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a> +1=
 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-onscreen-64x64.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/s=
hard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-64x64.html">PASS</a> +9 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149503v12/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tran=
sitions-varying-size.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@default-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_dir=
tyfb@default-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@km=
s_dirtyfb@default-dirtyfb-ioctl.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-5/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@=
kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-5/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-4/igt@kms_f=
eature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bm=
g-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +5 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-2=
/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +16 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-9/igt@kms_fli=
p@plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_=
flip@plain-flip-fb-recreate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-3/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4921">Intel XE#4921</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_flip_=
scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-6/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@kms_hdr@static-swa=
p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-3/igt@kms_pla=
ne_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-6/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/i=
gt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-lnl-4/igt@kms_pm_d=
c@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_pm_=
rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-4/igt@kms_pm_rpm@dpms=
-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-lnl-7/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/sh=
ard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_vbl=
ank@query-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_vblank@que=
ry-busy.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-lnl-2/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-lnl-3/igt@kms_vrr@cmrr=
@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-massive-size:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_crea=
te@create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-6/igt@xe_cre=
ate@create-massive-size.html">PASS</a> +31 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_evi=
ct_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9503v12/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantf=
ree-reopen.html">PASS</a> +32 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel=
 XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149503v12/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-u=
serptr-invalidate-race.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-8/igt@xe_modu=
le_load@reload-no-display.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4792">Intel XE#4792</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/=
igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-8/igt@xe_pm@s=
3-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4847">Intel XE#4847</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@xe_pm@s3-=
vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-6/igt@kms_big=
_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@km=
s_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@k=
ms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@km=
s_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_big=
_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-2/igt@k=
ms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-4/igt@kms_big=
_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_=
big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">I=
ntel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149503v12/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-r=
otate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shar=
d-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel X=
E#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149503v12/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-=
0-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel =
XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stri=
de-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436=
/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_big=
_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v1=
2/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_bw=
@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12=
/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_bw=
@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-4=
36/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_bw@=
linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp=
-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503=
v12/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-6/igt@kms_ccs=
@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12=
/shard-adlp-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Int=
el XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_cc=
s@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-466=
/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_ccs=
@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-=
adlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
87">Intel XE#787</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_cc=
s@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49503v12/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_cc=
s@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg=
2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_ccs=
@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49503v12/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-43=
6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg=
2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12=
/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436=
/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_cha=
melium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@kms_cha=
melium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_ch=
amelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_chamel=
ium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-2/igt@kms_cha=
melium_edid@dp-mode-timings.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms=
_chamelium_edid@dp-mode-timings.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_cha=
melium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/sh=
ard-adlp-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">=
Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-463/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_chamel=
ium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +12 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_con=
tent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@kms_co=
ntent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_co=
ntent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@=
kms_content_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_cu=
rsor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436=
/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-4/igt@kms_cur=
sor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@k=
ms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-4/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/=
igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-4/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4210">Intel XE#4210</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-4/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5428">Intel XE#5428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_dp=
_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@=
kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_dp_=
link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@km=
s_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-435/igt@kms_dp=
_link_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_=
dp_link_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-7/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4156">Intel XE#4156</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-3/igt@kms_fbcon_fbt@fbc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5425">Intel XE#5425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@k=
ms_feature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-3/igt@kms_fli=
p@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_fl=
ip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_fli=
p@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-2/igt@kms_flip@2x-p=
lain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_fli=
p_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">In=
tel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149503v12/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-3=
2bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149503v12/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bp=
p-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-463/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149503v12/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-=
ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel X=
E#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149503v12/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-=
shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149503v12/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pr=
i-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
03v12/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/494=
7">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149503v12/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-pri=
mscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149503v12/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149503v12/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard=
-adlp-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/259=
4">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
03v12/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-8/igt@km=
s_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5427">Intel XE#5427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#=
4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149503v12/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49503v12/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v=
12/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5390">Intel XE#5390</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel=
 XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149503v12/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn=
-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +28 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149503v12/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-p=
ri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9503v12/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +18 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
03v12/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pl=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Inte=
l XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149503v12/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shar=
d-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">I=
ntel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v1=
2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-2/igt@=
kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5426">Intel XE#5426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v=
12/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE=
#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149503v12/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-sh=
rfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
03v12/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
03v12/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgfl=
ip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
03v12/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49503v12/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shr=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +15 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-bmg-2/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-bmg-1/=
igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_jo=
iner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@km=
s_joiner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_jo=
iner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_=
joiner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@kms_jo=
iner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/sh=
ard-dg2-436/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_pa=
nel_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms=
_panel_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_pl=
ane_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_pl=
ane_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_pm=
_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_pm_dc@dc5-ps=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_pm=
_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-464/igt@kms_=
pm_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_pm_=
dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@kms_pm=
_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-8/igt@kms_pm_=
rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5319">Intel XE#5319</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@=
kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-463/igt@kms_ps=
r2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel=
 XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149503v12/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-cont=
inuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_psr=
2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12=
/shard-adlp-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-lnl-1/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#148=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
503v12/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-=
fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@kms_ps=
r2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_psr=
2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_ps=
r@fbc-pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-466/igt@kms_psr@fbc-pr=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_psr=
@fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@k=
ms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_ps=
r@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard=
-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@kms_ps=
r@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-=
436/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +14 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@kms_psr=
@psr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-8/igt@kms_psr@psr-basic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@kms_ps=
r_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/=
shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_ro=
tation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_ro=
tation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard=
-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@kms_t=
v_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_ccs@=
large-ctrl-surf-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_ccs@l=
arge-ctrl-surf-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3576">Intel XE#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-463/igt@xe_cop=
y_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt=
@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_crea=
te@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt=
@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_eu_=
stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5419">Intel XE#5419</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436=
/igt@xe_eu_stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_eu_=
stall@invalid-gt-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-463/igt@xe_eu_st=
all@invalid-gt-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5419">Intel XE#5419</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_eu_s=
tall@invalid-gt-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@xe_eu_stal=
l@invalid-gt-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5419">Intel XE#5419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_eud=
ebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-d=
g2-466/igt@xe_eudebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#=
4837</a>) +1 other test skip</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_eude=
bug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-ad=
lp-2/igt@xe_eudebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#48=
37</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@xe_eud=
ebug@vm-bind-clear-faultable.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt=
@xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +23 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_evic=
t_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#494=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
503v12/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-standalone-instantfre=
e-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-6/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">I=
ntel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149503v12/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-m=
any-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-rebind.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-=
dg2-436/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_exec=
_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel=
 XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149503v12/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userp=
tr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-463/igt@xe_exe=
c_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436=
/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_exe=
c_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg=
2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-9/igt@xe_exec=
_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-ad=
lp-1/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#49=
45</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-=
dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-file-mlock:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-3/igt@xe_exec=
_system_allocator@many-large-mmap-file-mlock.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/s=
hard-adlp-1/igt@xe_exec_system_allocator@many-large-mmap-file-mlock.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/494=
5">Intel XE#4945</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_exe=
c_system_allocator@partial-middle-remap-no-cpu-fault.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
503v12/shard-dg2-466/igt@xe_exec_system_allocator@partial-middle-remap-no-c=
pu-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4915">Intel XE#4915</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_exec=
_system_allocator@process-many-execqueues-mmap-nomemset.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#=
4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149503v12/shard-adlp-1/igt@xe_exec_system_allocator@process-many-execqueues=
-mmap-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4915">Intel XE#4915</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-=
nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@xe_exe=
c_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_exec_system_allocator@threads=
-many-large-execqueues-malloc-mlock-nomemset.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
394 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_huc_copy@huc=
_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_mmap=
@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-9/igt@xe_mmap@small-bar.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/512">Intel XE#512</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_mma=
p@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-464/igt@xe_mmap@small-ba=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_oa@i=
nvalid-oa-format-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_oa@inv=
alid-oa-format-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_oa@=
invalid-oa-format-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-433/igt@xe_oa@i=
nvalid-oa-format-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_oa@=
oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v=
12/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_oa@s=
yncs-ufence-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-3/igt@xe_oa@syncs-=
ufence-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-435/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
03v12/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-2/igt@xe_pat@=
pat-index-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-1/igt@xe_pat@pat-index-=
xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-433/igt@xe_pat=
@pat-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_pat@pat-in=
dex-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@xe_pm@=
d3hot-mmap-vram.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5421">Intel XE#5421</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_pm@d3hot-=
mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@xe_pm@=
s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436=
/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-463/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_pm@vr=
am-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-464/igt@xe_pmu=
@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt=
@xe_pmu@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_pxp=
@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@=
xe_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-434/igt@xe_que=
ry@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_q=
uery@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-466/igt@xe_que=
ry@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-466/igt@x=
e_query@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-adlp-1/igt@xe_quer=
y@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-adlp-2/igt@xe_=
query@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-436/igt@xe_sri=
ov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel=
 XE#4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149503v12/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-repro=
vision-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-435/igt@xe_sri=
ov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe=
_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80/shard-dg2-432/igt@xe_sri=
ov_flr@flr-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4273">Intel XE#4273</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v12/shard-dg2-436/igt@xe_sriov_fl=
r@flr-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8438 -&gt; IGT_8445</li>
<li>Linux: xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80 -&gt; xe-pw-149=
503v12</li>
</ul>
<p>IGT_8438: 8438<br />
  IGT_8445: 8445<br />
  xe-3349-bf8cb3609bc5e03d788964e62c5d1f2c3e141e80: bf8cb3609bc5e03d788964e=
62c5d1f2c3e141e80<br />
  xe-pw-149503v12: 149503v12</p>

</body>
</html>

--===============0834351426537193738==--
