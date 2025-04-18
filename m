Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2A0C369AB
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 21:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D4C10E141;
	Fri, 18 Apr 2025 21:53:45 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C997D10E141;
 Fri, 18 Apr 2025 21:53:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3162173366667249934=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_series_starting_with_=5B1/?=
 =?utf-8?q?1=5D_drm/xe/eustall=3A_Resolve_a_possible_circular_locking_depend?=
 =?utf-8?q?ency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Apr 2025 21:53:44 -0000
Message-ID: <174501322480.18569.5489585888039872459@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <c896932fca84f79db2df5942911997ed77b2b9b6.1744934656.git.harish.chegondi@intel.com>
In-Reply-To: <c896932fca84f79db2df5942911997ed77b2b9b6.1744934656.git.harish.chegondi@intel.com>
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

--===============3162173366667249934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/1] drm/xe/eustall: Resolve a possible circular locking dependency
URL   : https://patchwork.freedesktop.org/series/147950/
State : success

== Summary ==

CI Bug Log - changes from xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68_FULL -> xe-pw-147950v1_FULL
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

  Here are the changes found in xe-pw-147950v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2327]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1407])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][4] -> [DMESG-FAIL][5] ([Intel XE#4543]) +1 other test dmesg-fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#787]) +106 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#2705] / [Intel XE#4212]) +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][17] -> [INCOMPLETE][18] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +1 other test incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2325])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2252]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#373]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][23] ([Intel XE#1178]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][24] ([Intel XE#1178]) +2 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2320]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2321])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#309])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-435/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2291]) +11 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2291])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4156])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2316])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#310]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][36] ([Intel XE#3428]) +6 other tests dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2316]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#3321])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:
    - shard-bmg:          [PASS][40] -> [FAIL][41] ([Intel XE#2882]) +4 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][42] -> [FAIL][43] ([Intel XE#886]) +2 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2293]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2311]) +7 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4141]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#656]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [PASS][50] -> [DMESG-WARN][51] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#651]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2312]) +13 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#656]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2352])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2313]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#653]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#1503])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-7/igt@kms_hdr@static-toggle-dpms.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     NOTRUN -> [FAIL][60] ([Intel XE#616]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#2571])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2763]) +9 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#718])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2392])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1489]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#2850] / [Intel XE#929])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#1435])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][72] -> [FAIL][73] ([Intel XE#2142]) +1 other test fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#756])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2905]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2905] / [Intel XE#3889]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#4577])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_evict@evict-small-external:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#688])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@xe_evict@evict-small-external.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][79] -> [SKIP][80] ([Intel XE#1392]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2322]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1392]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#288])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#2905]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][85] -> [DMESG-WARN][86] ([Intel XE#3876])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - shard-adlp:         [PASS][87] -> [DMESG-WARN][88] ([Intel XE#4173]) +10 other tests dmesg-warn
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2833])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2459] / [Intel XE#2596])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@enable-disable@rcs-0:
    - shard-bmg:          NOTRUN -> [FAIL][91] ([Intel XE#4804])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_oa@enable-disable@rcs-0.html
    - shard-lnl:          NOTRUN -> [FAIL][92] ([Intel XE#4804])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-6/igt@xe_oa@enable-disable@rcs-0.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#4650])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#4650])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#4733])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#4733]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-topology:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#944])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#4130])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#4351])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][100] ([Intel XE#827]) -> [PASS][101] +2 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          [DMESG-FAIL][102] ([Intel XE#3428]) -> [PASS][103] +1 other test pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][104] ([Intel XE#4543]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#2191]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][108] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#309]) -> [PASS][111] +3 other tests pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][112] ([Intel XE#2291]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][114] ([Intel XE#4302]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#310]) -> [PASS][117] +2 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [SKIP][118] ([Intel XE#2316]) -> [PASS][119] +5 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
    - shard-bmg:          [FAIL][120] ([Intel XE#2882]) -> [PASS][121] +8 other tests pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     [FAIL][122] ([Intel XE#301]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [FAIL][124] ([Intel XE#3321]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [DMESG-WARN][126] ([Intel XE#4173]) -> [PASS][127] +2 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#656]) -> [PASS][129] +5 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][130] ([Intel XE#1503]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
    - shard-lnl:          [INCOMPLETE][132] -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][134] ([Intel XE#4596]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#4596]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [DMESG-WARN][138] ([Intel XE#3428]) -> [PASS][139] +6 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_vblank@query-idle@pipe-d-dp-2:
    - shard-bmg:          [FAIL][140] -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_vblank@query-idle@pipe-d-dp-2.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-2/igt@kms_vblank@query-idle@pipe-d-dp-2.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1392]) -> [PASS][143] +2 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [SKIP][166], [PASS][167], [PASS][168], [PASS][169]) ([Intel XE#378]) -> ([PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-463/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-463/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-463/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-436/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-466/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-436/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-436/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-433/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-466/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-433/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-433/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-435/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-435/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-435/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-434/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-434/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-434/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-434/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-434/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-432/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-432/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-432/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-434/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-434/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-434/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-463/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-463/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-463/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-435/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-435/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-436/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-436/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-435/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-466/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-466/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-466/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-466/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-433/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-433/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-433/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [DMESG-WARN][195] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-adlp-4/igt@xe_module_load@many-reload.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-adlp-8/igt@xe_module_load@many-reload.html

  * igt@xe_oa@buffer-size:
    - shard-bmg:          [FAIL][197] ([Intel XE#4541]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@xe_oa@buffer-size.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@xe_oa@buffer-size.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][199] ([Intel XE#1794]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-1/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][201] -> [PASS][202] +1 other test pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-434/igt@xe_pmu@gt-frequency.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-466/igt@xe_pmu@gt-frequency.html

  * igt@xe_vm@munmap-style-unbind-userptr-all:
    - shard-bmg:          [INCOMPLETE][203] ([Intel XE#2594]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@xe_vm@munmap-style-unbind-userptr-all.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@xe_vm@munmap-style-unbind-userptr-all.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [DMESG-FAIL][205] -> [FAIL][206] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][207] ([Intel XE#4173] / [Intel XE#4543]) -> [DMESG-FAIL][208] ([Intel XE#4543])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][210] ([Intel XE#787]) +5 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#787]) -> [SKIP][212] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][213] ([Intel XE#2341]) -> [FAIL][214] ([Intel XE#1178]) +1 other test fail
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_content_protection@atomic.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][215] ([Intel XE#1178]) -> [SKIP][216] ([Intel XE#455])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-432/igt@kms_content_protection@legacy.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#455]) -> [FAIL][218] ([Intel XE#1178])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_content_protection@srm.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-433/igt@kms_content_protection@srm.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][219] ([Intel XE#3321]) -> [SKIP][220] ([Intel XE#2316]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][221] ([Intel XE#2312]) -> [SKIP][222] ([Intel XE#2311]) +14 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][223] ([Intel XE#2311]) -> [SKIP][224] ([Intel XE#2312]) +18 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#651]) -> [SKIP][226] ([Intel XE#656]) +6 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#656]) -> [SKIP][228] ([Intel XE#651]) +5 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][229] ([Intel XE#4141]) -> [SKIP][230] ([Intel XE#2312]) +3 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][231] ([Intel XE#2312]) -> [SKIP][232] ([Intel XE#4141]) +8 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][233] ([Intel XE#2312]) -> [SKIP][234] ([Intel XE#2313]) +13 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#656]) -> [SKIP][236] ([Intel XE#653]) +6 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#653]) -> [SKIP][238] ([Intel XE#656]) +5 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][239] ([Intel XE#2313]) -> [SKIP][240] ([Intel XE#2312]) +19 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][241] ([Intel XE#2493]) -> [SKIP][242] ([Intel XE#4596])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][243] ([Intel XE#4596]) -> [SKIP][244] ([Intel XE#2493])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [DMESG-WARN][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [SKIP][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270]) ([Intel XE#2457] / [Intel XE#3428]) -> ([PASS][271], [PASS][272], [PASS][273], [SKIP][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296]) ([Intel XE#2457])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-2/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-2/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-2/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-7/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-7/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-7/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-7/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-1/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-1/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-1/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-8/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-8/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-8/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-8/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-8/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-3/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-3/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-1/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-1/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-1/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-2/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-2/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-2/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-3/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-3/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][297] ([Intel XE#1173]) -> [SKIP][298] ([Intel XE#1061])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-463/igt@xe_peer2peer@write.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@xe_peer2peer@write.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
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
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4577
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4804
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68 -> xe-pw-147950v1

  IGT_8326: 8326
  xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68: 1e5b5f168ee053192ea7ec05bfe826f848be7d68
  xe-pw-147950v1: 147950v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/index.html

--===============3162173366667249934==
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
<tr><td><b>Series:</b></td><td>series starting with [1/1] drm/xe/eustall: R=
esolve a possible circular locking dependency</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147950/">https://patchwork.freedesktop.org/series/147950/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147950v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147950v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2971-1e5b5f168ee053192ea7ec05bfe826f84=
8be7d68_FULL -&gt; xe-pw-147950v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147950v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-cc=
s-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel=
 XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-adlp-9/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-a=
dlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_bw@linear-tiling-3-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-yf-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +106 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE=
#4212</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-436/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4522">Intel XE#4522</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-=
change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-ena=
ble-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@kms_content_protection@atomic=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-dg2-433/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscree=
n-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-435/igt@kms_cu=
rsor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@kms_cu=
rsor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblan=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-432/igt@kms_fl=
ip@2x-dpms-vs-vblank-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@kms_flip@2x-dpms-=
vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible@bc-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +6 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-8/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vbla=
nk@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_flip=
@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/i=
gt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel =
XE#2882</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-lnl-7/igt@kms_flip=
@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-6/igt@kms_flip@p=
lain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-d=
g2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-adlp-3/igt@kms_frontbuffe=
r_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 =
other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-7/igt@kms_hdr@=
static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_hdr@static-toggle-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@kms_plane_cursor@overlay.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-lnl-4/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-147950v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel =
XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">I=
ntel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@kms_psr@fbc-pr-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
50">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-1/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-lnl-2/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-5/igt@kms_v=
rr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_writeback@writeback-fb-id=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_eudebug@attach-debug-metad=
ata.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufen=
ce-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_eudebug_online@set-breakpo=
int-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@xe_evict@evict-small-external=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exe=
c-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exe=
c-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@xe_exec_fault_mode@many-exe=
cqueues-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@xe_exec_sip_eudebug@breakpoin=
t-writesip-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-463/igt@xe_exe=
c_threads@threads-hang-fd-userptr-rebind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-435/igt@xe=
_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early=
:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-adlp-4/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_device_probe_early.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1=
/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_device_=
probe_early.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +10 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_oa@enable-disable@rcs-0.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4804">Intel XE#4804</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-lnl-6/igt@xe_oa@enable-disable@rcs-0.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4804">Intel XE#4804</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/igt@xe_pmu@all-fn-engine-activity=
-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_pmu@fn-engine-activity-sch=
ed-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-po=
st-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@xe_pxp@pxp-stale-queue-post-t=
ermination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_query@multigpu-query-topol=
ogy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@xe_sriov_auto_provisioning@=
selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_sriov_scheduling@nonpreemp=
t-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-2/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/ig=
t@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +2 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel =
XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147950v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomi=
c@pipe-d-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">I=
ntel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-147950v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-ro=
tate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/=
shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-147950v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel=
 XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147950v1/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tra=
nsitions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147950v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_fl=
ip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-=
433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@kms=
_flip@2x-flip-vs-modeset-vs-hang.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_flip=
@flip-vs-absolute-wf_vblank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/i=
gt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html">PASS</a> +8 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950=
v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a=
6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_flip=
@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/i=
gt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147950v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-s=
hrfb-draw-blt.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47950v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indf=
b-draw-render.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@kms_hdr@s=
tatic-toggle-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-lnl-5/igt@kms_plan=
e@plane-position-hole-dpms@pipe-a-plane-3.html">INCOMPLETE</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-7/i=
gt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_pl=
ane_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-433/igt@k=
ms_plane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_pm_r=
pm@modeset-non-lpsp-stress-no-wait.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-=
bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +6 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_vbla=
nk@query-idle@pipe-d-dp-2.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-2/igt@kms_vblank@query-id=
le@pipe-d-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v=
1/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.=
html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-463/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-463/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-4=
63/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68=
/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848=
be7d68/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe8=
26f848be7d68/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7e=
c05bfe826f848be7d68/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee0531=
92ea7ec05bfe826f848be7d68/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168=
ee053192ea7ec05bfe826f848be7d68/shard-dg2-433/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5=
b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-433/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-29=
71-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-d=
g2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/s=
hard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be=
7d68/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826=
f848be7d68/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05=
bfe826f848be7d68/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192e=
a7ec05bfe826f848be7d68/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee0=
53192ea7ec05bfe826f848be7d68/shard-dg2-434/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f=
168ee053192ea7ec05bfe826f848be7d68/shard-dg2-434/igt@xe_module_load@load.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-=
1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-432/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-432/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-434/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-147950v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-43=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7950v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-463/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/sh=
ard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-435/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-147950v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47950v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-435/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147950v1/shard-dg2-436/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/s=
hard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-436/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-147950v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-=
466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-466/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147950v1/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-466/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147950v1/shard-dg2-433/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/=
shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-433/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-adlp-4/igt@xe_modu=
le_load@many-reload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-a=
dlp-8/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@xe_oa@bu=
ffer-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4541">Intel XE#4541</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@xe_oa@buffer-size.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-lnl-2/igt@xe_pm@s4=
-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-lnl-1/igt@xe_pm@s4-basic-exe=
c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-434/igt@xe_pmu=
@gt-frequency.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147950v1/shard-dg2-466/igt@xe_pmu@gt-frequency.html">PAS=
S</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@xe_vm@mu=
nmap-style-unbind-userptr-all.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4=
/igt@xe_vm@munmap-style-unbind-userptr-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">DMESG-FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-2/ig=
t@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701">Intel XE#3701=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718"=
>Intel XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel X=
E#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-147950v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
87">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-147950v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen1=
2-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
950v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d=
-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-432/igt@kms_co=
ntent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-464/igt@kms_c=
ontent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_co=
ntent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-433/igt@kms_conten=
t_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-=
bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel =
XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1479=
50v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47950v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1479=
50v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147950v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-147950v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47950v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#65=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1479=
50v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be=
7d68/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f8=
48be7d68/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe8=
26f848be7d68/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05=
bfe826f848be7d68/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053=
192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168e=
e053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f=
168ee053192ea7ec05bfe826f848be7d68/shard-bmg-6/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e=
5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-8/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-297=
1-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-8/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-8/igt@xe_m=
odule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bmg-3/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-bm=
g-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shar=
d-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/=
shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7=
d68/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2971-1e5b5f168ee053192ea7ec05bfe826f84=
8be7d68/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel =
XE#3428</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147950v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147950v1/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/sh=
ard-bmg-7/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147950v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147950v1/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147950v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147950v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147950v1/shard-bmg-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147950v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147950v1/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147950v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68/shard-dg2-463/igt@xe_pee=
r2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147950v1/shard-dg2-432/igt@xe_peer2peer@wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68 -&gt; xe-pw-147=
950v1</li>
</ul>
<p>IGT_8326: 8326<br />
  xe-2971-1e5b5f168ee053192ea7ec05bfe826f848be7d68: 1e5b5f168ee053192ea7ec0=
5bfe826f848be7d68<br />
  xe-pw-147950v1: 147950v1</p>

</body>
</html>

--===============3162173366667249934==--
