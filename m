Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875E9C7115B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 18:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A59F10E0BF;
	Fri, 20 Jun 2025 18:07:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195A710E0BF;
 Fri, 20 Jun 2025 18:07:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8801637190943617795=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Modify_drm_helpers_to_use_?=
 =?utf-8?q?luminance_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Jun 2025 18:07:58 -0000
Message-ID: <175044287807.98213.4566511716193642013@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250620063445.3603086-1-suraj.kandpal@intel.com>
In-Reply-To: <20250620063445.3603086-1-suraj.kandpal@intel.com>
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

--===============8801637190943617795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Modify drm helpers to use luminance (rev4)
URL   : https://patchwork.freedesktop.org/series/147565/
State : success

== Summary ==

CI Bug Log - changes from xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968_FULL -> xe-pw-147565v4_FULL
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

  Here are the changes found in xe-pw-147565v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [PASS][1] -> [SKIP][2] ([Intel XE#4963])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#3658])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#316]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#4543]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124]) +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][9] -> [SKIP][10] ([Intel XE#4947]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#619])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#2191])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#787]) +90 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#3432])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#4416]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2325])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#306])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#373]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#307])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#1188])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-1/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#308])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1424])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2320])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2291]) +7 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][32] -> [FAIL][33] ([Intel XE#1475])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4354])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#4422])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2316]) +8 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#301]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][39] -> [FAIL][40] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][41] -> [DMESG-WARN][42] ([Intel XE#2953] / [Intel XE#4173]) +11 other tests dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#3149] / [Intel XE#886])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][45] -> [FAIL][46] ([Intel XE#886]) +2 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_event_leak@basic:
    - shard-adlp:         [PASS][47] -> [SKIP][48] ([Intel XE#4950]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_flip_event_leak@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_flip_event_leak@basic.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#455]) +13 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][50] -> [FAIL][51] ([Intel XE#1874])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#651])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2311]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#4141]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#651]) +21 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2312]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#656]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2313]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#653]) +21 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1470] / [Intel XE#2853])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#3012])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2925])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#4596])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#3307])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#718])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1489]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1489])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-4/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1406])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#4609])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2330])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#3414])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1123])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1126])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1062])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#4837]) +7 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#4837]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2322])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#288]) +18 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2360])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [PASS][85] -> [DMESG-WARN][86] ([Intel XE#3868])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-8/igt@xe_exec_reset@cm-close-fd.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4943]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-multi-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#4915]) +185 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-multi-fault.html

  * igt@xe_mmap@bad-flags:
    - shard-adlp:         [PASS][89] -> [SKIP][90] ([Intel XE#4945]) +14 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@xe_mmap@bad-flags.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@xe_mmap@bad-flags.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#512])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@xe_mmap@small-bar.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2838] / [Intel XE#979])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2284])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#584])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#4733]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#944])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#944])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#944])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#4814]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#3342])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][103] ([Intel XE#3908]) -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][105] ([Intel XE#3862]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#4208] / [i915#2575]) -> [PASS][108] +5 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][109] ([Intel XE#2291]) -> [PASS][110] +9 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][111] ([Intel XE#4302]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][113] ([Intel XE#4294]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][115] ([Intel XE#2316]) -> [PASS][116] +9 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-lnl:          [FAIL][117] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-5/igt@kms_flip@plain-flip-ts-check.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-5/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a3:
    - shard-bmg:          [FAIL][119] ([Intel XE#2882]) -> [PASS][120] +2 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-4/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [FAIL][121] ([Intel XE#886]) -> [PASS][122] +3 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][123] ([Intel XE#4543]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][125] ([Intel XE#1874]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][127] ([Intel XE#1503]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][129] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][130] +8 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][131] ([Intel XE#4596]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][133] ([Intel XE#4459]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [DMESG-WARN][135] ([Intel XE#3876]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][137] ([Intel XE#5018]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_oa@oa-exponents:
    - shard-lnl:          [TIMEOUT][139] -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-6/igt@xe_oa@oa-exponents.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-1/igt@xe_oa@oa-exponents.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#4208]) -> [PASS][142] +15 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-adlp:         [SKIP][143] ([Intel XE#316]) -> [SKIP][144] ([Intel XE#2351] / [Intel XE#4947])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][146] ([Intel XE#1124])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#4208]) -> [SKIP][148] ([Intel XE#1124])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-adlp:         [SKIP][149] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][150] ([Intel XE#4947]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#4208]) -> [SKIP][152] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][153] ([Intel XE#2341]) -> [FAIL][154] ([Intel XE#1188])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_content_protection@uevent.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-adlp:         [SKIP][155] ([Intel XE#309]) -> [SKIP][156] ([Intel XE#4950])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-adlp:         [SKIP][157] ([Intel XE#4331]) -> [SKIP][158] ([Intel XE#4947])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#4208]) -> [SKIP][160] ([Intel XE#4331])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][161] ([Intel XE#651]) -> [SKIP][162] ([Intel XE#4947])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][163] ([Intel XE#2312]) -> [SKIP][164] ([Intel XE#2311]) +24 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][165] ([Intel XE#656]) -> [SKIP][166] ([Intel XE#2351] / [Intel XE#4947])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][168] ([Intel XE#651]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][169] ([Intel XE#2311]) -> [SKIP][170] ([Intel XE#2312]) +13 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][171] ([Intel XE#4141]) -> [SKIP][172] ([Intel XE#2312]) +5 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][173] ([Intel XE#2312]) -> [SKIP][174] ([Intel XE#4141]) +14 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#4208]) -> [SKIP][176] ([Intel XE#651]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][177] ([Intel XE#2313]) -> [SKIP][178] ([Intel XE#2312]) +14 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][179] ([Intel XE#2312]) -> [SKIP][180] ([Intel XE#2313]) +25 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][181] ([Intel XE#656]) -> [SKIP][182] ([Intel XE#4947]) +3 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#4208]) -> [SKIP][184] ([Intel XE#653]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][185] ([Intel XE#4596]) -> [SKIP][186] ([Intel XE#5021])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#4208]) -> [SKIP][188] ([Intel XE#1489]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
    - shard-adlp:         [SKIP][189] ([Intel XE#1489]) -> [SKIP][190] ([Intel XE#4947]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-adlp:         [SKIP][191] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][192] ([Intel XE#2351] / [Intel XE#4947])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_psr@pr-sprite-plane-onoff.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_psr@pr-sprite-plane-onoff.html
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][194] ([Intel XE#2850] / [Intel XE#929])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_psr@pr-sprite-plane-onoff.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-adlp:         [SKIP][195] ([Intel XE#455]) -> [SKIP][196] ([Intel XE#4950])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_vrr@seamless-rr-switch-virtual.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#4208] / [i915#2575]) -> [SKIP][198] ([Intel XE#455])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_vrr@seamless-rr-switch-virtual.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - shard-adlp:         [SKIP][199] ([Intel XE#288]) -> [SKIP][200] ([Intel XE#4945]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#4208]) -> [SKIP][202] ([Intel XE#288]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:
    - shard-adlp:         [SKIP][203] ([Intel XE#4915]) -> [SKIP][204] ([Intel XE#4945]) +20 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#4208]) -> [SKIP][206] ([Intel XE#4915]) +20 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-adlp:         [SKIP][207] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][208] ([Intel XE#4945]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@xe_oa@unprivileged-single-ctx-counters.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@xe_oa@unprivileged-single-ctx-counters.html
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#4208]) -> [SKIP][210] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@xe_oa@unprivileged-single-ctx-counters.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#4208]) -> [SKIP][212] ([Intel XE#944]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@xe_query@multigpu-query-engines.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-adlp:         [SKIP][213] ([Intel XE#944]) -> [SKIP][214] ([Intel XE#4945]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#4208]) -> [SKIP][216] ([Intel XE#4130])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5301
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968 -> xe-pw-147565v4

  IGT_8418: 8418
  xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968: 1b4be188ae14a43b901f3005075fab3a22f77968
  xe-pw-147565v4: 147565v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/index.html

--===============8801637190943617795==
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
<tr><td><b>Series:</b></td><td>Modify drm helpers to use luminance (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147565/">https://patchwork.freedesktop.org/series/147565/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968_FULL -&gt; xe-pw-147565v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147565v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-1/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_flip_event_leak@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_flip_event_leak@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-4/igt@kms_psr@fbc-psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_eudebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-8/igt@xe_exec_reset@cm-close-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-multi-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-multi-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +185 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@bad-flags:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@xe_mmap@bad-flags.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@xe_mmap@bad-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@xe_oa@syncs-syncobj-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@xe_pm@s3-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-2/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-436/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-8/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_render_copy@render-stress-4-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-5/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-5/igt@kms_flip@plain-flip-ts-check.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-4/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@c-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-lnl-6/igt@xe_oa@oa-exponents.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-lnl-1/igt@xe_oa@oa-exponents.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-1/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-adlp-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-adlp-9/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968/shard-dg2-435/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147565v4/shard-dg2-466/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968 -&gt; xe-pw-147565v4</li>
</ul>
<p>IGT_8418: 8418<br />
  xe-3282-1b4be188ae14a43b901f3005075fab3a22f77968: 1b4be188ae14a43b901f3005075fab3a22f77968<br />
  xe-pw-147565v4: 147565v4</p>

</body>
</html>

--===============8801637190943617795==--
