Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D46D690E8
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 08:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3520B10E30D;
	Thu, 28 Nov 2024 08:26:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7077F10EC3E;
 Thu, 28 Nov 2024 08:26:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7119646662037570852=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/hdcp=3A_Change_lo?=
 =?utf-8?q?g_level_for_HDMI_HDCP_LIC_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Nov 2024 08:26:41 -0000
Message-ID: <173278240143.4041366.11978704277709728636@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241128063427.1792509-1-suraj.kandpal@intel.com>
In-Reply-To: <20241128063427.1792509-1-suraj.kandpal@intel.com>
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

--===============7119646662037570852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/hdcp: Change log level for HDMI HDCP LIC check
URL   : https://patchwork.freedesktop.org/series/141868/
State : failure

== Summary ==

CI Bug Log - changes from xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021_full -> xe-pw-141868v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141868v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141868v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141868v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@basic:
    - shard-bmg:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@core_getversion@basic.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][4] +14 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  
#### Warnings ####

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][5] ([Intel XE#2136]) -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer:
    - shard-bmg:          [SKIP][7] ([Intel XE#1130]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [SKIP][9] ([Intel XE#1130]) -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html

  
Known issues
------------

  Here are the changes found in xe-pw-141868v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#2423])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@core_getstats.html

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [PASS][12] -> [FAIL][13] ([Intel XE#3440])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@core_getversion@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#1885]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@core_hotunplug@hotunplug-rescan.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-adlp:         [PASS][16] -> [DMESG-WARN][17] ([Intel XE#3086]) +2 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-2/igt@core_hotunplug@unplug-rescan.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-8/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#3453])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][19] -> [FAIL][20] ([Intel XE#3339])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@pan:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2134])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@fbdev@pan.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][22] -> [SKIP][23] ([Intel XE#2134])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@fbdev@write.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@fbdev@write.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][24] ([Intel XE#1727] / [Intel XE#3468])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#2136]) +29 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1124]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2136]) +27 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2136] / [Intel XE#2351]) +11 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#316]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][32] -> [FAIL][33] ([Intel XE#1231])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [FAIL][34] ([Intel XE#1874])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#2191])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#367])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#787]) +29 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][40] ([Intel XE#1727])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#787]) +97 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#2907]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1152]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#306])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#373]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_color@ctm-0-25:
    - shard-bmg:          [PASS][47] -> [DMESG-WARN][48] ([Intel XE#877]) +1 other test dmesg-warn
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_color@ctm-0-25.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_color@ctm-0-25.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][49] ([Intel XE#2715] / [Intel XE#3468])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][50] ([Intel XE#1178])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#307])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][52] ([Intel XE#1178]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][53] ([Intel XE#3304])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][54] ([Intel XE#1188])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][55] ([Intel XE#3468]) +48 other tests dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#309]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#2423] / [i915#2575]) +25 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2423]) +25 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#323])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1340])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#2958])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1137])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#2316]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][66] ([Intel XE#3321] / [Intel XE#3486])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][67] ([Intel XE#3486]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][68] -> [FAIL][69] ([Intel XE#3321] / [Intel XE#3487]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#310]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][71] -> [SKIP][72] ([Intel XE#2423] / [i915#2575]) +98 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_flip@busy-flip.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#3321] / [Intel XE#3487])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][74] ([Intel XE#301] / [Intel XE#3321] / [Intel XE#3487]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#301]) +4 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [PASS][76] -> [DMESG-WARN][77] ([Intel XE#2953] / [Intel XE#3086]) +1 other test dmesg-warn
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#2423]) +103 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2293]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#455]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#2136]) +33 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2136]) +31 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][84] -> [SKIP][85] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#651]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#653]) +7 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#656]) +21 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#455]) +12 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_lowres@tiling-4@pipe-a-dp-2:
    - shard-bmg:          [PASS][90] -> [DMESG-FAIL][91] ([Intel XE#3468])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_plane_lowres@tiling-4@pipe-a-dp-2.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_plane_lowres@tiling-4@pipe-a-dp-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][92] ([Intel XE#361])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2763]) +8 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#2763]) +5 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2763]) +7 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#870])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#734])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [PASS][100] -> [SKIP][101] ([Intel XE#2446]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2446]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2446])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [PASS][104] -> [SKIP][105] ([Intel XE#2446]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [PASS][106] -> [DMESG-WARN][107] ([Intel XE#2042])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-50:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][108] ([Intel XE#1727] / [Intel XE#3468]) +4 other tests dmesg-warn
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-59:
    - shard-lnl:          [PASS][109] -> [DMESG-WARN][110] ([Intel XE#3184]) +1 other test dmesg-warn
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html
    - shard-bmg:          NOTRUN -> [INCOMPLETE][111] ([Intel XE#1727] / [Intel XE#3468])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1489]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1127])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_vblank@query-forked-busy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][115] ([Intel XE#3468]) +6 other tests dmesg-fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_vblank@query-forked-busy@pipe-a-dp-2.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#2168])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-4/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#756]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
    - shard-lnl:          [PASS][118] -> [DMESG-WARN][119] ([Intel XE#2932]) +3 other tests dmesg-warn
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-5/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1447])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1280] / [Intel XE#455])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1126])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_drm_fdinfo@utilization-single-full-load:
    - shard-lnl:          [PASS][123] -> [FAIL][124] ([Intel XE#2667])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-4/igt@xe_drm_fdinfo@utilization-single-full-load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#2905]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#261] / [Intel XE#688]) +5 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1130]) +63 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1392]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#288]) +13 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][130] -> [DMESG-WARN][131] ([Intel XE#3468]) +4 other tests dmesg-warn
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [PASS][132] -> [SKIP][133] ([Intel XE#2229]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_module_load@unload:
    - shard-bmg:          [PASS][134] -> [DMESG-WARN][135] ([Intel XE#3467])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_module_load@unload.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@xe_module_load@unload.html

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - shard-lnl:          NOTRUN -> [FAIL][136] ([Intel XE#2249])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@xe_oa@mmio-triggered-reports@rcs-0.html

  * igt@xe_oa@polling:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#3573]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_oa@polling.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#1130]) +43 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#2838] / [Intel XE#979])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][140] -> [ABORT][141] ([Intel XE#1607] / [Intel XE#1794])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][142] ([Intel XE#1727] / [Intel XE#3088] / [Intel XE#3468])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#944])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][144] -> [SKIP][145] ([Intel XE#1130]) +259 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [PASS][146] -> [SKIP][147] ([Intel XE#1130]) +180 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][148] ([Intel XE#2919])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          [PASS][149] -> [DMESG-WARN][150] ([Intel XE#3119])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-5/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [FAIL][151] ([Intel XE#3249]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][153] ([Intel XE#3339]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#2134]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@fbdev@eof.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@fbdev@eof.html

  * igt@fbdev@read:
    - shard-bmg:          [SKIP][157] ([Intel XE#2134]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@fbdev@read.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@fbdev@read.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#2423] / [i915#2575]) -> [PASS][160] +87 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][161] ([Intel XE#1426]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait:
    - shard-bmg:          [DMESG-WARN][163] -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#2136]) -> [PASS][166] +29 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][168] +7 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][169] ([Intel XE#2136]) -> [PASS][170] +12 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][171] ([Intel XE#877]) -> [PASS][172] +2 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64:
    - shard-bmg:          [SKIP][173] -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-64x64.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-64x64.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][175] ([Intel XE#2425]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][177] ([Intel XE#3321] / [Intel XE#3487]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [SKIP][179] ([Intel XE#2316]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-lnl:          [FAIL][181] ([Intel XE#886]) -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][183] ([Intel XE#2882]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          [FAIL][185] ([Intel XE#3486]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][187] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-bmg:          [SKIP][189] ([Intel XE#2423]) -> [PASS][190] +92 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_plane_alpha_blend@constant-alpha-max.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][191] ([Intel XE#1430]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][193] ([Intel XE#2029]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2446]) -> [PASS][196] +2 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_pm_rpm@modeset-stress-extra-wait.html
    - shard-bmg:          [SKIP][197] ([Intel XE#2446]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][199] ([Intel XE#899]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][201] ([Intel XE#2159]) -> [PASS][202] +1 other test pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          [DMESG-WARN][203] ([Intel XE#3468]) -> [PASS][204] +2 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - shard-bmg:          [SKIP][205] ([Intel XE#1130]) -> [PASS][206] +211 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_threads@threads-bal-userptr:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1130]) -> [PASS][208] +157 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_exec_threads@threads-bal-userptr.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-adlp:         [DMESG-WARN][209] ([Intel XE#3086]) -> [PASS][210] +6 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-dg2-set2:     [TIMEOUT][211] ([Intel XE#2961] / [Intel XE#3191]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [SKIP][213] ([Intel XE#2229]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][215] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-4/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][217] ([Intel XE#1794]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [DMESG-WARN][219] ([Intel XE#3468]) -> [SKIP][220] ([Intel XE#1885])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@core_hotunplug@hotreplug-lateclose.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1885]) -> [DMESG-WARN][222] ([Intel XE#3468])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][223] ([Intel XE#2423]) -> [SKIP][224] ([Intel XE#2233])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - shard-dg2-set2:     [DMESG-WARN][225] ([Intel XE#1727]) -> [SKIP][226] ([Intel XE#2423] / [i915#2575])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_addfb_basic@invalid-set-prop-any.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [SKIP][227] ([Intel XE#2423]) -> [DMESG-FAIL][228] ([Intel XE#1727] / [Intel XE#3468])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#873]) -> [SKIP][230] ([Intel XE#2423] / [i915#2575])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
    - shard-bmg:          [SKIP][231] ([Intel XE#2423]) -> [SKIP][232] ([Intel XE#873])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_interruptible@legacy-cursor:
    - shard-bmg:          [SKIP][233] ([Intel XE#2423]) -> [DMESG-WARN][234] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_atomic_interruptible@legacy-cursor.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_atomic_interruptible@legacy-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][235] ([Intel XE#2423]) -> [SKIP][236] ([Intel XE#2370])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][237] ([Intel XE#2370]) -> [SKIP][238] ([Intel XE#2423])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][239] ([Intel XE#2136]) -> [SKIP][240] ([Intel XE#2327]) +6 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#316]) -> [SKIP][242] ([Intel XE#2136])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][243] ([Intel XE#2136]) -> [DMESG-WARN][244] ([Intel XE#3468]) +3 other tests dmesg-warn
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][246] ([Intel XE#316])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          [SKIP][247] ([Intel XE#2327]) -> [SKIP][248] ([Intel XE#2136]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][249] ([Intel XE#3468]) -> [DMESG-WARN][250] ([Intel XE#3468])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2136]) -> [SKIP][252] ([Intel XE#316]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#316]) -> [SKIP][254] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][255] ([Intel XE#2136]) -> [DMESG-FAIL][256] ([Intel XE#1727] / [Intel XE#3468])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [DMESG-FAIL][257] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][258] ([Intel XE#3468])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][259] ([Intel XE#324]) -> [FAIL][260] ([Intel XE#1231])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          [DMESG-WARN][261] ([Intel XE#3468]) -> [SKIP][262] ([Intel XE#2136])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][263] ([Intel XE#2136]) -> [DMESG-WARN][264] ([Intel XE#2705] / [Intel XE#3468])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][265] ([Intel XE#2136]) -> [SKIP][266] ([Intel XE#1124]) +14 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][268] ([Intel XE#607])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][269] ([Intel XE#610]) -> [SKIP][270] ([Intel XE#2136])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2136]) -> [SKIP][272] ([Intel XE#1124]) +7 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1124]) -> [SKIP][274] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1124]) -> [SKIP][276] ([Intel XE#2136]) +9 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][277] ([Intel XE#2328]) -> [SKIP][278] ([Intel XE#2136])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][279] ([Intel XE#607]) -> [SKIP][280] ([Intel XE#2136]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][282] ([Intel XE#1124]) +4 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][283] ([Intel XE#1124]) -> [SKIP][284] ([Intel XE#2136]) +13 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][285] ([Intel XE#2423]) -> [SKIP][286] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][287] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][288] ([Intel XE#2423]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2423] / [i915#2575]) -> [SKIP][290] ([Intel XE#2191]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2191]) -> [SKIP][292] ([Intel XE#2423] / [i915#2575])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          [SKIP][293] ([Intel XE#2423]) -> [SKIP][294] ([Intel XE#367]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][295] ([Intel XE#367]) -> [SKIP][296] ([Intel XE#2423]) +4 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#367]) -> [SKIP][298] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2423] / [i915#2575]) -> [SKIP][300] ([Intel XE#367]) +4 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2907]) -> [SKIP][302] ([Intel XE#2136]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][304] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][306] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2136]) -> [SKIP][308] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [DMESG-WARN][309] -> [SKIP][310] ([Intel XE#2136] / [Intel XE#2351])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2136]) -> [DMESG-WARN][312] ([Intel XE#1727])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][313] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][314] ([Intel XE#2136])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2136]) -> [SKIP][316] ([Intel XE#3442])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#3432]) +3 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][319] ([Intel XE#3432]) -> [SKIP][320] ([Intel XE#2136])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][321] ([Intel XE#2887]) -> [SKIP][322] ([Intel XE#2136]) +21 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][323] ([Intel XE#2136]) -> [SKIP][324] ([Intel XE#2887]) +18 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][325] ([Intel XE#1727]) -> [SKIP][326] ([Intel XE#2136] / [Intel XE#2351])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][327] ([Intel XE#2136]) -> [SKIP][328] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][330] ([Intel XE#2136]) +12 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][331] ([Intel XE#2724]) -> [SKIP][332] ([Intel XE#2136]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][334] ([Intel XE#314])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][335] ([Intel XE#2325]) -> [SKIP][336] ([Intel XE#2423]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][337] ([Intel XE#2423]) -> [SKIP][338] ([Intel XE#2325]) +3 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#306]) -> [SKIP][340] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2423] / [i915#2575]) -> [SKIP][342] ([Intel XE#306]) +2 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_chamelium_color@degamma.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][343] ([Intel XE#2423]) -> [SKIP][344] ([Intel XE#2252]) +11 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          [SKIP][345] ([Intel XE#2252]) -> [SKIP][346] ([Intel XE#2423]) +14 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#373]) -> [SKIP][348] ([Intel XE#2423] / [i915#2575]) +11 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2423] / [i915#2575]) -> [SKIP][350] ([Intel XE#373]) +8 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][351] ([Intel XE#2341]) -> [FAIL][352] ([Intel XE#1178])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_content_protection@atomic.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][353] ([Intel XE#2423]) -> [INCOMPLETE][354] ([Intel XE#2715] / [Intel XE#3468])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][355] ([Intel XE#2390]) -> [SKIP][356] ([Intel XE#2423])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_content_protection@dp-mst-type-0.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][357] ([Intel XE#2341]) -> [SKIP][358] ([Intel XE#2423]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_content_protection@legacy.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#2423] / [i915#2575]) -> [FAIL][360] ([Intel XE#1178]) +2 other tests fail
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
    - shard-bmg:          [FAIL][361] ([Intel XE#1178]) -> [SKIP][362] ([Intel XE#2423])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][363] ([Intel XE#1178]) -> [SKIP][364] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_content_protection@srm.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][365] ([Intel XE#1188]) -> [SKIP][366] ([Intel XE#2423] / [i915#2575])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_content_protection@uevent.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_content_protection@uevent.html
    - shard-bmg:          [SKIP][367] ([Intel XE#2423]) -> [FAIL][368] ([Intel XE#1188])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_content_protection@uevent.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#2423] / [i915#2575]) -> [SKIP][370] ([Intel XE#308]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#308]) -> [SKIP][372] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][373] ([Intel XE#2423]) -> [SKIP][374] ([Intel XE#2320]) +3 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][375] ([Intel XE#2423]) -> [SKIP][376] ([Intel XE#2321]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#2423] / [i915#2575]) -> [SKIP][378] ([Intel XE#455]) +9 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_cursor_crc@cursor-random-max-size.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#455]) -> [SKIP][380] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][381] ([Intel XE#2320]) -> [SKIP][382] ([Intel XE#2423]) +8 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][383] ([Intel XE#2321]) -> [SKIP][384] ([Intel XE#2423]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          [SKIP][385] ([Intel XE#2286]) -> [SKIP][386] ([Intel XE#2423]) +2 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][387] ([Intel XE#2423]) -> [SKIP][388] ([Intel XE#2286])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][389] ([Intel XE#2291]) -> [SKIP][390] ([Intel XE#2423]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#2423] / [i915#2575]) -> [SKIP][392] ([Intel XE#323]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#323]) -> [SKIP][394] ([Intel XE#2423] / [i915#2575])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][395] ([Intel XE#1508]) -> [SKIP][396] ([Intel XE#2136])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2423] / [i915#2575]) -> [SKIP][398] ([Intel XE#307])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_display_modes@mst-extended-mode-negative.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-bmg:          [SKIP][399] ([Intel XE#2323]) -> [SKIP][400] ([Intel XE#2423])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_display_modes@mst-extended-mode-negative.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][401] ([Intel XE#2423]) -> [SKIP][402] ([Intel XE#1340])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#2136]) -> [SKIP][404] ([Intel XE#455]) +3 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][405] ([Intel XE#2244]) -> [SKIP][406] ([Intel XE#2136]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][407] ([Intel XE#2136]) -> [SKIP][408] ([Intel XE#2244]) +2 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [FAIL][409] ([Intel XE#1695]) -> [SKIP][410] ([Intel XE#2136])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][411] ([Intel XE#2136]) -> [FAIL][412] ([Intel XE#1695])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][413] ([Intel XE#2136]) -> [SKIP][414] ([Intel XE#776])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_fbcon_fbt@psr.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#776]) -> [SKIP][416] ([Intel XE#2136])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][417] ([Intel XE#2423]) -> [SKIP][418] ([Intel XE#2373])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#1138]) -> [SKIP][420] ([Intel XE#2423] / [i915#2575])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_feature_discovery@display-4x.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          [SKIP][421] ([Intel XE#2423]) -> [SKIP][422] ([Intel XE#1138])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_feature_discovery@display-4x.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][423] ([Intel XE#2375]) -> [SKIP][424] ([Intel XE#2423])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][425] ([Intel XE#2374]) -> [SKIP][426] ([Intel XE#2423])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_feature_discovery@psr2.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2423] / [i915#2575]) -> [SKIP][428] ([Intel XE#1135])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_feature_discovery@psr2.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][429] ([Intel XE#2316]) -> [FAIL][430] ([Intel XE#2882])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][431] ([Intel XE#2316]) -> [SKIP][432] ([Intel XE#2423]) +3 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [SKIP][433] ([Intel XE#2423]) -> [SKIP][434] ([Intel XE#2316]) +1 other test skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#2423] / [i915#2575]) -> [FAIL][436] ([Intel XE#301])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-bmg:          [DMESG-WARN][437] ([Intel XE#3468]) -> [SKIP][438] ([Intel XE#2423]) +1 other test skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#455]) -> [SKIP][440] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][441] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][442] ([Intel XE#2136]) +7 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][443] ([Intel XE#2136]) -> [SKIP][444] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][446] ([Intel XE#455]) +3 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#455]) -> [SKIP][448] ([Intel XE#2136]) +2 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-dg2-set2:     [DMESG-WARN][449] -> [SKIP][450] ([Intel XE#2136])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_flip_tiling@flip-change-tiling.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][451] ([Intel XE#2311]) -> [SKIP][452] ([Intel XE#2136]) +38 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][453] ([Intel XE#2311]) -> [SKIP][454] ([Intel XE#2312]) +2 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][455] ([Intel XE#2136]) -> [SKIP][456] ([Intel XE#2311]) +33 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#651]) -> [SKIP][458] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][459] ([Intel XE#2136]) -> [DMESG-FAIL][460] ([Intel XE#3468]) +5 other tests dmesg-fail
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][461] ([Intel XE#2136]) -> [INCOMPLETE][462] ([Intel XE#1727])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [ABORT][463] ([Intel XE#3468]) -> [SKIP][464] ([Intel XE#2136])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [FAIL][465] ([Intel XE#2333]) -> [SKIP][466] ([Intel XE#2312])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [DMESG-FAIL][467] ([Intel XE#3468]) -> [SKIP][468] ([Intel XE#2136]) +4 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][469] ([Intel XE#2312]) -> [FAIL][470] ([Intel XE#2333]) +2 other tests fail
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][471] ([Intel XE#2333]) -> [SKIP][472] ([Intel XE#2136]) +13 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][473] ([Intel XE#2136]) -> [FAIL][474] ([Intel XE#2333]) +6 other tests fail
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#658]) -> [SKIP][476] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2136]) -> [SKIP][478] ([Intel XE#651]) +17 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][480] ([Intel XE#651]) +12 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][481] ([Intel XE#2312]) -> [SKIP][482] ([Intel XE#2311]) +3 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][483] ([Intel XE#2136]) -> [SKIP][484] ([Intel XE#2312]) +17 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][485] ([Intel XE#2312]) -> [SKIP][486] ([Intel XE#2136]) +12 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#651]) -> [SKIP][488] ([Intel XE#2136]) +23 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][489] ([Intel XE#2352]) -> [SKIP][490] ([Intel XE#2136])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][491] ([Intel XE#2313]) -> [SKIP][492] ([Intel XE#2136]) +42 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][493] ([Intel XE#2136]) -> [SKIP][494] ([Intel XE#2313]) +33 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#653]) -> [SKIP][496] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][497] ([Intel XE#2313]) -> [SKIP][498] ([Intel XE#2312]) +2 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#653]) -> [SKIP][500] ([Intel XE#2136]) +23 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][502] ([Intel XE#653]) +3 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][503] ([Intel XE#2312]) -> [SKIP][504] ([Intel XE#2313]) +4 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#2136]) -> [SKIP][506] ([Intel XE#653]) +27 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][507] ([Intel XE#2423]) -> [SKIP][508] ([Intel XE#2502])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#605]) -> [SKIP][510] ([Intel XE#2423] / [i915#2575])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          [SKIP][511] ([Intel XE#2340]) -> [SKIP][512] ([Intel XE#2423])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][513] ([Intel XE#2423]) -> [SKIP][514] ([Intel XE#3374] / [Intel XE#3544])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg2-set2:     [FAIL][515] -> [SKIP][516] ([Intel XE#2423] / [i915#2575])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_hdr@static-swap.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][517] ([Intel XE#2423]) -> [DMESG-WARN][518] ([Intel XE#3468]) +11 other tests dmesg-warn
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][519] ([Intel XE#346]) -> [SKIP][520] ([Intel XE#2136])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#2136]) -> [SKIP][522] ([Intel XE#346])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][523] ([Intel XE#2934]) -> [SKIP][524] ([Intel XE#2136])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#2136]) -> [SKIP][526] ([Intel XE#2925])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#2927]) -> [SKIP][528] ([Intel XE#2136])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][529] ([Intel XE#2136]) -> [SKIP][530] ([Intel XE#2934])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_lease@lease-unleased-crtc:
    - shard-bmg:          [DMESG-WARN][531] -> [SKIP][532] ([Intel XE#2423])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_lease@lease-unleased-crtc.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_lease@lease-unleased-crtc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][533] ([Intel XE#2423]) -> [SKIP][534] ([Intel XE#2501])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][535] ([Intel XE#2486]) -> [SKIP][536] ([Intel XE#2423])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_panel_fitting@legacy.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-bmg:          [DMESG-WARN][537] ([Intel XE#3468]) -> [DMESG-FAIL][538] ([Intel XE#2705] / [Intel XE#3468])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_plane_lowres@tiling-4.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][539] ([Intel XE#2393]) -> [SKIP][540] ([Intel XE#2423])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][541] ([Intel XE#2423]) -> [SKIP][542] ([Intel XE#2393])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#2423] / [i915#2575]) -> [FAIL][544] ([Intel XE#361])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-bmg:          [SKIP][545] ([Intel XE#2763]) -> [SKIP][546] ([Intel XE#2423]) +3 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [SKIP][547] ([Intel XE#2423]) -> [DMESG-WARN][548] ([Intel XE#2566] / [Intel XE#3468])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#2423] / [i915#2575]) -> [SKIP][550] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][552] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][553] ([Intel XE#2423]) -> [SKIP][554] ([Intel XE#2763]) +1 other test skip
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#2938]) -> [SKIP][556] ([Intel XE#2136])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][557] ([Intel XE#2136]) -> [SKIP][558] ([Intel XE#870])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_pm_backlight@fade.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][560] ([Intel XE#1122])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-bmg:          [SKIP][561] ([Intel XE#2391]) -> [SKIP][562] ([Intel XE#2136])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#1129]) -> [SKIP][564] ([Intel XE#2136])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
    - shard-bmg:          [SKIP][565] ([Intel XE#2136]) -> [SKIP][566] ([Intel XE#2392])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#3309]) -> [SKIP][568] ([Intel XE#2136])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][569] ([Intel XE#2392]) -> [SKIP][570] ([Intel XE#2136])
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#908]) -> [SKIP][572] ([Intel XE#2136])
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
    - shard-bmg:          [SKIP][573] ([Intel XE#2505]) -> [SKIP][574] ([Intel XE#2136])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2-set2:     [FAIL][575] ([Intel XE#3527]) -> [SKIP][576] ([Intel XE#2136])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_pm_lpsp@kms-lpsp.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][577] ([Intel XE#1439] / [Intel XE#3141]) -> [SKIP][578] ([Intel XE#2446])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][579] ([Intel XE#2446]) -> [SKIP][580] ([Intel XE#1439])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [DMESG-WARN][581] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][582] ([Intel XE#2446])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#2446]) -> [DMESG-FAIL][584] ([Intel XE#1727] / [Intel XE#3468])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_pm_rpm@drm-resources-equal.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][585] ([Intel XE#2446]) -> [SKIP][586] ([Intel XE#1439] / [Intel XE#3141])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [SKIP][587] ([Intel XE#2446]) -> [INCOMPLETE][588] ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][589] ([Intel XE#2136]) -> [SKIP][590] ([Intel XE#1489]) +10 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#1489]) -> [SKIP][592] ([Intel XE#2136]) +8 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][593] ([Intel XE#2136]) -> [SKIP][594] ([Intel XE#1489]) +12 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][595] ([Intel XE#1489]) -> [SKIP][596] ([Intel XE#2136]) +11 other tests skip
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][597] ([Intel XE#2136]) -> [SKIP][598] ([Intel XE#2387])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#2136]) -> [SKIP][600] ([Intel XE#1122])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][602] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][603] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][604] ([Intel XE#2136]) +12 other tests skip
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-bmg:          [SKIP][605] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][606] ([Intel XE#2136]) +21 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-render.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-dg2-set2:     [SKIP][607] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][608] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-page-flip.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][609] ([Intel XE#2136]) -> [SKIP][610] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_psr@pr-cursor-plane-onoff.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][611] ([Intel XE#2136]) -> [SKIP][612] ([Intel XE#2234] / [Intel XE#2850]) +15 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#2351]) -> [SKIP][614] ([Intel XE#2850] / [Intel XE#929])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][615] ([Intel XE#2136]) -> [SKIP][616] ([Intel XE#2234])
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_psr@psr2-primary-render.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][617] ([Intel XE#2136]) -> [SKIP][618] ([Intel XE#2414])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][619] ([Intel XE#2939]) -> [SKIP][620] ([Intel XE#2136])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][621] ([Intel XE#2423] / [i915#2575]) -> [SKIP][622] ([Intel XE#3414])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-bmg:          [DMESG-FAIL][623] ([Intel XE#3468]) -> [SKIP][624] ([Intel XE#2423])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#2423] / [i915#2575]) -> [SKIP][626] ([Intel XE#1127]) +1 other test skip
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][627] ([Intel XE#2330]) -> [SKIP][628] ([Intel XE#2423])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][629] ([Intel XE#3414]) -> [SKIP][630] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][631] ([Intel XE#2423]) -> [SKIP][632] ([Intel XE#2330]) +2 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][633] ([Intel XE#3414]) -> [SKIP][634] ([Intel XE#2423]) +1 other test skip
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][635] ([Intel XE#2413]) -> [SKIP][636] ([Intel XE#2423]) +1 other test skip
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][637] ([Intel XE#1435]) -> [SKIP][638] ([Intel XE#2423])
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][639] ([Intel XE#2423]) -> [SKIP][640] ([Intel XE#1435])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][641] ([Intel XE#2423]) -> [SKIP][642] ([Intel XE#2426])
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][643] ([Intel XE#2423] / [i915#2575]) -> [FAIL][644] ([Intel XE#1729])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][645] ([Intel XE#2426]) -> [SKIP][646] ([Intel XE#2423])
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][647] ([Intel XE#2423] / [i915#2575]) -> [SKIP][648] ([Intel XE#330])
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@query-forked-busy-hang:
    - shard-bmg:          [SKIP][649] ([Intel XE#2423]) -> [DMESG-FAIL][650] ([Intel XE#3468]) +7 other tests dmesg-fail
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_vblank@query-forked-busy-hang.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_vblank@query-forked-busy-hang.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][651] ([Intel XE#2168]) -> [SKIP][652] ([Intel XE#2423] / [i915#2575])
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_vrr@cmrr.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][653] ([Intel XE#1499]) -> [SKIP][654] ([Intel XE#2423]) +1 other test skip
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_vrr@flip-dpms.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][655] ([Intel XE#2423]) -> [SKIP][656] ([Intel XE#1499]) +1 other test skip
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_vrr@flip-suspend.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          [SKIP][657] ([Intel XE#756]) -> [SKIP][658] ([Intel XE#2423]) +1 other test skip
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_writeback@writeback-check-output.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][659] ([Intel XE#756]) -> [SKIP][660] ([Intel XE#2423] / [i915#2575])
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          [SKIP][661] ([Intel XE#2423]) -> [SKIP][662] ([Intel XE#756])
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][663] ([Intel XE#2423] / [i915#2575]) -> [SKIP][664] ([Intel XE#1091] / [Intel XE#2849])
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-bmg:          [SKIP][665] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][666] ([Intel XE#2423])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][667] ([Intel XE#1130]) -> [SKIP][668] ([Intel XE#1280] / [Intel XE#455])
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][669] ([Intel XE#1130]) -> [SKIP][670] ([Intel XE#1126])
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][671] ([Intel XE#1126]) -> [SKIP][672] ([Intel XE#1130]) +1 other test skip
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     [SKIP][673] ([Intel XE#1130]) -> [SKIP][674] ([Intel XE#944]) +2 other tests skip
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_create@multigpu-create-massive-size.html
    - shard-bmg:          [SKIP][675] ([Intel XE#2504]) -> [SKIP][676] ([Intel XE#1130])
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_drm_fdinfo@parallel-utilization-single-full-load:
    - shard-bmg:          [SKIP][677] ([Intel XE#1130]) -> [DMESG-WARN][678] ([Intel XE#3468]) +15 other tests dmesg-warn
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_drm_fdinfo@parallel-utilization-single-full-load.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@xe_drm_fdinfo@parallel-utilization-single-full-load.html

  * igt@xe_eudebug@basic-client-th:
    - shard-dg2-set2:     [SKIP][679] ([Intel XE#2905]) -> [SKIP][680] ([Intel XE#1130]) +8 other tests skip
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@xe_eudebug@basic-client-th.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@xe_eudebug@basic-client-th.html

  * igt@xe_eudebug@basic-exec-queues-enable:
    - shard-bmg:          [SKIP][681] ([Intel XE#2905]) -> [SKIP][682] ([Intel XE#1130]) +13 other tests skip
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@xe_eudebug@basic-exec-queues-enable.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_eudebug@basic-exec-queues-enable.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          [SKIP][683] ([Intel XE#1130]) -> [SKIP][684] ([Intel XE#2905]) +17 other tests skip
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_eudebug@vm-bind-clear.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-dg2-set2:     [SKIP][685] ([Intel XE#1130]) -> [SKIP][686] ([Intel XE#2905]) +13 other tests skip
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_eudebug_online@basic-breakpoint.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][687] ([Intel XE#1130]) -> [FAIL][688] ([Intel XE#1600]) +1 other test fail
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
    - shard-bmg:          [SKIP][689] ([Intel XE#1130]) -> [DMESG-FAIL][690] ([Intel XE#3468]) +1 other test dmesg-fail
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][691] ([Intel XE#1473]) -> [SKIP][692] ([Intel XE#1130])
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][693] ([Intel XE#3468]) -> [SKIP][694] ([Intel XE#1130]) +5 other tests skip
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_balancer@once-virtual-rebind:
    - shard-dg2-set2:     [SKIP][695] ([Intel XE#1130]) -> [DMESG-WARN][696] ([Intel XE#1727])
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_exec_balancer@once-virtual-rebind.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_exec_balancer@once-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][697] ([Intel XE#1130]) -> [SKIP][698] ([Intel XE#2322]) +8 other tests skip
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][699] ([Intel XE#2322]) -> [SKIP][700] ([Intel XE#1130]) +12 other tests skip
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_compute_mode@once-userptr-unmap:
    - shard-bmg:          [SKIP][701] ([Intel XE#1130]) -> [DMESG-WARN][702] ([Intel XE#1727]) +2 other tests dmesg-warn
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_exec_compute_mode@once-userptr-unmap.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_exec_compute_mode@once-userptr-unmap.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][703] ([Intel XE#1130]) -> [SKIP][704] ([Intel XE#288]) +27 other tests skip
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][705] ([Intel XE#288]) -> [SKIP][706] ([Intel XE#1130]) +28 other tests skip
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][707] ([Intel XE#1130]) -> [SKIP][708] ([Intel XE#2360])
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@parallel-close-fd:
    - shard-bmg:          [INCOMPLETE][709] -> [SKIP][710] ([Intel XE#1130])
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@xe_exec_reset@parallel-close-fd.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_exec_reset@parallel-close-fd.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          [DMESG-WARN][711] ([Intel XE#3467]) -> [SKIP][712] ([Intel XE#1130])
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-dg2-set2:     [SKIP][713] ([Intel XE#1130]) -> [DMESG-WARN][714] ([Intel XE#3343])
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          [SKIP][715] ([Intel XE#1130]) -> [DMESG-WARN][716] ([Intel XE#3343] / [Intel XE#3468]) +1 other test dmesg-warn
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [DMESG-WARN][717] ([Intel XE#3343]) -> [DMESG-WARN][718] ([Intel XE#3343] / [Intel XE#3468])
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-dg2-set2:     [SKIP][719] ([Intel XE#1130]) -> [DMESG-WARN][720] ([Intel XE#3467]) +3 other tests dmesg-warn
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [FAIL][721] ([Intel XE#3499]) -> [SKIP][722] ([Intel XE#1130]) +1 other test skip
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [SKIP][723] ([Intel XE#1130]) -> [FAIL][724] ([Intel XE#3499])
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-FAIL][725] ([Intel XE#3467]) -> [SKIP][726] ([Intel XE#1130])
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-dg2-set2:     [DMESG-WARN][727] ([Intel XE#3467]) -> [SKIP][728] ([Intel XE#1130]) +1 other test skip
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][729] ([Intel XE#1130]) -> [SKIP][730] ([Intel XE#255])
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_huc_copy@huc_copy.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][731] ([Intel XE#586]) -> [SKIP][732] ([Intel XE#1130])
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@xe_mmap@small-bar.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_mmap@small-bar.html
    - shard-dg2-set2:     [SKIP][733] ([Intel XE#1130]) -> [SKIP][734] ([Intel XE#512])
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_mmap@small-bar.html
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][735] -> [DMESG-WARN][736] ([Intel XE#3467])
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_module_load@many-reload.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_module_load@many-reload.html
    - shard-dg2-set2:     [DMESG-WARN][737] ([Intel XE#3467]) -> [FAIL][738] ([Intel XE#3546])
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_module_load@many-reload.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_module_load@many-reload.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-dg2-set2:     [SKIP][739] ([Intel XE#1130]) -> [SKIP][740] ([Intel XE#3573]) +6 other tests skip
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][741] ([Intel XE#1130]) -> [SKIP][742] ([Intel XE#2248])
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][743] ([Intel XE#3573]) -> [SKIP][744] ([Intel XE#1130]) +7 other tests skip
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][745] ([Intel XE#1337]) -> [SKIP][746] ([Intel XE#1130])
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][747] ([Intel XE#1130]) -> [SKIP][748] ([Intel XE#977])
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][749] ([Intel XE#1420]) -> [SKIP][750] ([Intel XE#1130])
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][751] ([Intel XE#1130]) -> [SKIP][752] ([Intel XE#2245])
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_pat@pat-index-xelp.html
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][753] ([Intel XE#2236]) -> [SKIP][754] ([Intel XE#1130])
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - shard-dg2-set2:     [SKIP][755] ([Intel XE#1130]) -> [SKIP][756] ([Intel XE#979])
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          [SKIP][757] ([Intel XE#1130]) -> [SKIP][758] ([Intel XE#2284]) +1 other test skip
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_pm@d3cold-mmap-vram.html
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][759] ([Intel XE#1130]) -> [SKIP][760] ([Intel XE#2284])
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_pm@d3cold-mocs.html
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][761] ([Intel XE#2284]) -> [SKIP][762] ([Intel XE#1130]) +2 other tests skip
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-dg2-set2:     [SKIP][763] ([Intel XE#1130]) -> [DMESG-WARN][764] ([Intel XE#3468])
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_pm@d3hot-mmap-vram.html
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_pm@d3hot-mmap-vram.html
    - shard-bmg:          [DMESG-WARN][765] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][766] ([Intel XE#1130])
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@xe_pm@d3hot-mmap-vram.html
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [SKIP][767] ([Intel XE#1130]) -> [DMESG-WARN][768] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          [SKIP][769] ([Intel XE#1130]) -> [DMESG-WARN][770] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468])
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [SKIP][771] ([Intel XE#1130]) -> [DMESG-WARN][772] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_pm@s3-basic.html
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][773] ([Intel XE#1130]) -> [SKIP][774] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-bmg:          [SKIP][775] ([Intel XE#1130]) -> [DMESG-WARN][776] ([Intel XE#1727] / [Intel XE#3468])
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_pm@s4-basic.html
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [SKIP][777] ([Intel XE#1130]) -> [DMESG-WARN][778] ([Intel XE#2280] / [Intel XE#3468])
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_pm@s4-mocs.html
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][779] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][780] ([Intel XE#1130])
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][781] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [SKIP][782] ([Intel XE#1130])
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_pm@s4-vm-bind-unbind-all.html
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [SKIP][783] ([Intel XE#1130]) -> [DMESG-WARN][784] ([Intel XE#1727] / [Intel XE#3088] / [Intel XE#3468])
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][785] ([Intel XE#944]) -> [SKIP][786] ([Intel XE#1130]) +3 other tests skip
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][787] ([Intel XE#944]) -> [SKIP][788] ([Intel XE#1130]) +3 other tests skip
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][789] ([Intel XE#1130]) -> [SKIP][790] ([Intel XE#944]) +1 other test skip
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][791] ([Intel XE#1130]) -> [SKIP][792] ([Intel XE#3342])
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][793] ([Intel XE#2919]) -> [SKIP][794] ([Intel XE#1130])
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@xe_wedged@basic-wedged.html
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [ABORT][795] ([Intel XE#3421]) -> [SKIP][796] ([Intel XE#1130])
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [SKIP][797] ([Intel XE#1130]) -> [ABORT][798] ([Intel XE#3075] / [Intel XE#3084])
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
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
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021 -> xe-pw-141868v1

  IGT_8128: 8128
  xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021: 2a09bda868b896bc2a88a3a902e493063ce9e021
  xe-pw-141868v1: 141868v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/index.html

--===============7119646662037570852==
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
<tr><td><b>Series:</b></td><td>drm/i915/hdcp: Change log level for HDMI HDCP LIC check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141868/">https://patchwork.freedesktop.org/series/141868/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021_full -&gt; xe-pw-141868v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141868v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141868v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141868v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@core_getversion@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> +14 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141868v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@core_getstats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@core_getversion@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@core_getversion@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-2/igt@core_hotunplug@unplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-8/igt@core_hotunplug@unplug-rescan.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_color@ctm-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_color@ctm-0-25.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +48 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-4/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958">Intel XE#2958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_flip@busy-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +98 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +103 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_plane_lowres@tiling-4@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_plane_lowres@tiling-4@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +1 other test dmesg-warn</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_vblank@query-forked-busy@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-4/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-5/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-4/igt@xe_drm_fdinfo@utilization-single-full-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_module_load@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@xe_module_load@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@xe_oa@mmio-triggered-reports@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_oa@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_pm_residency@gt-c6-freeze@gt0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +259 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +180 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-5/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +87 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">PASS</a> +29 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-64x64.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-64x64.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_plane_alpha_blend@constant-alpha-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_plane_alpha_blend@constant-alpha-max.html">PASS</a> +92 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> +2 other tests pass</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html">PASS</a> +211 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_exec_threads@threads-bal-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-userptr.html">PASS</a> +157 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-4/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-6/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@core_hotunplug@hotunplug-rescan.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_addfb_basic@invalid-set-prop-any.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_atomic_interruptible@legacy-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_atomic_interruptible@legacy-cursor.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323">Intel XE#2323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_flip@flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_hdr@static-swap.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_lease@lease-unleased-crtc.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_lease@lease-unleased-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_plane_lowres@tiling-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_plane_lowres@tiling-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_pm_lpsp@kms-lpsp.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527">Intel XE#3527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_pm_rpm@drm-resources-equal.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_vblank@query-forked-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@kms_vblank@query-forked-busy-hang.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@parallel-utilization-single-full-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_drm_fdinfo@parallel-utilization-single-full-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@xe_drm_fdinfo@parallel-utilization-single-full-load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +15 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client-th:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@xe_eudebug@basic-client-th.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@xe_eudebug@basic-client-th.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues-enable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@xe_eudebug@basic-exec-queues-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_eudebug@basic-exec-queues-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_eudebug@vm-bind-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_eudebug@vm-bind-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) +1 other test fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@xe_evict@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_exec_balancer@once-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_exec_balancer@once-virtual-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-unmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_exec_compute_mode@once-userptr-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_exec_compute_mode@once-userptr-unmap.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-close-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-7/igt@xe_exec_reset@parallel-close-fd.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_exec_reset@parallel-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_module_load@many-reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_pm@d3hot-mmap-vram.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-5/igt@xe_pm@d3hot-mmap-vram.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_pm@s3-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-435/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_pm@s4-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-2/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_pm@s4-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_pm@s4-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-bmg-4/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-bmg-1/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141868v1/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021 -&gt; xe-pw-141868v1</li>
</ul>
<p>IGT_8128: 8128<br />
  xe-2287-2a09bda868b896bc2a88a3a902e493063ce9e021: 2a09bda868b896bc2a88a3a902e493063ce9e021<br />
  xe-pw-141868v1: 141868v1</p>

</body>
</html>

--===============7119646662037570852==--
