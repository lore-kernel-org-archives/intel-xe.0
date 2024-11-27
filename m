Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3F4D6ACEF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 16:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491F410EB4E;
	Wed, 27 Nov 2024 16:16:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371F710EB57;
 Wed, 27 Nov 2024 16:16:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8239754454121140729=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_prunue_audio_frequencies_b?=
 =?utf-8?q?ased_on_bw_limits_for_DP2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Nov 2024 16:16:45 -0000
Message-ID: <173272420520.3790071.18036980720592380475@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127120715.185348-1-vinod.govindapillai@intel.com>
In-Reply-To: <20241127120715.185348-1-vinod.govindapillai@intel.com>
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

--===============8239754454121140729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: prunue audio frequencies based on bw limits for DP2
URL   : https://patchwork.freedesktop.org/series/141839/
State : failure

== Summary ==

CI Bug Log - changes from xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3_full -> xe-pw-141839v1_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-141839v1_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141839v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141839v1_full:

### IGT changes ###

#### Warnings ####

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [SKIP][1] ([Intel XE#1130]) -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html

  
Known issues
------------

  Here are the changes found in xe-pw-141839v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#1885]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@core_hotunplug@hotreplug.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@core_hotunplug@hotreplug.html
    - shard-dg2-set2:     [PASS][5] -> [SKIP][6] ([Intel XE#1885])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@core_hotunplug@hotreplug.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2134])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@fbdev@nullptr.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@fbdev@nullptr.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2134])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@fbdev@unaligned-read.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][10] -> [SKIP][11] ([Intel XE#2134]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@fbdev@write.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@fbdev@write.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#2423]) +134 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_addfb_basic@bad-pitch-999.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [PASS][14] -> [FAIL][15] ([Intel XE#827]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#873])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2136]) +26 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [FAIL][19] ([Intel XE#1874])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1124])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1124]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2191])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#2191])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#367])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#787]) +34 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#2907])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#3432])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#787]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2325])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#373])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#1178])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2341])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#1188])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#1188])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2320])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2321])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1424])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#309])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#309])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2-set2:     [PASS][46] -> [SKIP][47] ([Intel XE#2423] / [i915#2575]) +47 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][48] ([Intel XE#2141]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1340])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([i915#3804])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1135])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][52] ([Intel XE#2882])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1421]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#310])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][55] -> [DMESG-WARN][56] ([Intel XE#877]) +1 other test dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-2/igt@kms_flip@2x-plain-flip.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#2423] / [i915#2575]) +14 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#886]) +3 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [PASS][60] -> [DMESG-WARN][61] ([Intel XE#2953] / [Intel XE#3086]) +1 other test dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][62] ([Intel XE#1727] / [Intel XE#3468]) +6 other tests dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2136]) +14 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1397] / [Intel XE#1745])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1397])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2293]) +8 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2311]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][68] ([Intel XE#2333]) +2 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#2136]) +15 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#656]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#651])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2136] / [Intel XE#2351])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#651])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2313]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2136]) +14 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#656]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#455])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2423]) +9 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2763]) +20 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#2938])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#2446]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_pm_rpm@cursor.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][84] -> [SKIP][85] ([Intel XE#2446]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#836])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes@plane-32:
    - shard-adlp:         [PASS][87] -> [DMESG-WARN][88] ([Intel XE#3086]) +2 other tests dmesg-warn
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-2/igt@kms_pm_rpm@universal-planes@plane-32.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-2/igt@kms_pm_rpm@universal-planes@plane-32.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1489]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#2893])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#1489])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2387])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@pr-cursor-render:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@pr-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_psr@pr-no-drrs.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#3414])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1435])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][97] -> [FAIL][98] ([Intel XE#899])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@query-idle@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][99] ([Intel XE#3468])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_vblank@query-idle@pipe-a-dp-2.html

  * igt@kms_vblank@query-idle@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][100] ([Intel XE#3468]) +3 other tests dmesg-warn
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_vblank@query-idle@pipe-a-hdmi-a-3.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-adlp:         [PASS][101] -> [DMESG-WARN][102] ([Intel XE#1033] / [Intel XE#1727]) +1 other test dmesg-warn
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-8/igt@kms_vblank@wait-forked-busy-hang.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1499])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#756])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_ccs@block-copy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#455] / [Intel XE#488])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
    - shard-lnl:          [PASS][106] -> [DMESG-WARN][107] ([Intel XE#2932]) +3 other tests dmesg-warn
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-6/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-6/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1062])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#2905]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_evict@evict-beng-small:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#688]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [PASS][111] -> [TIMEOUT][112] ([Intel XE#1473])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-large-cm:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_evict@evict-large-cm.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][114] -> [SKIP][115] ([Intel XE#1130]) +93 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_exec_basic@many-null-rebind.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#1130]) +19 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2322]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1392]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1392]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][120] -> [SKIP][121] ([Intel XE#1130]) +282 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@twice-null-defer-bind:
    - shard-adlp:         [PASS][122] -> [TIMEOUT][123] ([Intel XE#1033] / [Intel XE#1727])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-8/igt@xe_exec_basic@twice-null-defer-bind.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@xe_exec_basic@twice-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#1130]) +21 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#288]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-adlp:         [PASS][126] -> [DMESG-WARN][127] ([Intel XE#3086] / [Intel XE#3343])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][128] -> [SKIP][129] ([Intel XE#1192])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_live_ktest@xe_bo.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][130] -> [SKIP][131] ([Intel XE#2229])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@load:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2457])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@xe_module_load@load.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#378])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_module_load@load.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#3573])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][135] -> [ABORT][136] ([Intel XE#1607] / [Intel XE#1794])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#944])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          [PASS][138] -> [DMESG-WARN][139] ([Intel XE#3119])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-1/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_getclient:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#2423]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@core_getclient.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@core_getclient.html

  * igt@core_getversion@all-cards:
    - shard-bmg:          [FAIL][142] ([Intel XE#3249]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@core_getversion@all-cards.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@core_getversion@all-cards.html

  * igt@core_getversion@basic:
    - shard-bmg:          [FAIL][144] -> [PASS][145] +3 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@core_getversion@basic.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@core_getversion@basic.html
    - shard-dg2-set2:     [FAIL][146] ([Intel XE#3440]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@core_getversion@basic.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [SKIP][148] ([Intel XE#1885]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-adlp:         [DMESG-WARN][150] ([Intel XE#3086]) -> [PASS][151] +2 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-1/igt@core_hotunplug@hotunbind-rebind.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][152] ([Intel XE#3339]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [SKIP][154] ([Intel XE#2134]) -> [PASS][155] +2 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@fbdev@unaligned-write.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@fbdev@unaligned-write.html

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [SKIP][156] ([Intel XE#2423]) -> [PASS][157] +125 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_addfb_basic@unused-handle.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [SKIP][158] ([Intel XE#2136]) -> [PASS][159] +28 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][161] +6 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [FAIL][162] ([Intel XE#2958]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][164] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-4/igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-lnl:          [DMESG-WARN][166] ([Intel XE#2932]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - shard-lnl:          [INCOMPLETE][168] ([Intel XE#2049]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#2136]) -> [PASS][171] +4 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-dp-2:
    - shard-bmg:          [INCOMPLETE][172] ([Intel XE#3452]) -> [PASS][173] +1 other test pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_plane_lowres@tiling-x@pipe-b-dp-2.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_plane_lowres@tiling-x@pipe-b-dp-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#2423] / [i915#2575]) -> [PASS][175] +30 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#2446]) -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [SKIP][178] ([Intel XE#2446]) -> [PASS][179] +3 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-bmg:          [INCOMPLETE][180] ([Intel XE#2870]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][182] ([Intel XE#899]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_debugfs@gt:
    - shard-adlp:         [TIMEOUT][184] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][185] +2 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-4/igt@xe_debugfs@gt.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_debugfs@gt.html

  * igt@xe_query@query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1130]) -> [PASS][187] +59 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@xe_query@query-uc-fw-version-huc.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_query@query-uc-fw-version-huc.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][188] ([Intel XE#1130]) -> [PASS][189] +275 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@kms_3d:
    - shard-bmg:          [SKIP][190] ([Intel XE#2423]) -> [DMESG-WARN][191] ([Intel XE#1727] / [Intel XE#3468])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_3d.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_3d.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#623]) -> [SKIP][193] ([Intel XE#2423] / [i915#2575])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-bmg:          [SKIP][194] ([Intel XE#2233]) -> [SKIP][195] ([Intel XE#2423])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#2423] / [i915#2575]) -> [SKIP][197] ([Intel XE#873])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][198] ([Intel XE#2423]) -> [SKIP][199] ([Intel XE#2385])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][200] ([Intel XE#2423]) -> [SKIP][201] ([Intel XE#2370])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#316]) -> [SKIP][203] ([Intel XE#2136])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][205] ([Intel XE#316]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][206] ([Intel XE#2136]) -> [SKIP][207] ([Intel XE#2327]) +5 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][208] ([Intel XE#2136]) -> [DMESG-FAIL][209] ([Intel XE#3468]) +2 other tests dmesg-fail
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][210] ([Intel XE#2327]) -> [SKIP][211] ([Intel XE#2136]) +7 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-bmg:          [SKIP][212] ([Intel XE#2136]) -> [DMESG-WARN][213] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][214] ([Intel XE#1231]) -> [DMESG-FAIL][215] ([Intel XE#324])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][216] ([Intel XE#324]) -> [FAIL][217] ([Intel XE#1231])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1124]) -> [SKIP][219] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][220] ([Intel XE#2136]) -> [SKIP][221] ([Intel XE#610]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][222] ([Intel XE#2136]) -> [SKIP][223] ([Intel XE#1124]) +16 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1124]) -> [SKIP][225] ([Intel XE#2136]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         [FAIL][226] ([Intel XE#1874]) -> [TIMEOUT][227] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][229] ([Intel XE#1124]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][230] ([Intel XE#1124]) -> [SKIP][231] ([Intel XE#2136]) +18 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#2136]) -> [SKIP][233] ([Intel XE#1124]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2191]) -> [SKIP][235] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][236] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][237] ([Intel XE#2423]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][238] ([Intel XE#2423]) -> [SKIP][239] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][240] ([Intel XE#367]) -> [SKIP][241] ([Intel XE#2423]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#2423] / [i915#2575]) -> [SKIP][243] ([Intel XE#367])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][244] ([Intel XE#2423]) -> [SKIP][245] ([Intel XE#367]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#367]) -> [SKIP][247] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][249] ([Intel XE#2136]) +5 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][250] ([Intel XE#2887]) -> [SKIP][251] ([Intel XE#2136]) +23 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][253] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#2907]) -> [SKIP][255] ([Intel XE#2136])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-bmg:          [DMESG-FAIL][256] ([Intel XE#1727] / [Intel XE#3468]) -> [INCOMPLETE][257] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#2136]) -> [SKIP][259] ([Intel XE#3442])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][260] ([Intel XE#3432]) -> [SKIP][261] ([Intel XE#2136]) +3 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][262] ([Intel XE#2136]) -> [SKIP][263] ([Intel XE#3432]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][264] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][265] ([Intel XE#2136])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][267] ([Intel XE#2136] / [Intel XE#2351])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][268] ([Intel XE#2136]) -> [SKIP][269] ([Intel XE#2887]) +25 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#2136]) -> [SKIP][271] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][272] ([Intel XE#2724]) -> [SKIP][273] ([Intel XE#2136])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][274] ([Intel XE#2423]) -> [SKIP][275] ([Intel XE#2325]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          [SKIP][276] ([Intel XE#2325]) -> [SKIP][277] ([Intel XE#2423])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_chamelium_color@ctm-0-75.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2423] / [i915#2575]) -> [SKIP][279] ([Intel XE#306])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#306]) -> [SKIP][281] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_chamelium_color@ctm-negative.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][282] ([Intel XE#2252]) -> [SKIP][283] ([Intel XE#2423]) +17 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#373]) -> [SKIP][285] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#2423] / [i915#2575]) -> [SKIP][287] ([Intel XE#373]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          [SKIP][288] ([Intel XE#2423]) -> [SKIP][289] ([Intel XE#2252]) +16 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][290] ([Intel XE#2423]) -> [FAIL][291] ([Intel XE#1178])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][292] ([Intel XE#2423]) -> [SKIP][293] ([Intel XE#2390])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-0.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][294] ([Intel XE#2390]) -> [SKIP][295] ([Intel XE#2423])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][296] ([Intel XE#1178]) -> [SKIP][297] ([Intel XE#2423] / [i915#2575])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_content_protection@lic-type-0.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
    - shard-adlp:         [TIMEOUT][298] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][299] ([Intel XE#455])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-4/igt@kms_content_protection@lic-type-0.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#455]) -> [SKIP][301] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_content_protection@lic-type-1.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_content_protection@lic-type-1.html
    - shard-bmg:          [SKIP][302] ([Intel XE#2341]) -> [SKIP][303] ([Intel XE#2423])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_content_protection@lic-type-1.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][304] ([Intel XE#1178]) -> [SKIP][305] ([Intel XE#2423])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_content_protection@srm.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#2423] / [i915#2575]) -> [FAIL][307] ([Intel XE#1188])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_content_protection@uevent.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_content_protection@uevent.html
    - shard-bmg:          [SKIP][308] ([Intel XE#2423]) -> [FAIL][309] ([Intel XE#1188])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_content_protection@uevent.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][310] ([Intel XE#2320]) -> [SKIP][311] ([Intel XE#2423]) +7 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          [SKIP][312] ([Intel XE#2423]) -> [SKIP][313] ([Intel XE#2321])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-bmg:          [DMESG-FAIL][314] ([Intel XE#3468]) -> [SKIP][315] ([Intel XE#2423])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][316] ([Intel XE#2423]) -> [SKIP][317] ([Intel XE#2320]) +7 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#308]) -> [SKIP][319] ([Intel XE#2423] / [i915#2575])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x512.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#2423] / [i915#2575]) -> [SKIP][321] ([Intel XE#308])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][322] ([Intel XE#2321]) -> [SKIP][323] ([Intel XE#2423]) +3 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][324] ([Intel XE#2286]) -> [SKIP][325] ([Intel XE#2423]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [INCOMPLETE][326] -> [SKIP][327] ([Intel XE#2423])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][328] ([Intel XE#877]) -> [SKIP][329] ([Intel XE#2423])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][331] ([Intel XE#1727])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][332] ([Intel XE#2136]) -> [FAIL][333] ([Intel XE#2141])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          [SKIP][334] ([Intel XE#2423]) -> [SKIP][335] ([Intel XE#2323])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][336] ([Intel XE#2244]) -> [SKIP][337] ([Intel XE#2136]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][338] ([Intel XE#2136]) -> [SKIP][339] ([Intel XE#2244]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [DMESG-FAIL][340] ([Intel XE#3468]) -> [SKIP][341] ([Intel XE#2136]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-dg2-set2:     [INCOMPLETE][342] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][343] ([Intel XE#2136])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_fbcon_fbt@fbc-suspend.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][344] ([Intel XE#2136]) -> [SKIP][345] ([Intel XE#776])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_fbcon_fbt@psr.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][346] ([Intel XE#776]) -> [SKIP][347] ([Intel XE#2136])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#776]) -> [SKIP][349] ([Intel XE#2136])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][350] ([Intel XE#2423]) -> [SKIP][351] ([Intel XE#2375])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][352] ([Intel XE#2423]) -> [SKIP][353] ([Intel XE#2374])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_feature_discovery@psr1.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#1135]) -> [SKIP][355] ([Intel XE#2423] / [i915#2575])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_feature_discovery@psr2.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         [TIMEOUT][356] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][357] ([Intel XE#310])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [DMESG-WARN][358] ([Intel XE#3468]) -> [SKIP][359] ([Intel XE#2423]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][360] ([Intel XE#2423]) -> [FAIL][361] ([Intel XE#2882])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#455]) -> [SKIP][363] ([Intel XE#2136] / [Intel XE#2351])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][364] ([Intel XE#2380]) -> [SKIP][365] ([Intel XE#2136])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][366] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][367] ([Intel XE#2136]) +9 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][368] ([Intel XE#2136]) -> [SKIP][369] ([Intel XE#2293] / [Intel XE#2380]) +8 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#455]) -> [SKIP][371] ([Intel XE#2136]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#2423] / [i915#2575]) -> [SKIP][373] ([i915#5274])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][374] ([Intel XE#2311]) -> [SKIP][375] ([Intel XE#2136]) +46 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#2136]) -> [SKIP][377] ([Intel XE#651]) +7 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][378] ([Intel XE#2136]) -> [SKIP][379] ([Intel XE#2311]) +48 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][381] ([Intel XE#651]) +2 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#651]) -> [SKIP][383] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [TIMEOUT][384] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][385] ([Intel XE#1861])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [FAIL][386] ([Intel XE#2333]) -> [SKIP][387] ([Intel XE#2136]) +17 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][388] ([Intel XE#2136]) -> [FAIL][389] ([Intel XE#2333]) +24 other tests fail
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][390] ([Intel XE#2136]) -> [SKIP][391] ([Intel XE#2352])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#651]) -> [SKIP][393] ([Intel XE#2136]) +11 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][394] ([Intel XE#2352]) -> [SKIP][395] ([Intel XE#2136])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#653]) -> [SKIP][397] ([Intel XE#2136]) +10 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][399] ([Intel XE#653])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#653]) -> [SKIP][401] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][402] ([Intel XE#2350]) -> [SKIP][403] ([Intel XE#2136])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][404] ([Intel XE#2136]) -> [SKIP][405] ([Intel XE#2313]) +45 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][406] ([Intel XE#2313]) -> [SKIP][407] ([Intel XE#2136]) +47 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#2136]) -> [SKIP][409] ([Intel XE#653]) +9 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][410] ([Intel XE#2502]) -> [SKIP][411] ([Intel XE#2423])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     [DMESG-WARN][412] ([Intel XE#3468]) -> [SKIP][413] ([Intel XE#2423] / [i915#2575])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_hdr@bpc-switch-suspend.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][414] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][415] ([Intel XE#2423])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][416] ([Intel XE#2934]) -> [SKIP][417] ([Intel XE#2136])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#346]) -> [SKIP][419] ([Intel XE#2136])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-bmg:          [SKIP][420] ([Intel XE#346]) -> [SKIP][421] ([Intel XE#2136])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#2925]) -> [SKIP][423] ([Intel XE#2136])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][424] ([Intel XE#2927]) -> [SKIP][425] ([Intel XE#2136])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][426] ([Intel XE#2423]) -> [SKIP][427] ([Intel XE#2501])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][428] ([Intel XE#2423]) -> [SKIP][429] ([Intel XE#2486])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#2423] / [i915#2575]) -> [SKIP][431] ([Intel XE#455]) +5 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_plane_lowres@tiling-y.html
    - shard-bmg:          [SKIP][432] ([Intel XE#2423]) -> [SKIP][433] ([Intel XE#2393]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][434] ([Intel XE#2423]) -> [SKIP][435] ([Intel XE#2493])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-bmg:          [SKIP][436] ([Intel XE#2763]) -> [SKIP][437] ([Intel XE#2423]) +3 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][439] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
    - shard-dg2-set2:     [DMESG-WARN][440] ([Intel XE#1727]) -> [SKIP][441] ([Intel XE#2423] / [i915#2575])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][442] ([Intel XE#2423]) -> [SKIP][443] ([Intel XE#2763]) +3 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][444] ([Intel XE#2136]) -> [SKIP][445] ([Intel XE#870]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#2938]) -> [SKIP][447] ([Intel XE#2136])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][448] ([Intel XE#870]) -> [SKIP][449] ([Intel XE#2136])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_pm_backlight@fade.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#1122]) -> [SKIP][451] ([Intel XE#2136] / [Intel XE#2351])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-bmg:          [SKIP][452] ([Intel XE#2391]) -> [SKIP][453] ([Intel XE#2136])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][454] ([Intel XE#2136]) -> [SKIP][455] ([Intel XE#3309])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [FAIL][456] ([Intel XE#1430]) -> [SKIP][457] ([Intel XE#2136])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][458] ([Intel XE#1439]) -> [SKIP][459] ([Intel XE#2446])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][460] ([Intel XE#1439] / [Intel XE#3141]) -> [SKIP][461] ([Intel XE#2446])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][462] ([Intel XE#2446]) -> [SKIP][463] ([Intel XE#1439] / [Intel XE#3141])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [DMESG-WARN][464] ([Intel XE#3468]) -> [SKIP][465] ([Intel XE#2446])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          [SKIP][466] ([Intel XE#2446]) -> [DMESG-WARN][467] ([Intel XE#1727] / [Intel XE#3468])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_pm_rpm@universal-planes.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#2136]) -> [SKIP][469] ([Intel XE#1489]) +3 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#1489]) -> [SKIP][471] ([Intel XE#2136]) +6 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][472] ([Intel XE#1489]) -> [SKIP][473] ([Intel XE#2136]) +10 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][474] ([Intel XE#2136]) -> [SKIP][475] ([Intel XE#1489]) +14 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#1122]) -> [SKIP][477] ([Intel XE#2136])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#2136]) -> [SKIP][479] ([Intel XE#1122])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][481] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-bmg:          [SKIP][482] ([Intel XE#2136]) -> [SKIP][483] ([Intel XE#2234] / [Intel XE#2850]) +21 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-render.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][485] ([Intel XE#2136]) +3 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-blt.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][487] ([Intel XE#2850] / [Intel XE#929])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-render.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#2136]) -> [SKIP][489] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_psr@pr-sprite-plane-move.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][490] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][491] ([Intel XE#2136]) +25 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_psr@psr-primary-page-flip.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][492] ([Intel XE#2136]) -> [SKIP][493] ([Intel XE#2414])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][494] ([Intel XE#2414]) -> [SKIP][495] ([Intel XE#2136])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][496] ([Intel XE#3414]) -> [SKIP][497] ([Intel XE#2423]) +2 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#3414]) -> [SKIP][499] ([Intel XE#2423] / [i915#2575])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][500] ([Intel XE#2423]) -> [SKIP][501] ([Intel XE#3414]) +1 other test skip
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][502] ([Intel XE#2423]) -> [SKIP][503] ([Intel XE#2330])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][504] ([Intel XE#2330]) -> [SKIP][505] ([Intel XE#2423])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#2423] / [i915#2575]) -> [SKIP][507] ([Intel XE#3414])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][508] ([Intel XE#2413]) -> [SKIP][509] ([Intel XE#2423])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          [SKIP][510] ([Intel XE#2423]) -> [SKIP][511] ([Intel XE#2413])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][512] ([Intel XE#2423]) -> [SKIP][513] ([Intel XE#2426]) +1 other test skip
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@query-idle:
    - shard-bmg:          [SKIP][514] ([Intel XE#2423]) -> [DMESG-FAIL][515] ([Intel XE#3468])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_vblank@query-idle.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_vblank@query-idle.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][516] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][517] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][518] ([Intel XE#2423]) -> [SKIP][519] ([Intel XE#2168])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_vrr@cmrr.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][520] ([Intel XE#1499]) -> [SKIP][521] ([Intel XE#2423])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_vrr@flip-suspend.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][522] ([Intel XE#2423]) -> [SKIP][523] ([Intel XE#1499]) +2 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_vrr@max-min.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][524] ([Intel XE#756]) -> [SKIP][525] ([Intel XE#2423] / [i915#2575])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#2423] / [i915#2575]) -> [SKIP][527] ([Intel XE#756])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          [SKIP][528] ([Intel XE#2423]) -> [SKIP][529] ([Intel XE#756]) +1 other test skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][530] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][531] ([Intel XE#2423]) +1 other test skip
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#1126]) -> [SKIP][533] ([Intel XE#1130])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][534] ([Intel XE#1130]) -> [SKIP][535] ([Intel XE#2504])
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#2905]) -> [SKIP][537] ([Intel XE#1130]) +5 other tests skip
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          [SKIP][538] ([Intel XE#2905]) -> [SKIP][539] ([Intel XE#1130]) +19 other tests skip
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          [SKIP][540] ([Intel XE#1130]) -> [SKIP][541] ([Intel XE#2905]) +16 other tests skip
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_eudebug@discovery-empty.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@xe_eudebug@discovery-empty.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][542] ([Intel XE#1473]) -> [SKIP][543] ([Intel XE#1130])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [SKIP][544] ([Intel XE#1130]) -> [TIMEOUT][545] ([Intel XE#1473] / [Intel XE#2472])
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@twice-parallel-userptr-invalidate:
    - shard-bmg:          [SKIP][546] ([Intel XE#1130]) -> [DMESG-WARN][547] ([Intel XE#1727])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][548] ([Intel XE#1130]) -> [SKIP][549] ([Intel XE#2322]) +12 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][550] ([Intel XE#2322]) -> [SKIP][551] ([Intel XE#1130]) +12 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][552] ([Intel XE#3468]) -> [SKIP][553] ([Intel XE#1130]) +2 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#1130]) -> [SKIP][555] ([Intel XE#288]) +9 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][556] ([Intel XE#288]) -> [SKIP][557] ([Intel XE#1130]) +16 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][558] ([Intel XE#1130]) -> [SKIP][559] ([Intel XE#2360])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][560] ([Intel XE#1130]) -> [SKIP][561] ([Intel XE#2905]) +3 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_threads@threads-cm-userptr:
    - shard-bmg:          [FAIL][562] -> [SKIP][563] ([Intel XE#1130]) +1 other test skip
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@xe_exec_threads@threads-cm-userptr.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_exec_threads@threads-cm-userptr.html

  * igt@xe_exec_threads@threads-shared-vm-userptr-rebind:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#1130]) -> [DMESG-WARN][565] ([Intel XE#1727]) +2 other tests dmesg-warn
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@xe_exec_threads@threads-shared-vm-userptr-rebind.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_exec_threads@threads-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          [SKIP][566] ([Intel XE#1130]) -> [DMESG-WARN][567] ([Intel XE#3343])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [DMESG-WARN][568] ([Intel XE#3467]) -> [SKIP][569] ([Intel XE#1130]) +1 other test skip
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [DMESG-WARN][570] ([Intel XE#3343]) -> [SKIP][571] ([Intel XE#1130])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [SKIP][572] ([Intel XE#1130]) -> [FAIL][573] ([Intel XE#3499])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#1130]) -> [DMESG-WARN][575] ([Intel XE#3467])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [DMESG-FAIL][576] ([Intel XE#3467] / [Intel XE#3468]) -> [SKIP][577] ([Intel XE#1130])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-dg2-set2:     [DMESG-WARN][578] ([Intel XE#3467]) -> [SKIP][579] ([Intel XE#1130]) +1 other test skip
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [SKIP][580] ([Intel XE#1130]) -> [DMESG-WARN][581] ([Intel XE#3467] / [Intel XE#3468])
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][582] ([Intel XE#2459] / [Intel XE#2596]) -> [SKIP][583] ([Intel XE#1130])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@xe_media_fill@media-fill.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][584] ([Intel XE#3546]) -> [DMESG-WARN][585] ([Intel XE#3467])
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-dg2-set2:     [SKIP][586] ([Intel XE#3573]) -> [SKIP][587] ([Intel XE#1130]) +3 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_oa@invalid-remove-userspace-config.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-bmg:          [FAIL][588] ([Intel XE#2249]) -> [SKIP][589] ([Intel XE#1130])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@xe_oa@mmio-triggered-reports.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@oa-exponents:
    - shard-bmg:          [SKIP][590] ([Intel XE#1130]) -> [DMESG-WARN][591] ([Intel XE#3468]) +4 other tests dmesg-warn
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_oa@oa-exponents.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_oa@oa-exponents.html

  * igt@xe_oa@polling:
    - shard-dg2-set2:     [SKIP][592] ([Intel XE#1130]) -> [SKIP][593] ([Intel XE#3573]) +1 other test skip
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@xe_oa@polling.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_oa@polling.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][594] ([Intel XE#2248]) -> [SKIP][595] ([Intel XE#1130])
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@xe_oa@unprivileged-single-ctx-counters.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][596] ([Intel XE#2245]) -> [SKIP][597] ([Intel XE#1130])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@xe_pat@pat-index-xelp.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][598] ([Intel XE#1173]) -> [SKIP][599] ([Intel XE#1061])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_peer2peer@read.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][600] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][601] ([Intel XE#1130]) +1 other test skip
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][602] ([Intel XE#2284]) -> [SKIP][603] ([Intel XE#1130]) +1 other test skip
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@d3hot-mocs:
    - shard-bmg:          [SKIP][604] ([Intel XE#1130]) -> [DMESG-WARN][605] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-warn
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_pm@d3hot-mocs.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_pm@d3hot-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][606] ([Intel XE#1130]) -> [SKIP][607] ([Intel XE#2284]) +2 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#1130]) -> [SKIP][609] ([Intel XE#2284] / [Intel XE#366])
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [SKIP][610] ([Intel XE#1130]) -> [DMESG-WARN][611] ([Intel XE#1727] / [Intel XE#3468])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@xe_pm@s2idle-multiple-execs.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][612] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][613] ([Intel XE#1130])
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-bmg:          [DMESG-WARN][614] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][615] ([Intel XE#1130])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@xe_pm@s4-multiple-execs.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][616] ([Intel XE#579]) -> [SKIP][617] ([Intel XE#1130])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][618] ([Intel XE#944]) -> [SKIP][619] ([Intel XE#1130]) +2 other tests skip
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_query@multigpu-query-engines.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          [SKIP][620] ([Intel XE#944]) -> [SKIP][621] ([Intel XE#1130]) +1 other test skip
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@xe_query@multigpu-query-invalid-size.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          [SKIP][622] ([Intel XE#1130]) -> [SKIP][623] ([Intel XE#944]) +2 other tests skip
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][624] ([Intel XE#1130]) -> [SKIP][625] ([Intel XE#3342]) +1 other test skip
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@bind-execqueues-conflict:
    - shard-bmg:          [DMESG-WARN][626] ([Intel XE#1727]) -> [SKIP][627] ([Intel XE#1130])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@xe_vm@bind-execqueues-conflict.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_vm@bind-execqueues-conflict.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2870
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3452]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3452
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3 -> xe-pw-141839v1

  IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3: 434aceeb99d1eeb41253f3ff58fbb9686d8abfb3
  xe-pw-141839v1: 141839v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/index.html

--===============8239754454121140729==
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
<tr><td><b>Series:</b></td><td>prunue audio frequencies based on bw limits for DP2</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141839/">https://patchwork.freedesktop.org/series/141839/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3_full -&gt; xe-pw-141839v1_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-141839v1_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141839v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141839v1_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_wedged@wedged-mode-toggle:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141839v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +134 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-2/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_flip@2x-plain-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-32:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-2/igt@kms_pm_rpm@universal-planes@plane-32.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-2/igt@kms_pm_rpm@universal-planes@plane-32.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_vblank@query-idle@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_vblank@query-idle@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-8/igt@kms_vblank@wait-forked-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@kms_vblank@wait-forked-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-6/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-6/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_evict@evict-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_exec_basic@many-null-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +93 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +282 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-8/igt@xe_exec_basic@twice-null-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@xe_exec_basic@twice-null-defer-bind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_oa@syncs-syncobj-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-1/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@core_getclient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@core_getclient.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@core_getversion@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@core_getversion@basic.html">PASS</a> +3 other tests pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@core_getversion@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@core_getversion@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-1/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@fbdev@unaligned-write.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_addfb_basic@unused-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html">PASS</a> +125 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958">Intel XE#2958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-4/igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_plane_lowres@tiling-x@pipe-b-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3452">Intel XE#3452</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_plane_lowres@tiling-x@pipe-b-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2870">Intel XE#2870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@gt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-4/igt@xe_debugfs@gt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@xe_debugfs@gt.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@xe_query@query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_query@query-uc-fw-version-huc.html">PASS</a> +59 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +275 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_3d.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-4/igt@kms_content_protection@lic-type-0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-256x256.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x256.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323">Intel XE#2323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +24 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_vblank@query-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_vblank@query-idle.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@xe_exec_threads@threads-cm-userptr.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_exec_threads@threads-cm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@xe_exec_threads@threads-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_exec_threads@threads-shared-vm-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_oa@oa-exponents.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_oa@oa-exponents.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-434/igt@xe_oa@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_oa@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_pm@d3hot-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_pm@d3hot-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-466/igt@xe_pm@s2idle-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-436/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_pm@s4-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-5/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-conflict:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3/shard-bmg-4/igt@xe_vm@bind-execqueues-conflict.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141839v1/shard-bmg-1/igt@xe_vm@bind-execqueues-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3 -&gt; xe-pw-141839v1</li>
</ul>
<p>IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2284-434aceeb99d1eeb41253f3ff58fbb9686d8abfb3: 434aceeb99d1eeb41253f3ff58fbb9686d8abfb3<br />
  xe-pw-141839v1: 141839v1</p>

</body>
</html>

--===============8239754454121140729==--
