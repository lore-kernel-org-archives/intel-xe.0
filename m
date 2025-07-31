Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1A8C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 09:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44B210E73D;
	Thu, 31 Jul 2025 09:10:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F2D10E25D;
 Thu, 31 Jul 2025 09:10:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4597180099456473369=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/devcoredump=3A_Defe?=
 =?utf-8?q?r_devcoredump_initialization_during_probe_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Jul 2025 09:10:47 -0000
Message-ID: <175395304784.201478.11054306069698738700@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250731061300.14320-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20250731061300.14320-1-balasubramani.vivekanandan@intel.com>
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

--===============4597180099456473369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/devcoredump: Defer devcoredump initialization during probe (rev4)
URL   : https://patchwork.freedesktop.org/series/152111/
State : success

== Summary ==

CI Bug Log - changes from xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8_FULL -> xe-pw-152111v4_FULL
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

  Here are the changes found in xe-pw-152111v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#4672]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@core_getversion@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#4963])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html

  * igt@fbdev@pan:
    - shard-bmg:          [PASS][4] -> [SKIP][5] ([Intel XE#2134])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@fbdev@pan.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@fbdev@pan.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][6] -> [FAIL][7] ([Intel XE#827]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#316])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][9] -> [DMESG-FAIL][10] ([Intel XE#4543]) +8 other tests dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][11] ([Intel XE#4543])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124]) +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#2191])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#367])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#367]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-9/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#367])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1512])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#367]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +167 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#4947]) +25 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#3432])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#3432])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#787]) +20 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#2907])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2252]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#373]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#373]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#373]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#1178])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][39] ([Intel XE#1178])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2320]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#455]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1424])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#4950]) +114 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom:
    - shard-dg2-set2:     [PASS][45] -> [SKIP][46] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-436/igt@kms_cursor_edge_walk@128x128-top-bottom.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@kms_cursor_edge_walk@128x128-top-bottom.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#309]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#309])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2291]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#323])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#323])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#323])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#4302])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#4494] / [i915#3804])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#310]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#3098])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1421]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#2316])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][62] -> [DMESG-WARN][63] ([Intel XE#4543]) +19 other tests dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-adlp:         [PASS][64] -> [DMESG-WARN][65] ([Intel XE#4543] / [Intel XE#5208])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-1/igt@kms_flip@flip-vs-panning-interruptible.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [PASS][66] -> [DMESG-WARN][67] ([Intel XE#5208])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-3/igt@kms_flip@flip-vs-rmfb.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][68] -> [DMESG-WARN][69] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [FAIL][70] ([Intel XE#4683]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2293] / [Intel XE#2380])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1401] / [Intel XE#1745])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1401])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#455]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2293]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2311]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#656]) +19 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#651]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#5390]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#651]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2312]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#651]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#656]) +6 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#653]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#653]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2313]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#2925])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_lease@lease-invalid-plane:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#4950]) +8 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_lease@lease-invalid-plane.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][89] -> [FAIL][90] ([Intel XE#616]) +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-464/igt@kms_plane_cursor@viewport.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-433/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2763]) +13 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#2763]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][93] -> [FAIL][94] ([Intel XE#718])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#734])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#4962])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [PASS][97] -> [SKIP][98] ([Intel XE#4962]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#4608]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1489]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1122] / [Intel XE#5580])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#4947]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1406]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-1/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_psr@psr2-primary-blt.html
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-4/igt@kms_psr@psr2-primary-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-434/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2234])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#3414])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#330])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_ccs@suspend-resume.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1126])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x3fff.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1126])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#5626]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#5626])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-434/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#4837])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4837])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-5/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_evict@evict-beng-small:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#688]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-4/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#261] / [Intel XE#5564])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2322]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-dg2-set2:     [PASS][122] -> [SKIP][123] ([Intel XE#1392]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1392] / [Intel XE#5575]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1392]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-8/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#288]) +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#288] / [Intel XE#5561]) +8 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][128] ([Intel XE#3868])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [PASS][129] -> [DMESG-WARN][130] ([Intel XE#3868])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-9/igt@xe_exec_reset@cm-close-fd.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][131] ([Intel XE#3876])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#4915]) +38 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-464/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html

  * igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#4915] / [Intel XE#5560]) +90 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][134] -> [FAIL][135] ([Intel XE#5018])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#4943]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge.html
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#4943]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          NOTRUN -> [FAIL][138] ([Intel XE#5018])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#4945]) +38 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap.html

  * igt@xe_exec_threads@threads-userptr-invalidate:
    - shard-adlp:         [PASS][140] -> [DMESG-WARN][141] ([Intel XE#3876])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-8/igt@xe_exec_threads@threads-userptr-invalidate.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_exec_threads@threads-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][142] -> [SKIP][143] ([Intel XE#4945]) +490 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][144] -> [FAIL][145] ([Intel XE#5679]) +1 other test fail
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@xe_module_load@reload-no-display.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_module_load@reload-no-display.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][146] -> [INCOMPLETE][147] ([Intel XE#4842])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-433/igt@xe_module_load@unload.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@xe_module_load@unload.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#3573]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@xe_oa@mmio-triggered-reports.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#3573])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-433/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#2284] / [Intel XE#366])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#2284] / [Intel XE#366])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#2284] / [Intel XE#366])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-8/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2284]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@xe_pm@d3cold-mocs.html
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#2284])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-1/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#4733] / [Intel XE#5594]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#4733]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#4733])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-432/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#944])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-7/igt@xe_query@multigpu-query-pxp-status.html
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#944])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#4130])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#4130])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-7/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_vm@large-binds-33554432:
    - shard-dg2-set2:     [PASS][162] -> [SKIP][163] ([Intel XE#4208])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-435/igt@xe_vm@large-binds-33554432.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@xe_vm@large-binds-33554432.html

  * igt@xe_vm@shared-pde2-page:
    - shard-adlp:         [PASS][164] -> [DMESG-FAIL][165] ([Intel XE#3876]) +1 other test dmesg-fail
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-8/igt@xe_vm@shared-pde2-page.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_vm@shared-pde2-page.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [SKIP][166] ([Intel XE#4963]) -> [PASS][167] +2 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@core_hotunplug@hotreplug.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][168] ([Intel XE#4672]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-7/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][170] ([Intel XE#2134]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@fbdev@nullptr.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@fbdev@nullptr.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [SKIP][172] ([Intel XE#5177]) -> [PASS][173] +1 other test pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@intel_hwmon@hwmon-write.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][174] ([Intel XE#4947]) -> [PASS][175] +22 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][176] ([Intel XE#2291]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][178] ([Intel XE#2316]) -> [PASS][179] +3 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][180] ([Intel XE#301]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][182] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][184] ([Intel XE#4543]) -> [PASS][185] +14 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [DMESG-FAIL][186] ([Intel XE#4543]) -> [PASS][187] +10 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][188] ([Intel XE#1503]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][190] ([Intel XE#4596]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [SKIP][192] ([Intel XE#4962]) -> [PASS][193] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [SKIP][194] ([Intel XE#4950]) -> [PASS][195] +85 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1392]) -> [PASS][197] +5 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:
    - shard-bmg:          [SKIP][198] ([Intel XE#4945]) -> [PASS][199] +405 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][200] ([Intel XE#2233]) -> [SKIP][201] ([Intel XE#4950])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][202] ([Intel XE#4950]) -> [SKIP][203] ([Intel XE#2370])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][204] ([Intel XE#2327]) -> [SKIP][205] ([Intel XE#4947]) +7 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][206] ([Intel XE#2328]) -> [SKIP][207] ([Intel XE#4947])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][208] ([Intel XE#4947]) -> [SKIP][209] ([Intel XE#610])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][210] ([Intel XE#1124]) -> [SKIP][211] ([Intel XE#4947]) +13 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][212] ([Intel XE#610]) -> [SKIP][213] ([Intel XE#4947])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][214] ([Intel XE#4947]) -> [SKIP][215] ([Intel XE#1124]) +9 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][216] ([Intel XE#4950]) -> [SKIP][217] ([Intel XE#2314] / [Intel XE#2894])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][218] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][219] ([Intel XE#4950]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][220] ([Intel XE#4950]) -> [SKIP][221] ([Intel XE#367]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][222] ([Intel XE#367]) -> [SKIP][223] ([Intel XE#4950]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][224] ([Intel XE#2887]) -> [SKIP][225] ([Intel XE#4947]) +19 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][226] ([Intel XE#4947]) -> [SKIP][227] ([Intel XE#2652] / [Intel XE#787])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][228] ([Intel XE#4947]) -> [SKIP][229] ([Intel XE#3432]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][230] ([Intel XE#3432]) -> [SKIP][231] ([Intel XE#4947])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][232] ([Intel XE#4947]) -> [SKIP][233] ([Intel XE#2887]) +18 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][234] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][235] ([Intel XE#4947])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][236] ([Intel XE#2325]) -> [SKIP][237] ([Intel XE#4950])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][238] ([Intel XE#4950]) -> [SKIP][239] ([Intel XE#2325])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_chamelium_color@gamma.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][240] ([Intel XE#2252]) -> [SKIP][241] ([Intel XE#4950]) +13 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-bmg:          [SKIP][242] ([Intel XE#4950]) -> [SKIP][243] ([Intel XE#2252]) +10 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][244] ([Intel XE#2341]) -> [SKIP][245] ([Intel XE#4950]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_content_protection@atomic.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][246] ([Intel XE#2390]) -> [SKIP][247] ([Intel XE#4950])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-0.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][248] ([Intel XE#4950]) -> [FAIL][249] ([Intel XE#1178])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#455]) -> [SKIP][251] ([Intel XE#4208] / [i915#2575])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-432/igt@kms_content_protection@type1.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][252] ([Intel XE#2320]) -> [SKIP][253] ([Intel XE#4950]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][254] ([Intel XE#4950]) -> [SKIP][255] ([Intel XE#2320]) +2 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          [SKIP][256] ([Intel XE#2321]) -> [SKIP][257] ([Intel XE#4950])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][258] ([Intel XE#2286]) -> [SKIP][259] ([Intel XE#4950])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][260] ([Intel XE#4947]) -> [SKIP][261] ([Intel XE#1508])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][262] ([Intel XE#4354]) -> [SKIP][263] ([Intel XE#4947]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][264] ([Intel XE#4331]) -> [SKIP][265] ([Intel XE#4947])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][266] ([Intel XE#4947]) -> [SKIP][267] ([Intel XE#2244]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          [SKIP][268] ([Intel XE#2244]) -> [SKIP][269] ([Intel XE#4947])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_dsc@dsc-with-formats.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][270] ([Intel XE#4947]) -> [SKIP][271] ([Intel XE#5425])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][272] ([Intel XE#2372]) -> [SKIP][273] ([Intel XE#4950])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_feature_discovery@chamelium.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][274] ([Intel XE#4950]) -> [SKIP][275] ([Intel XE#2374])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_feature_discovery@psr2.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][276] ([Intel XE#2316]) -> [FAIL][277] ([Intel XE#3098])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][278] ([Intel XE#2316]) -> [SKIP][279] ([Intel XE#4950]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][280] ([Intel XE#4543]) -> [DMESG-WARN][281] ([Intel XE#2953] / [Intel XE#4173])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][282] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][283] ([Intel XE#4947]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][284] ([Intel XE#4947]) -> [SKIP][285] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][286] ([Intel XE#2311]) -> [SKIP][287] ([Intel XE#4947]) +34 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][288] ([Intel XE#2312]) -> [SKIP][289] ([Intel XE#2311]) +5 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][290] ([Intel XE#4947]) -> [SKIP][291] ([Intel XE#2311]) +28 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][292] ([Intel XE#4947]) -> [SKIP][293] ([Intel XE#5390]) +14 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][294] ([Intel XE#2312]) -> [SKIP][295] ([Intel XE#5390])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][296] ([Intel XE#5390]) -> [SKIP][297] ([Intel XE#2312]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][298] ([Intel XE#5390]) -> [SKIP][299] ([Intel XE#4947]) +12 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][300] ([Intel XE#2352]) -> [SKIP][301] ([Intel XE#4947])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][302] ([Intel XE#2312]) -> [SKIP][303] ([Intel XE#4947]) +4 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][304] ([Intel XE#2311]) -> [SKIP][305] ([Intel XE#2312]) +6 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#651]) -> [SKIP][307] ([Intel XE#2351] / [Intel XE#4208])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][308] ([Intel XE#2313]) -> [SKIP][309] ([Intel XE#2312]) +4 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][310] ([Intel XE#4947]) -> [SKIP][311] ([Intel XE#2313]) +26 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][312] ([Intel XE#2312]) -> [SKIP][313] ([Intel XE#2313]) +4 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][314] ([Intel XE#2313]) -> [SKIP][315] ([Intel XE#4947]) +37 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][316] ([Intel XE#4947]) -> [SKIP][317] ([Intel XE#2312]) +4 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][318] ([Intel XE#4950]) -> [SKIP][319] ([Intel XE#3374] / [Intel XE#3544])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][320] ([Intel XE#4950]) -> [SKIP][321] ([Intel XE#1503])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][322] ([Intel XE#2927]) -> [SKIP][323] ([Intel XE#4947])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][324] ([Intel XE#4947]) -> [SKIP][325] ([Intel XE#2934])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][326] ([Intel XE#4090]) -> [SKIP][327] ([Intel XE#4947])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][328] ([Intel XE#2486]) -> [SKIP][329] ([Intel XE#4950])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][330] ([Intel XE#2393]) -> [SKIP][331] ([Intel XE#4950])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][332] ([Intel XE#4950]) -> [SKIP][333] ([Intel XE#5020])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-bmg:          [SKIP][334] ([Intel XE#4950]) -> [SKIP][335] ([Intel XE#2763])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][336] ([Intel XE#870]) -> [SKIP][337] ([Intel XE#4947]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_pm_backlight@fade.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][338] ([Intel XE#4947]) -> [SKIP][339] ([Intel XE#870])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][340] ([Intel XE#4947]) -> [SKIP][341] ([Intel XE#2505])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][342] ([Intel XE#4962]) -> [SKIP][343] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][344] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][345] ([Intel XE#4962])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][346] ([Intel XE#1489]) -> [SKIP][347] ([Intel XE#4947]) +8 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][348] ([Intel XE#4947]) -> [SKIP][349] ([Intel XE#1489]) +7 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][350] ([Intel XE#4947]) -> [SKIP][351] ([Intel XE#2387]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][352] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][353] ([Intel XE#4947]) +15 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_psr@fbc-psr-primary-render.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          [SKIP][354] ([Intel XE#4947]) -> [SKIP][355] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_psr@pr-suspend.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_psr@pr-suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][356] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][357] ([Intel XE#4950]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][358] ([Intel XE#4950]) -> [SKIP][359] ([Intel XE#3414] / [Intel XE#3904])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][360] ([Intel XE#4950]) -> [SKIP][361] ([Intel XE#2426])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#362]) -> [FAIL][363] ([Intel XE#1729])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][364] ([Intel XE#4950]) -> [SKIP][365] ([Intel XE#2450])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][366] ([Intel XE#4950]) -> [SKIP][367] ([Intel XE#1499]) +2 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_vrr@max-min.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][368] ([Intel XE#1499]) -> [SKIP][369] ([Intel XE#4950]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-drrs.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][370] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][371] ([Intel XE#4950])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][372] ([Intel XE#4945]) -> [SKIP][373] ([Intel XE#2504])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-bmg:          [SKIP][374] ([Intel XE#4945]) -> [FAIL][375] ([Intel XE#5420])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_eu_stall@blocking-re-enable.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-7/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][376] ([Intel XE#4945]) -> [SKIP][377] ([Intel XE#4837]) +9 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][378] ([Intel XE#4837]) -> [SKIP][379] ([Intel XE#4945]) +13 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][380] ([Intel XE#4945]) -> [SKIP][381] ([Intel XE#2322]) +5 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][382] ([Intel XE#2322]) -> [SKIP][383] ([Intel XE#4945]) +12 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:
    - shard-bmg:          [SKIP][384] ([Intel XE#4945]) -> [SKIP][385] ([Intel XE#4943]) +19 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:
    - shard-bmg:          [SKIP][386] ([Intel XE#4943]) -> [SKIP][387] ([Intel XE#4945]) +30 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#4915]) -> [SKIP][389] ([Intel XE#4208]) +2 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-adlp:         [SKIP][390] ([Intel XE#455]) -> [SKIP][391] ([Intel XE#455] / [Intel XE#5712])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@xe_live_ktest@xe_eudebug.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][392] ([Intel XE#586]) -> [SKIP][393] ([Intel XE#4945])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@xe_mmap@small-bar.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [PASS][402], [PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409], [PASS][410], [PASS][411], [PASS][412], [PASS][413], [SKIP][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418]) ([Intel XE#378] / [Intel XE#5612]) -> ([SKIP][419], [PASS][420], [PASS][421], [PASS][422], [PASS][423], [PASS][424], [DMESG-WARN][425], [PASS][426], [PASS][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], [PASS][435], [PASS][436], [PASS][437], [PASS][438], [PASS][439], [PASS][440], [PASS][441], [PASS][442], [PASS][443], [PASS][444]) ([Intel XE#2953] / [Intel XE#378] / [Intel XE#4173] / [Intel XE#5612])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@xe_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-6/igt@xe_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-6/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-2/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-9/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-2/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-1/igt@xe_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-6/igt@xe_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-6/igt@xe_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-2/igt@xe_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-8/igt@xe_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-2/igt@xe_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@xe_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-3/igt@xe_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-3/igt@xe_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-9/igt@xe_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-9/igt@xe_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-9/igt@xe_module_load@load.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-1/igt@xe_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-1/igt@xe_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@xe_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-3/igt@xe_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-8/igt@xe_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-8/igt@xe_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-3/igt@xe_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-9/igt@xe_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-4/igt@xe_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@xe_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@xe_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@xe_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@xe_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@xe_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-4/igt@xe_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-4/igt@xe_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@xe_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@xe_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-9/igt@xe_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-9/igt@xe_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_module_load@load.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@xe_module_load@load.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@xe_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@xe_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-4/igt@xe_module_load@load.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][445] ([Intel XE#2248]) -> [SKIP][446] ([Intel XE#4945])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#3573]) -> [SKIP][448] ([Intel XE#4208])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][449] ([Intel XE#4945]) -> [SKIP][450] ([Intel XE#2245])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][451] ([Intel XE#5695]) -> [SKIP][452] ([Intel XE#4945])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_pm@d3hot-i2c.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          [SKIP][453] ([Intel XE#2284]) -> [SKIP][454] ([Intel XE#4945]) +1 other test skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@xe_pm@s4-d3cold-basic-exec.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [SKIP][455] ([Intel XE#4945]) -> [SKIP][456] ([Intel XE#4650])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          [SKIP][457] ([Intel XE#4945]) -> [SKIP][458] ([Intel XE#4733]) +1 other test skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          [SKIP][459] ([Intel XE#4733]) -> [SKIP][460] ([Intel XE#4945]) +3 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          [SKIP][461] ([Intel XE#944]) -> [SKIP][462] ([Intel XE#4945])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@xe_query@multigpu-query-invalid-query.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][463] ([Intel XE#4945]) -> [SKIP][464] ([Intel XE#944]) +1 other test skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][465] ([Intel XE#3342]) -> [SKIP][466] ([Intel XE#4945])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [SKIP][467] ([Intel XE#4945]) -> [SKIP][468] ([Intel XE#4273])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-bmg:          [SKIP][469] ([Intel XE#4351]) -> [SKIP][470] ([Intel XE#4945])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5420
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5580]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679
  [Intel XE#5695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695
  [Intel XE#5712]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5712
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8479 -> IGT_8481
  * Linux: xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8 -> xe-pw-152111v4

  IGT_8479: 5fea7ca6493415ce108231b0ff29f02d293f9aa6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8481: 8481
  xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8: 7f74ca5c75dd28bc57d5ea1be165919bc70609d8
  xe-pw-152111v4: 152111v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/index.html

--===============4597180099456473369==
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
<tr><td><b>Series:</b></td><td>drm/xe/devcoredump: Defer devcoredump initia=
lization during probe (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152111/">https://patchwork.freedesktop.org/series/152111/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152111v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152111v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc=
70609d8_FULL -&gt; xe-pw-152111v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152111v4_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@core_get=
version@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@core_getversion@basic.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672"=
>Intel XE#4672</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@core_hotunplug@hotunbind-rebi=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@fbdev@pa=
n.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-152111v4/shard-bmg-5/igt@fbdev@pan.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/sha=
rd-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-=
a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/sha=
rd-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>) +8 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@kms_big_fb@yf-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@kms_bw@connected-linear-tili=
ng-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-2/igt@kms_bw@linear-tiling-3-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-9/igt@kms_bw@linear-tiling-4-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-464/igt@kms_bw@linear-tiling-4-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-3/igt@kms_bw@linear-tiling-4-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-1/igt@kms_bw@linear-tiling-4-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
-tiled-ccs@pipe-d-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +167 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +25 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y=
f-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@kms_ccs@random-ccs-data-y-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-=
stress-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-=
multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-w=
ithout-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-wit=
hout-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-466/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-3/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@kms_cursor_crc@cursor-random=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_curs=
or_crc@cursor-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_cursor_crc@cursor-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4950">Intel XE#4950</a>) +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-436/igt@kms_cu=
rsor_edge_walk@128x128-top-bottom.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@kms_curso=
r_edge_walk@128x128-top-bottom.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-3/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs=
-flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/sh=
ard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-464/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-5/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_display_mod=
es@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@kms_flip@2x-flip-vs-blocking=
-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-n=
op-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-2/igt@kms_flip@2x-flip-vs-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_flip=
@2x-nonexisting-fb-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_flip@2x-=
nonexisting-fb-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-6/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-8=
/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>) +19 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-1/igt@kms_fli=
p@flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@kms_flip@fli=
p-vs-panning-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-3/igt@kms_fli=
p@flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152111v4/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@km=
s_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#295=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173=
">Intel XE#4173</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)=
</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#140=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32=
bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@kms_frontbuffer_tracking@drr=
s-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +19 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@kms_frontbuffer_tracking@drr=
s-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other test=
s skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@kms_frontbuffer_tracking@psr=
-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-=
rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@kms_joiner@invalid-modeset-f=
orce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_lease@lease-invalid-plane=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4950">Intel XE#4950</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-464/igt@kms_pl=
ane_cursor@viewport.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-433/igt@kms_plane_cursor@viewpo=
rt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +13 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-2/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-lnl-3/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152111v4/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel =
XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">=
Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_pm_r=
pm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_pm_rpm@modeset=
-non-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4962">Intel XE#4962</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@kms_psr2_sf@psr2-cursor-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@kms_psr2_su@page_flip-xrgb88=
88.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5580">Intel XE#5580</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-1/igt@kms_psr@pr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_psr@psr2-primary-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-4/igt@kms_psr@psr2-primary-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-434/igt@kms_psr@psr2-primary-blt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_psr@psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-9/igt@kms_rotation_crc@sprite-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_ccs@suspend-resume.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/488">Intel XE#488</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5607">Intel XE#5607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@xe_copy_basic@mem-set-linear=
-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-435/igt@xe_copy_basic@mem-set-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_eu_stall@blocking-re-enab=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5626">Intel XE#5626</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-434/igt@xe_eu_stall@non-blocking-re=
-enable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@xe_eudebug@basic-vm-access-p=
arameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +2 other tests=
 skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-464/igt@xe_eudebug@basic-vm-access-=
parameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-5/igt@xe_eudebug@basic-vm-access-pa=
rameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@xe_evict@evict-beng-small.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-4/igt@xe_evict@evict-large-external=
-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_evict@evict-large-multi-v=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5564">Intel XE#5564</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-bind.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-432/igt@x=
e_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@xe_exec_basic@multigpu-no-ex=
ec-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-8/igt@xe_exec_basic@multigpu-once-b=
asic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@xe_exec_fault_mode@many-use=
rptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_exec_fault_mode@many-user=
ptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_exec_reset@cm-cat-error.h=
tml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-9/igt@xe_exec=
_reset@cm-close-fd.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_exec_reset@cm-close-fd=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_exec_reset@parallel-gt-re=
set.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-464/igt@xe_exec_system_allocator@ma=
ny-large-malloc-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +38 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@xe_exec_system_allocator@onc=
e-mmap-remap-ro-dontunmap.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5560</a>) +90 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-ma=
p-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-lnl-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152111v4/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-e=
xecqueues-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-1/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-mmap-free-huge.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 oth=
er tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-mmap-free-huge.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-5/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-mmap-shared-remap.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +38 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-8/igt@xe_exec=
_threads@threads-userptr-invalidate.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_exec_=
threads@threads-userptr-invalidate.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@xe_fault=
_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/sha=
rd-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_ea=
rly.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4945">Intel XE#4945</a>) +490 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@xe_modul=
e_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_module_load@reloa=
d-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5679">Intel XE#5679</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-433/igt@xe_mod=
ule_load@unload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@xe_module_load@unload.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@xe_oa@mmio-triggered-reports=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3573">Intel XE#3573</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-433/igt@xe_oa@mmio-triggered-report=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-8/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-1/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@xe_pxp@pxp-termination-key-up=
date-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</=
li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-432/igt@xe_pxp@pxp-termination-key-=
update-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-7/igt@xe_query@multigpu-query-pxp-s=
tatus.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@xe_query@multigpu-query-pxp-s=
tatus.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@xe_sriov_auto_provisioning@=
selfconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-lnl-7/igt@xe_sriov_auto_provisioning@se=
lfconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-33554432:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-435/igt@xe_vm@=
large-binds-33554432.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@xe_vm@large-binds-3355=
4432.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde2-page:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-8/igt@xe_vm@s=
hared-pde2-page.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_vm@shared-pde2-page.html"=
>DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3876">Intel XE#3876</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@core_hot=
unplug@hotreplug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@core_hotunplug=
@hotreplug.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@core_set=
master@master-drop-set-root.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4672">Intel XE#4672</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-7/igt@cor=
e_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@fbdev@nu=
llptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@fbdev@nullptr.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@intel_hw=
mon@hwmon-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5177">Intel XE#5177</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@intel_hwmon@hwm=
on-write.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
111v4/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-asy=
nc-flip.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_curs=
or_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-b=
mg-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-=
bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +=
3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-lnl-4/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shar=
d-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/=
igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +14 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-9/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel =
XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152111v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-s=
hrfb-draw-blt.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-3/igt@kms_p=
lane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_r=
pm@universal-planes-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_pm=
_rpm@universal-planes-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_vbla=
nk@ts-continuation-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_=
vblank@ts-continuation-suspend.html">PASS</a> +85 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard=
-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a>=
 +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-stride-free-nomemset.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Inte=
l XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-152111v4/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-ma=
ny-stride-free-nomemset.html">PASS</a> +405 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_addf=
b_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-=
5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950=
">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152111v4/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset=
-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_big_=
fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_b=
ig_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_big_fb@y-t=
iled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_big_=
fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/ig=
t@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_=
big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +13 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_big_=
fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@k=
ms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#49=
47</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2111v4/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/sh=
ard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152111v4/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_bw@l=
inear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/=
igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_bw@l=
inear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/ig=
t@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_ccs@=
bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-=
5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_ccs@=
bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/ig=
t@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/ig=
t@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/ig=
t@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/s=
hard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
87">Intel XE#2887</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_ccs@=
random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/sha=
rd-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_cham=
elium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms=
_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_cham=
elium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_chamelium=
_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_cham=
elium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shar=
d-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">In=
tel XE#4950</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_cham=
elium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-=
8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252=
</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_cont=
ent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/ig=
t@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-432/igt@kms_co=
ntent_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/igt@kms_cont=
ent_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_curs=
or_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/ig=
t@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_curs=
or_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-=
5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel =
XE#2286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152111v4/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor=
-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_dirt=
yfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_dp_l=
ink_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_dp_li=
nk_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/ig=
t@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_dsc@=
dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_dsc@dsc-=
fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_dsc@=
dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_dsc@dsc-wi=
th-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_fbcon_fbt@fbc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5425">Intel XE#5425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_feat=
ure_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_fea=
ture_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_feature_=
discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg=
-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#309=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_flip=
@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_flip@2x-plai=
n-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@kms_fl=
ip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#=
4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152111v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yft=
ile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
111v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152111v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-=
bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1521=
11v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1521=
11v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#=
5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152111v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v=
4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4947">Intel XE#4947</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@k=
ms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4=
/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4947">Intel XE#4947</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2111v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/sha=
rd-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
111v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel X=
E#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152111v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
111v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/sha=
rd-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">=
Intel XE#4947</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#49=
47</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2111v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_hdr@s=
tatic-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_join=
er@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_joine=
r@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_join=
er@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg=
-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#293=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard=
-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Inte=
l XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_pane=
l_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_pa=
nel_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_plan=
e_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_plane_low=
res@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-7/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_plan=
e_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg=
-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_pm_b=
acklight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_pm_backlight@fa=
de.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_b=
acklight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@kms_pm_=
backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@kms_pm_dc@deep-pkgc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2505">Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_pm_r=
pm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel X=
E#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152111v4/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">=
Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/sh=
ard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947=
">Intel XE#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_psr2=
_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#49=
47</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2111v4/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed=
-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_psr2=
_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_psr2=
_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_psr@=
fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-=
5/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +15 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_psr@=
pr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@kms_psr@pr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#390=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
111v4/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
50">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_rota=
tion_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-1/igt@kms=
_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-435/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_vrr@=
max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@kms_vrr@max-min.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
9">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_vrr@=
seamless-rr-switch-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@kms_vrr=
@seamless-rr-switch-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@sriov_ba=
sic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE=
#2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152111v4/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-al=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_creat=
e@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/ig=
t@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_eu_st=
all@blocking-re-enable.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-7/igt@xe_eu_st=
all@blocking-re-enable.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5420">Intel XE#5420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_eudeb=
ug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6=
/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a=
>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_eudeb=
ug_online@stopped-thread.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_eud=
ebug_online@stopped-thread.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +13 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/sha=
rd-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">=
Intel XE#2322</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v=
4/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4945">Intel XE#4945</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152111v4/shard-bmg-8/igt@xe_exec_system_allocator@threads-s=
hared-vm-many-large-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) =
+19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@xe_exec_=
system_allocator@threads-shared-vm-many-mmap-new-huge.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#49=
43</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2111v4/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap=
-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4945">Intel XE#4945</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nome=
mset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-432/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915=
">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152111v4/shard-dg2-463/igt@xe_exec_system_allocator@threads-shar=
ed-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@xe_live=
_ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@xe_live_ktest@=
xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5712">Intel XE#5712</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/586">Intel XE#586</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_mmap@small-bar.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-6/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/sha=
rd-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d=
8/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc7=
0609d8/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be1659=
19bc70609d8/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1b=
e165919bc70609d8/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d=
5ea1be165919bc70609d8/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28=
bc57d5ea1be165919bc70609d8/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c7=
5dd28bc57d5ea1be165919bc70609d8/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74=
ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491=
-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-3/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-ad=
lp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/sha=
rd-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d=
8/shard-adlp-4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc7=
0609d8/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be1659=
19bc70609d8/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1b=
e165919bc70609d8/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d=
5ea1be165919bc70609d8/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel =
XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5612">Intel XE#5612</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_module_load@load.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/sha=
rd-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-152111v4/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-4/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111=
v4/shard-adlp-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152111v4/shard-adlp-8/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-1/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-152111v4/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-152111v4/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111=
v4/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-152111v4/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adl=
p-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52111v4/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152111v4/shard-adlp-6/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shar=
d-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-152111v4/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-adlp-4/i=
gt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612"=
>Intel XE#5612</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_oa@oa=
-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_oa@oa-tlb-in=
validate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-464/igt@xe_oa@=
oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-dg2-463/=
igt@xe_oa@oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-2/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_pm@d3=
hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5695">Intel XE#5695</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/494=
5">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@xe_pm@s4=
-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_pm@s4-d3c=
old-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_pxp@p=
xp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-4/igt@x=
e_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@xe_pxp@p=
xp-stale-queue-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5=
/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@xe_query=
@multigpu-query-invalid-query.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_=
query@multigpu-query-invalid-query.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_query=
@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard=
-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel=
 XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@xe_sriov=
_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-5/igt@xe_srio=
v_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_sriov=
_flr@flr-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-6/igt@xe_sriov_flr@flr=
-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@xe_sriov=
_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152111v4/shard-bmg-=
5/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8479 -&gt; IGT_8481</li>
<li>Linux: xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8 -&gt; xe-pw-152=
111v4</li>
</ul>
<p>IGT_8479: 5fea7ca6493415ce108231b0ff29f02d293f9aa6 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8481: 8481<br />
  xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8: 7f74ca5c75dd28bc57d5ea1=
be165919bc70609d8<br />
  xe-pw-152111v4: 152111v4</p>

</body>
</html>

--===============4597180099456473369==--
