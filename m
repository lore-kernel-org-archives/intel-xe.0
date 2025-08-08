Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF370C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 22:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CAC10E1FB;
	Fri,  8 Aug 2025 22:47:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C729D10E091;
 Fri,  8 Aug 2025 22:47:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1009341320997502331=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/intel/pciids=3A_Add_ma?=
 =?utf-8?q?tch_on_vendor/id_only?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Aug 2025 22:47:06 -0000
Message-ID: <175469322680.223934.7848039600495333320@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250808-intel-pci-device-v1-1-ce3545d86502@intel.com>
In-Reply-To: <20250808-intel-pci-device-v1-1-ce3545d86502@intel.com>
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

--===============1009341320997502331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/intel/pciids: Add match on vendor/id only
URL   : https://patchwork.freedesktop.org/series/152703/
State : success

== Summary ==

CI Bug Log - changes from xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7_FULL -> xe-pw-152703v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-152703v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2233])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          [PASS][2] -> [FAIL][3] ([Intel XE#3718] / [Intel XE#827]) +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2370])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1124]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-8/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#316]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#610])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][11] ([Intel XE#4543])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#607])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +11 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2314] / [Intel XE#2894])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#367]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#367])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#367])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +6 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#787]) +17 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +181 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +33 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2669]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][27] ([Intel XE#3124])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][28] ([Intel XE#1727] / [Intel XE#3113])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#2907])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#306]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@kms_chamelium_color@gamma.html
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2325])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-7/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#373]) +6 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#373]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2252]) +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#307])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#307])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#1188]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2320]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#308]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2321])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2291]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [PASS][43] -> [DMESG-WARN][44] ([Intel XE#5354])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#309]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#4354])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#4331])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#776]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#776]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#310]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2316]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#301] / [Intel XE#3149])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#301]) +2 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][58] -> [FAIL][59] ([Intel XE#5416])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#5408])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html

  * igt@kms_flip@plain-flip-ts-check@d-hdmi-a1:
    - shard-adlp:         [PASS][62] -> [DMESG-WARN][63] ([Intel XE#4543])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-4/igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-2/igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2293]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2311]) +16 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#651]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#656]) +6 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#5390]) +9 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#658])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#651]) +18 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#653]) +24 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2313]) +14 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#656])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2352])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#653]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#1503])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#3012])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2927])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#2927])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_lease@simple-lease:
    - shard-adlp:         [PASS][83] -> [ABORT][84] ([Intel XE#2953])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-9/igt@kms_lease@simple-lease.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-2/igt@kms_lease@simple-lease.html

  * igt@kms_lease@simple-lease@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][85] -> [ABORT][86] ([Intel XE#2953] / [Intel XE#4173])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-9/igt@kms_lease@simple-lease@pipe-a-hdmi-a-1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-2/igt@kms_lease@simple-lease@pipe-a-hdmi-a-1.html

  * igt@kms_plane@pixel-format@pipe-b-plane-0:
    - shard-adlp:         NOTRUN -> [FAIL][87] ([Intel XE#5195]) +4 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_plane@pixel-format@pipe-b-plane-0.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][88] ([Intel XE#616]) +3 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#4596])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-adlp:         [PASS][91] -> [DMESG-WARN][92] ([Intel XE#2953] / [Intel XE#4173]) +15 other tests dmesg-warn
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-1/igt@kms_plane_scaling@invalid-num-scalers.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-9/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#870])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#836])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1489]) +5 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1489]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#1489]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1122])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1406])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#4609])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@pr-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@kms_psr@pr-basic.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#3414])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#3414])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#455]) +5 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2450])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2168])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_vrr@cmrr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2168])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-435/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#455]) +9 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1499]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_vrr@max-min.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1447] / [Intel XE#5617])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#5626])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@xe_eu_stall@invalid-gt-id.html
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#5626])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#4837]) +7 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#4837]) +10 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#4837] / [Intel XE#5565]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#4837])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-lnl-5/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#1392]) +5 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1392])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1392] / [Intel XE#5575]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2322]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#288] / [Intel XE#5561]) +5 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#288]) +19 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#2360] / [Intel XE#5573])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][127] -> [DMESG-WARN][128] ([Intel XE#3876])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-9/igt@xe_exec_reset@parallel-gt-reset.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-9/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-race:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#4915]) +74 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_exec_system_allocator@many-large-execqueues-mmap-race.html

  * igt@xe_exec_system_allocator@partial-remap-no-cpu-fault:
    - shard-bmg:          [PASS][130] -> [FAIL][131] ([Intel XE#4937])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-3/igt@xe_exec_system_allocator@partial-remap-no-cpu-fault.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-8/igt@xe_exec_system_allocator@partial-remap-no-cpu-fault.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#4943]) +18 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#4915]) +172 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#4943]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-dg2-set2:     [PASS][135] -> [DMESG-WARN][136] ([Intel XE#3876])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-dg2-466/igt@xe_exec_threads@threads-hang-rebind.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][137] ([Intel XE#5530])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#512])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][139] -> [DMESG-WARN][140] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5244])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-8/igt@xe_module_load@many-reload.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_module_load@many-reload.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#3573]) +4 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-435/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#3573]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#979])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#5694])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2284])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3hot-basic:
    - shard-bmg:          [PASS][146] -> [ABORT][147] ([Intel XE#4760] / [Intel XE#5545])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-7/igt@xe_pm@d3hot-basic.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-4/igt@xe_pm@d3hot-basic.html
    - shard-adlp:         [PASS][148] -> [ABORT][149] ([Intel XE#5545])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-9/igt@xe_pm@d3hot-basic.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-9/igt@xe_pm@d3hot-basic.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][150] ([Intel XE#4504])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#4733])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#4733])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_pxp@display-pxp-fb.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#4733])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#944]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#944]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#944])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#3342])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#4273])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@xe_sriov_flr@flr-twice.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [INCOMPLETE][159] -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][161] ([Intel XE#4543]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          [FAIL][163] ([Intel XE#5376]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][165] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][167] ([Intel XE#2291]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][169] ([Intel XE#4302]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][171] ([Intel XE#2316]) -> [PASS][172] +5 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-adlp:         [DMESG-WARN][173] ([Intel XE#4543]) -> [PASS][174] +4 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-8/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][175] ([Intel XE#5208]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-1/igt@kms_flip@flip-vs-rmfb.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][177] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][179] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][181] ([Intel XE#4596]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-none:
    - shard-adlp:         [DMESG-WARN][183] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][184] +6 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-4/igt@kms_plane_multiple@tiling-none.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@kms_plane_multiple@tiling-none.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1392]) -> [PASS][186] +3 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  
#### Warnings ####

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-lnl:          [ABORT][187] -> [SKIP][188] ([Intel XE#373])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][189] ([Intel XE#1178]) -> [SKIP][190] ([Intel XE#2341]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-3/igt@kms_content_protection@legacy.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][191] ([Intel XE#2312]) -> [SKIP][192] ([Intel XE#2311]) +8 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][193] ([Intel XE#2311]) -> [SKIP][194] ([Intel XE#2312]) +14 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][195] ([Intel XE#2312]) -> [SKIP][196] ([Intel XE#5390])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][197] ([Intel XE#5390]) -> [SKIP][198] ([Intel XE#2312]) +9 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][199] ([Intel XE#2312]) -> [SKIP][200] ([Intel XE#2313]) +8 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][201] ([Intel XE#2313]) -> [SKIP][202] ([Intel XE#2312]) +12 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][203] ([Intel XE#5021]) -> [SKIP][204] ([Intel XE#4596])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([DMESG-WARN][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [SKIP][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230]) ([Intel XE#2953] / [Intel XE#378] / [Intel XE#4173] / [Intel XE#5612]) -> ([PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [SKIP][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256]) ([Intel XE#378] / [Intel XE#5612])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-1/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-3/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-3/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-9/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-9/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-4/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-4/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-6/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-9/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-3/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-3/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-8/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-3/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-6/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-1/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-1/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-1/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-8/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-8/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-2/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-2/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-6/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-8/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-2/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-2/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-1/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-3/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-3/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-3/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-1/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-2/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-2/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-6/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-2/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-9/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-9/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-9/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-1/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-6/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-3/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-6/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-9/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-6/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-6/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5244
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416
  [Intel XE#5503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5503
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5573
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5617]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5617
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7 -> xe-pw-152703v1

  IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7: 1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7
  xe-pw-152703v1: 152703v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/index.html

--===============1009341320997502331==
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
<tr><td><b>Series:</b></td><td>drm/intel/pciids: Add match on vendor/id onl=
y</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152703/">https://patchwork.freedesktop.org/series/152703/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152703v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152703v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3520-1b96c6f660be3e8b1398037f3dff9df6f=
0cdb7b7_FULL -&gt; xe-pw-152703v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152703v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bm=
g-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
18">Intel XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_big_fb@4-tiled-16bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-8/igt@kms_big_fb@y-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_bw@linear-tiling-3-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-ti=
led-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-=
tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +181 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@kms_chamelium_color@gamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-7/igt@kms_chamelium_color@gamma.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edi=
d-stress-resolution-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-463/igt@kms_content_protection@dp-m=
st-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@kms_content_protection@dp-ms=
t-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_content_protection@uevent=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-3/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-1/igt@kms_c=
ursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-4/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_dp_link_trainin=
g@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_dp_linktrain_fallback@ds=
c-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/776">Intel XE#776</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_flip@2x-nonexisting-fb-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-3/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_=
flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-lnl-1/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-lnl-7/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-8/igt@kms_flip=
@plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_fli=
p@plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5416">Intel XE#5416</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-8/igt@kms_flip=
@plain-flip-fb-recreate-interruptible@a-dp2.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@k=
ms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-4/igt@kms_fli=
p@plain-flip-ts-check@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-2/igt@kms_flip@pla=
in-flip-ts-check@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drr=
s-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
c-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +24 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-3/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_hdr@static-toggle-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-7/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-435/igt@kms_joiner@basic-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-9/igt@kms_lea=
se@simple-lease.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-2/igt@kms_lease@simple-lease.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple-lease@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-9/igt@kms_lea=
se@simple-lease@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-2/igt@kms_lease@si=
mple-lease@pipe-a-hdmi-a-1.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_plane@pixel-format@pipe-=
b-plane-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5195">Intel XE#5195</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-463/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_plane_multiple@2x-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-1/igt@kms_pla=
ne_scaling@invalid-num-scalers.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-9/igt@kms_plane_sca=
ling@invalid-num-scalers.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +=
15 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870=
">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_pm_rpm@dpms-non-lpsp.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-=
update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_psr@fbc-psr-primary-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@kms_psr@fbc-psr2-cursor-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-blt@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@kms_psr@pr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@kms_rotation_crc@sprite-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rot=
ation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@kms_scaling_modes@scaling-mo=
de-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-435/igt@kms_vrr@cmrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@kms_vrr@flip-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_compute@ccs-mode-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1447">Intel XE#1447</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5617">Intel XE#5617</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@xe_eu_stall@invalid-gt-id.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5626">Intel XE#5626</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_eu_stall@invalid-gt-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@xe_eudebug@basic-read-event.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@xe_eudebug_online@debugger-=
reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4837">Intel XE#4837</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_eudebug_online@pagefault-=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-lnl-5/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-sram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-bind.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@x=
e_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-e=
xec-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-ex=
ec-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-us=
erptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinn=
er-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360">Intel XE#2360</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5573">Intel XE#5573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-9/igt@xe_exec=
_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-9/igt@xe_exec_reset@paral=
lel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_exec_system_allocator@man=
y-large-execqueues-mmap-race.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +74 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-remap-no-cpu-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-3/igt@xe_exec_=
system_allocator@partial-remap-no-cpu-fault.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-8/igt@x=
e_exec_system_allocator@partial-remap-no-cpu-fault.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#4937=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-1/igt@xe_exec_system_allocator@thre=
ads-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +18 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@xe_exec_system_allocator@th=
reads-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +172 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-lnl-5/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-huge.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-dg2-466/igt@xe_exe=
c_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-464/igt@xe_exec_threa=
ds@threads-hang-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-7/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_mmap@small-bar.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">I=
ntel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-8/igt@xe_modu=
le_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_module_load@many-relo=
ad.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5244">Intel XE#5244</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-435/igt@xe_oa@polling-small-buf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_oa@privileged-forked-acce=
ss-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@xe_pm@d3cold-i2c.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">=
Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-7/igt@xe_pm@d3=
hot-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-152703v1/shard-bmg-4/igt@xe_pm@d3hot-basic.html">ABORT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel =
XE#4760</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5545">Intel XE#5545</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-9/igt@xe_pm@d=
3hot-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152703v1/shard-adlp-9/igt@xe_pm@d3hot-basic.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Inte=
l XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-435/igt@xe_pm@s2idle-exec-after.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_pxp@display-pxp-fb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/47=
33">Intel XE#4733</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@xe_pxp@display-pxp-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-bmg-5/igt@xe_query@multigpu-query-cs-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@xe_query@multigpu-query-mem=
-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_query@multigpu-query-mem-=
usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-436/igt@xe_sriov_flr@flr-each-isola=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152703v1/shard-dg2-466/igt@xe_sriov_flr@flr-twice.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-dg2-432/igt@kms_bi=
g_fb@4-tiled-16bpp-rotate-180.html">INCOMPLETE</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-432/igt@kms_big=
_fb@4-tiled-16bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-152703v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-180-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-2/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376">Intel XE#5376=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1527=
03v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a=
-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-dg2-433/igt@kms_ccs@random-cc=
s-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-7/i=
gt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-6/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-7/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg=
-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +5 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-8/igt@kms_fli=
p@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/i=
gt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-1/igt@kms_fli=
p@flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-9/igt@kms_flip@=
flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-4/igt@kms_flip=
@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-=
8/igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Int=
el XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-152703v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-7/igt@kms_p=
lane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-4/igt@kms_pla=
ne_multiple@tiling-none.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/sha=
rd-adlp-8/igt@kms_plane_multiple@tiling-none.html">PASS</a> +6 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel X=
E#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152703v1/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-lnl-7/igt@kms_cham=
elium_hpd@dp-hpd-enable-disable-mode.html">ABORT</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-lnl-5/igt@kms_cha=
melium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-3/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152703v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152703v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v=
1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#53=
90</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2703v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
703v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2703v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-1/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-a=
dlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/sh=
ard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7=
b7/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f=
0cdb7b7/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff=
9df6f0cdb7b7/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b13980=
37f3dff9df6f0cdb7b7/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b=
1398037f3dff9df6f0cdb7b7/shard-adlp-6/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660b=
e3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-9/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6=
f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-3/igt@xe_module_load@load.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1=
b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/shard=
-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/=
shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cd=
b7b7/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df=
6f0cdb7b7/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3d=
ff9df6f0cdb7b7/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b13980=
37f3dff9df6f0cdb7b7/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b=
1398037f3dff9df6f0cdb7b7/shard-adlp-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660b=
e3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6=
f660be3e8b1398037f3dff9df6f0cdb7b7/shard-adlp-2/igt@xe_module_load@load.htm=
l">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378">Intel XE#378</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5612">Intel XE#5612</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-ad=
lp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-3/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152703v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152703v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-2/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-152703v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-152703v1/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703=
v1/shard-adlp-6/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152703v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adl=
p-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52703v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152703v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shar=
d-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-152703v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-3/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-152703v1/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703=
v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152703v1/shard-adlp-6/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152703v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE=
#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
612">Intel XE#5612</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7 -&gt; xe-pw-152=
703v1</li>
</ul>
<p>IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7: 1b96c6f660be3e8b1398037=
f3dff9df6f0cdb7b7<br />
  xe-pw-152703v1: 152703v1</p>

</body>
</html>

--===============1009341320997502331==--
