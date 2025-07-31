Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E11C87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 13:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327F610E78A;
	Thu, 31 Jul 2025 13:49:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF59110E78A;
 Thu, 31 Jul 2025 13:49:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7823499629999596618=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_eDP_Data_Override_=28rev5?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Jul 2025 13:49:16 -0000
Message-ID: <175396975689.202217.1042601643346992161@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250731051646.3009255-1-suraj.kandpal@intel.com>
In-Reply-To: <20250731051646.3009255-1-suraj.kandpal@intel.com>
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

--===============7823499629999596618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: eDP Data Override (rev5)
URL   : https://patchwork.freedesktop.org/series/151687/
State : failure

== Summary ==

CI Bug Log - changes from xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8_FULL -> xe-pw-151687v5_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151687v5_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151687v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151687v5_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock:
    - shard-bmg:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][2] -> [ABORT][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-433/igt@xe_module_load@unload.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-464/igt@xe_module_load@unload.html

  
Known issues
------------

  Here are the changes found in xe-pw-151687v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [PASS][4] -> [FAIL][5] ([Intel XE#4672])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@core_getversion@all-cards.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#4963])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@core_hotunplug@hotrebind-lateclose.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#4963])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#5547])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@device_reset@unbind-reset-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@pan:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2134]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@fbdev@pan.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@fbdev@pan.html

  * igt@fbdev@read:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2134])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@fbdev@read.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#4947]) +19 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#316])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][17] -> [DMESG-FAIL][18] ([Intel XE#4543]) +8 other tests dmesg-fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][19] ([Intel XE#4543])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1124]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1124]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#2191])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#367]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#367])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1512])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#367]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +125 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#3432])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#3432])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#787]) +20 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#2907])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#373]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2252]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#373]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#373]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#1178])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1178])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-adlp:         [PASS][45] -> [DMESG-WARN][46] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2320]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#455]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-8/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1424])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#4950]) +83 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#309]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#309])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2291]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#323])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#323])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#323])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#4494] / [i915#3804])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#310]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2316])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2316]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1421]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][65] -> [DMESG-WARN][66] ([Intel XE#4543]) +20 other tests dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-adlp:         [PASS][67] -> [DMESG-WARN][68] ([Intel XE#4543] / [Intel XE#5208]) +2 other tests dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-1/igt@kms_flip@flip-vs-panning-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-3/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][69] -> [INCOMPLETE][70] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [FAIL][71] ([Intel XE#4683]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2293] / [Intel XE#2380])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1401] / [Intel XE#1745])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1401])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#455]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2293]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#656]) +19 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4947]) +8 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#651]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#5390]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#651]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2311]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#651]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#656]) +6 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#653]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#653]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2313]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#1503])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#2925])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][91] ([Intel XE#616]) +2 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-464/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][92] -> [FAIL][93] ([Intel XE#616]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-464/igt@kms_plane_cursor@viewport.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-434/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2763]) +8 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2763]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][96] -> [FAIL][97] ([Intel XE#718])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#734])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#1439] / [Intel XE#836])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [PASS][100] -> [SKIP][101] ([Intel XE#4962]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#4608]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1489]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#1489])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1122] / [Intel XE#5580])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1406]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_psr@psr2-primary-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-435/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2234])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#3414])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sequence@get-busy:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#4950]) +10 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_sequence@get-busy.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#330])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][114] -> [SKIP][115] ([Intel XE#1499])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-3/igt@xe_ccs@suspend-resume.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#1126])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0x3fff.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#1126])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#5626]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-6/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#5626])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-432/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-8/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#4837])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#4837])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-5/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_evict@evict-beng-small:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-1/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#688]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-1/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#261] / [Intel XE#5564]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2322]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1392] / [Intel XE#5575]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1392]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-8/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [PASS][130] -> [SKIP][131] ([Intel XE#1392]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-436/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#288]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#288] / [Intel XE#5561]) +10 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-3/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][134] ([Intel XE#3868])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-3/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#4915]) +35 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-436/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html

  * igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#4915] / [Intel XE#5560]) +95 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#4943])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-8/igt@xe_exec_system_allocator@process-many-stride-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][138] ([Intel XE#5213])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#4943]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          NOTRUN -> [FAIL][140] ([Intel XE#5018])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#4945]) +44 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-dg2-set2:     [PASS][142] -> [DMESG-WARN][143] ([Intel XE#3876])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-434/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][144] -> [SKIP][145] ([Intel XE#4945]) +429 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][146] -> [SKIP][147] ([Intel XE#2229]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@xe_live_ktest@xe_bo.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][148] -> [FAIL][149] ([Intel XE#5679])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_module_load@many-reload.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_module_load@many-reload.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#3573]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-9/igt@xe_oa@mmio-triggered-reports.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#3573])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-434/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#2284] / [Intel XE#366])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-9/igt@xe_pm@d3cold-mmap-system.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#2284] / [Intel XE#366])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#2284] / [Intel XE#366])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#2284])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#4733] / [Intel XE#5594]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#4733]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#4733])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#944])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-8/igt@xe_query@multigpu-query-pxp-status.html
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#944])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#4130])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#4130])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [SKIP][163] ([Intel XE#4963]) -> [PASS][164] +2 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@core_hotunplug@hotreplug.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][165] ([Intel XE#4672]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][167] ([Intel XE#2134]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@fbdev@nullptr.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@fbdev@nullptr.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [SKIP][169] ([Intel XE#5177]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@intel_hwmon@hwmon-write.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][171] ([Intel XE#4947]) -> [PASS][172] +16 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][173] ([Intel XE#2291]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][175] ([Intel XE#4950]) -> [PASS][176] +85 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][177] ([Intel XE#2316]) -> [PASS][178] +3 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][179] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][181] ([Intel XE#4543]) -> [PASS][182] +14 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [DMESG-FAIL][183] ([Intel XE#4543]) -> [PASS][184] +10 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][185] ([Intel XE#1503]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][187] ([Intel XE#4596]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [SKIP][189] ([Intel XE#4962]) -> [PASS][190] +2 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1392]) -> [PASS][192] +5 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:
    - shard-bmg:          [SKIP][193] ([Intel XE#4945]) -> [PASS][194] +420 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][195] ([Intel XE#873]) -> [SKIP][196] ([Intel XE#4950])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_async_flips@invalid-async-flip.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-bmg:          [SKIP][197] ([Intel XE#4947]) -> [SKIP][198] ([Intel XE#2327])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          [SKIP][199] ([Intel XE#2327]) -> [SKIP][200] ([Intel XE#4947]) +4 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][201] ([Intel XE#2328]) -> [SKIP][202] ([Intel XE#4947])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][203] ([Intel XE#4947]) -> [SKIP][204] ([Intel XE#610])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][205] ([Intel XE#1124]) -> [SKIP][206] ([Intel XE#4947]) +9 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][207] ([Intel XE#4947]) -> [SKIP][208] ([Intel XE#1124]) +9 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][209] ([Intel XE#4950]) -> [SKIP][210] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][211] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][212] ([Intel XE#4950]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][213] ([Intel XE#4950]) -> [SKIP][214] ([Intel XE#367]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][215] ([Intel XE#367]) -> [SKIP][216] ([Intel XE#4950]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][217] ([Intel XE#2887]) -> [SKIP][218] ([Intel XE#4947]) +13 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][219] ([Intel XE#3432]) -> [SKIP][220] ([Intel XE#4947])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][221] ([Intel XE#4947]) -> [SKIP][222] ([Intel XE#3432]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][223] ([Intel XE#4947]) -> [SKIP][224] ([Intel XE#2887]) +18 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][225] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][226] ([Intel XE#4947])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][227] ([Intel XE#4947]) -> [SKIP][228] ([Intel XE#2724])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_cdclk@mode-transition.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][229] ([Intel XE#2724]) -> [SKIP][230] ([Intel XE#4947])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][231] ([Intel XE#2325]) -> [SKIP][232] ([Intel XE#4950]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][233] ([Intel XE#4950]) -> [SKIP][234] ([Intel XE#2325])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_chamelium_color@gamma.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          [SKIP][235] ([Intel XE#4950]) -> [SKIP][236] ([Intel XE#2252]) +10 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          [SKIP][237] ([Intel XE#2252]) -> [SKIP][238] ([Intel XE#4950]) +10 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][239] ([Intel XE#2341]) -> [SKIP][240] ([Intel XE#4950]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_content_protection@atomic.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][241] ([Intel XE#4950]) -> [FAIL][242] ([Intel XE#1178])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][243] ([Intel XE#1178]) -> [SKIP][244] ([Intel XE#4950])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_content_protection@srm.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][245] ([Intel XE#2320]) -> [SKIP][246] ([Intel XE#4950]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][247] ([Intel XE#4950]) -> [SKIP][248] ([Intel XE#2320]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][249] ([Intel XE#4950]) -> [SKIP][250] ([Intel XE#2291])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][251] ([Intel XE#1508]) -> [SKIP][252] ([Intel XE#4947])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][253] ([Intel XE#4947]) -> [SKIP][254] ([Intel XE#1508])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][255] ([Intel XE#4354]) -> [SKIP][256] ([Intel XE#4947]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][257] ([Intel XE#2244]) -> [SKIP][258] ([Intel XE#4947])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][259] ([Intel XE#4947]) -> [SKIP][260] ([Intel XE#2244]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][261] ([Intel XE#4945]) -> [SKIP][262] ([Intel XE#4422])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][263] ([Intel XE#4947]) -> [SKIP][264] ([Intel XE#5425])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][265] ([Intel XE#5425]) -> [SKIP][266] ([Intel XE#4947])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][267] ([Intel XE#4950]) -> [SKIP][268] ([Intel XE#2374])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_feature_discovery@psr2.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][269] ([Intel XE#4950]) -> [SKIP][270] ([Intel XE#2316])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][271] ([Intel XE#2316]) -> [SKIP][272] ([Intel XE#4950]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][273] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][274] ([Intel XE#301])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][275] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][276] ([Intel XE#4947]) +4 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][277] ([Intel XE#4947]) -> [SKIP][278] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][279] ([Intel XE#2312]) -> [SKIP][280] ([Intel XE#2311]) +4 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][281] ([Intel XE#2311]) -> [SKIP][282] ([Intel XE#4947]) +25 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][283] ([Intel XE#4947]) -> [SKIP][284] ([Intel XE#2311]) +24 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][285] ([Intel XE#2312]) -> [SKIP][286] ([Intel XE#5390]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][287] ([Intel XE#5390]) -> [SKIP][288] ([Intel XE#2312])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [SKIP][289] ([Intel XE#5427]) -> [SKIP][290] ([Intel XE#4947])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][291] ([Intel XE#5390]) -> [SKIP][292] ([Intel XE#4947]) +7 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][293] ([Intel XE#4947]) -> [SKIP][294] ([Intel XE#5390]) +9 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][295] ([Intel XE#2311]) -> [SKIP][296] ([Intel XE#2312]) +5 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][297] ([Intel XE#4947]) -> [SKIP][298] ([Intel XE#2312]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][299] ([Intel XE#2312]) -> [SKIP][300] ([Intel XE#2313]) +2 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][301] ([Intel XE#2312]) -> [SKIP][302] ([Intel XE#4947]) +5 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][303] ([Intel XE#4947]) -> [SKIP][304] ([Intel XE#2313]) +26 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][305] ([Intel XE#2350]) -> [SKIP][306] ([Intel XE#4947])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][307] ([Intel XE#2313]) -> [SKIP][308] ([Intel XE#4947]) +24 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][309] ([Intel XE#2313]) -> [SKIP][310] ([Intel XE#2312]) +6 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][311] ([Intel XE#4950]) -> [SKIP][312] ([Intel XE#3374] / [Intel XE#3544])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][313] ([Intel XE#346]) -> [SKIP][314] ([Intel XE#4947])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][315] ([Intel XE#4947]) -> [SKIP][316] ([Intel XE#2934])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][317] ([Intel XE#4090]) -> [SKIP][318] ([Intel XE#4947])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][319] ([Intel XE#4329]) -> [SKIP][320] ([Intel XE#4947])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][321] ([Intel XE#2393]) -> [SKIP][322] ([Intel XE#4950]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][323] ([Intel XE#4950]) -> [SKIP][324] ([Intel XE#4596])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][325] ([Intel XE#5021]) -> [SKIP][326] ([Intel XE#4950])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][327] ([Intel XE#4950]) -> [SKIP][328] ([Intel XE#5020])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-bmg:          [SKIP][329] ([Intel XE#4950]) -> [SKIP][330] ([Intel XE#2763])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][331] ([Intel XE#870]) -> [SKIP][332] ([Intel XE#4947]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_pm_backlight@fade.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][333] ([Intel XE#4947]) -> [SKIP][334] ([Intel XE#870])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][335] ([Intel XE#2391]) -> [SKIP][336] ([Intel XE#4947])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][337] ([Intel XE#4947]) -> [SKIP][338] ([Intel XE#2392])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][339] ([Intel XE#4947]) -> [SKIP][340] ([Intel XE#2505])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][341] ([Intel XE#4962]) -> [SKIP][342] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][343] ([Intel XE#4947]) -> [SKIP][344] ([Intel XE#1489]) +8 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][345] ([Intel XE#1489]) -> [SKIP][346] ([Intel XE#4947]) +8 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][347] ([Intel XE#4947]) -> [SKIP][348] ([Intel XE#2387])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][349] ([Intel XE#4947]) -> [SKIP][350] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][351] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][352] ([Intel XE#4947]) +14 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_psr@psr-cursor-plane-onoff.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][353] ([Intel XE#2414]) -> [SKIP][354] ([Intel XE#4947])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][355] ([Intel XE#4950]) -> [SKIP][356] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][357] ([Intel XE#2413]) -> [SKIP][358] ([Intel XE#4950])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][359] ([Intel XE#1435]) -> [SKIP][360] ([Intel XE#4950])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][361] ([Intel XE#4950]) -> [SKIP][362] ([Intel XE#1435])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][363] ([Intel XE#4950]) -> [SKIP][364] ([Intel XE#2426])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#362]) -> [FAIL][366] ([Intel XE#1729])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][367] ([Intel XE#2426]) -> [SKIP][368] ([Intel XE#2509])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][369] ([Intel XE#2168]) -> [SKIP][370] ([Intel XE#4950])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_vrr@lobf.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][371] ([Intel XE#4950]) -> [SKIP][372] ([Intel XE#1499]) +2 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_vrr@max-min.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][373] ([Intel XE#1499]) -> [SKIP][374] ([Intel XE#4950])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][375] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][376] ([Intel XE#4950]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][377] ([Intel XE#4945]) -> [SKIP][378] ([Intel XE#2504])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@resume-one:
    - shard-bmg:          [SKIP][379] ([Intel XE#4945]) -> [SKIP][380] ([Intel XE#4837]) +12 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_eudebug_online@resume-one.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@xe_eudebug_online@resume-one.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][381] ([Intel XE#4837]) -> [SKIP][382] ([Intel XE#4945]) +13 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][383] ([Intel XE#4518]) -> [SKIP][384] ([Intel XE#4945])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@xe_eudebug_sriov@deny-eudebug.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-bmg:          [SKIP][385] ([Intel XE#4945]) -> [SKIP][386] ([Intel XE#2322]) +6 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][387] ([Intel XE#2322]) -> [SKIP][388] ([Intel XE#4945]) +8 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [SKIP][389] ([Intel XE#4945]) -> [DMESG-WARN][390] ([Intel XE#3876])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:
    - shard-bmg:          [SKIP][391] ([Intel XE#4945]) -> [SKIP][392] ([Intel XE#4943]) +20 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - shard-bmg:          [SKIP][393] ([Intel XE#4943]) -> [SKIP][394] ([Intel XE#4945]) +26 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-adlp:         [SKIP][395] ([Intel XE#455]) -> [SKIP][396] ([Intel XE#455] / [Intel XE#5712])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@xe_live_ktest@xe_eudebug.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-9/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][397] ([Intel XE#2459] / [Intel XE#2596]) -> [SKIP][398] ([Intel XE#4945])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@xe_media_fill@media-fill.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_media_fill@media-fill.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][399] ([Intel XE#4945]) -> [SKIP][400] ([Intel XE#2245])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][401] ([Intel XE#5695]) -> [SKIP][402] ([Intel XE#4945])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_pm@d3hot-i2c.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          [SKIP][403] ([Intel XE#2284]) -> [SKIP][404] ([Intel XE#4945])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@xe_pm@s4-d3cold-basic-exec.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [SKIP][405] ([Intel XE#4945]) -> [SKIP][406] ([Intel XE#4650])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][407] ([Intel XE#4945]) -> [SKIP][408] ([Intel XE#4733]) +2 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][409] ([Intel XE#4733]) -> [SKIP][410] ([Intel XE#4945]) +3 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][411] ([Intel XE#944]) -> [SKIP][412] ([Intel XE#4945]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][413] ([Intel XE#4945]) -> [SKIP][414] ([Intel XE#944]) +3 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][415] ([Intel XE#4130]) -> [SKIP][416] ([Intel XE#4945]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          [SKIP][417] ([Intel XE#4945]) -> [SKIP][418] ([Intel XE#4130])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [SKIP][419] ([Intel XE#4945]) -> [SKIP][420] ([Intel XE#4273])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@xe_sriov_flr@flr-twice.html

  
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
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
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
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427
  [Intel XE#5547]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5547
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5580]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679
  [Intel XE#5695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695
  [Intel XE#5712]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5712
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8479 -> IGT_8481
  * Linux: xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8 -> xe-pw-151687v5

  IGT_8479: 5fea7ca6493415ce108231b0ff29f02d293f9aa6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8481: 8481
  xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8: 7f74ca5c75dd28bc57d5ea1be165919bc70609d8
  xe-pw-151687v5: 151687v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/index.html

--===============7823499629999596618==
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
<tr><td><b>Series:</b></td><td>eDP Data Override (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151687/">https://patchwork.freedesktop.org/series/151687/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8_FULL -&gt; xe-pw-151687v5_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151687v5_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-151687v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-151687v5_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-433/igt@xe_module_load@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-464/igt@xe_module_load@unload.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151687v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672">Intel XE#4672</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5547">Intel XE#5547</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +8 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-8/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +20 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-1/igt@kms_flip@flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-3/igt@kms_flip@flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-464/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-464/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-434/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-3/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580">Intel XE#5580</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-435/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_sequence@get-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-3/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-3/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607">Intel XE#5607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-6/igt@xe_eu_stall@blocking-re-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-432/igt@xe_eu_stall@non-blocking-re-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-8/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-5/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-1/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-1/igt@xe_evict@evict-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-8/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-436/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-3/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-3/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-436/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-4/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5560</a>) +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-8/igt@xe_exec_system_allocator@process-many-stride-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-ro.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-434/igt@xe_exec_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +429 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679">Intel XE#5679</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-9/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-434/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-9/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-4/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-8/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfconfig-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@core_hotunplug@hotreplug.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672">Intel XE#4672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@fbdev@nullptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@intel_hwmon@hwmon-write.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +85 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html">PASS</a> +420 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425">Intel XE#5425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425">Intel XE#5425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427">Intel XE#5427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_eudebug_online@resume-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@xe_eudebug_online@resume-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-7/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-adlp-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-adlp-9/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5712">Intel XE#5712</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695">Intel XE#5695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-4/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-4/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151687v5/shard-bmg-7/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8479 -&gt; IGT_8481</li>
<li>Linux: xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8 -&gt; xe-pw-151687v5</li>
</ul>
<p>IGT_8479: 5fea7ca6493415ce108231b0ff29f02d293f9aa6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8481: 8481<br />
  xe-3491-7f74ca5c75dd28bc57d5ea1be165919bc70609d8: 7f74ca5c75dd28bc57d5ea1be165919bc70609d8<br />
  xe-pw-151687v5: 151687v5</p>

</body>
</html>

--===============7823499629999596618==--
