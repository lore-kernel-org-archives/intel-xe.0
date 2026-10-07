Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A4BCA6002
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 18:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBA210E641;
	Wed,  7 Oct 2026 18:08:53 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306A210E02B;
 Wed,  7 Oct 2026 18:08:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2677250727393643653=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/cx0=3A_request_TC?=
 =?utf-8?q?SS_power_for_the_non-TC_C20_PHY_on_PTL_port_B?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Burak_G=C3=B6nc=C3=BC_via_B4_Relay?=
 <devnull+burakgon12.gmail.com@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Oct 2026 18:08:52 -0000
Message-ID: <179139653216.249613.5170944127799505399@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261006-ptl-port-b-tcss-v1-1-240670342cd3@gmail.com>
In-Reply-To: <20261006-ptl-port-b-tcss-v1-1-240670342cd3@gmail.com>
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

--===============2677250727393643653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cx0: request TCSS power for the non-TC C20 PHY on PTL port B
URL   : https://patchwork.freedesktop.org/series/175691/
State : failure

== Summary ==

CI Bug Log - changes from xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05_FULL -> xe-pw-175691v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-175691v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-175691v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-175691v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-dpms:
    - shard-lnl:          [PASS][1] -> [SKIP][2] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-lnl-1/igt@kms_async_flips@async-flip-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-3/igt@kms_async_flips@async-flip-dpms.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-ptl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  
Known issues
------------

  Here are the changes found in xe-pw-175691v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:
    - shard-ptl:          [PASS][4] -> [ABORT][5] ([Intel XE#9362]) +3 other tests abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2:
    - shard-bmg:          [PASS][6] -> [ABORT][7] ([Intel XE#9405] / [Intel XE#9422])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#5901]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#5808]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#367])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          [PASS][16] -> [DMESG-WARN][17] ([Intel XE#9365]) +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][18] -> [INCOMPLETE][19] ([Intel XE#7084] / [Intel XE#8150])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2652]) +7 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
    - shard-ptl:          [PASS][21] -> [ABORT][22] ([Intel XE#7084] / [Intel XE#9378]) +1 other test abort
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2887])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#5824])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2325] / [Intel XE#7358])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#8391])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2252]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#2252])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#7642])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][30] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-9/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#5900])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2321] / [Intel XE#7355])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-ptl:          [PASS][33] -> [ABORT][34] ([Intel XE#9375]) +1 other test abort
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-3/igt@kms_cursor_crc@cursor-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#309] / [Intel XE#7343])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#5907])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][37] -> [ABORT][38] ([Intel XE#9362]) +1 other test abort
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#7178])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2311]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#656] / [Intel XE#7905]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7061] / [Intel XE#7356])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#6312]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#5812]) +7 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4141])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#5800] / [Intel XE#6312])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#7399])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7865]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#7061])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#7865])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2352] / [Intel XE#7399])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#7905]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2313]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7061] / [Intel XE#7356])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][56] ([Intel XE#6900])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#7283])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#7283])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#7283])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1489])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1128] / [Intel XE#7413])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#1406])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@kms_psr@psr-suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-ptl:          NOTRUN -> [SKIP][64] ([Intel XE#5821])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-ptl:          [PASS][65] -> [FAIL][66] ([Intel XE#4227] / [Intel XE#7397])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-1/igt@kms_vrr@flip-basic-fastset.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [PASS][67] -> [FAIL][68] ([Intel XE#6293] / [Intel XE#7397])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#8397])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_vrr@lobf-dc3co.html

  * igt@xe_configfs@ctx-restore-mid-bb-invalid:
    - shard-bmg:          [PASS][70] -> [ABORT][71] ([Intel XE#9463])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-1/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-7/igt@xe_configfs@ctx-restore-mid-bb-invalid.html

  * igt@xe_evict@evict-large-cm:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#5764])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#6540] / [Intel XE#688])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#7482]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race.html

  * igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#7482])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#8364])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#8364])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@xe_exec_multi_queue@max-queues-preempt-mode-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#8364]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_threads@threads-multi-queue-basic:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#8378])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#8378]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#7954])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_madvise@atomic-global:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#7980])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_madvise@atomic-global.html

  * igt@xe_mmap@small-bar:
    - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#5867])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@xe_mmap@small-bar.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#6964])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_oa@buffer-size:
    - shard-bmg:          [PASS][85] -> [FAIL][86] ([Intel XE#7334])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-6/igt@xe_oa@buffer-size.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-3/igt@xe_oa@buffer-size.html

  * igt@xe_oa@buffer-size@oag-0-128m:
    - shard-bmg:          NOTRUN -> [FAIL][87] ([Intel XE#7334])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-3/igt@xe_oa@buffer-size@oag-0-128m.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2284] / [Intel XE#7370])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#6867])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][91] -> [ABORT][92] ([Intel XE#9362])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-config:
    - shard-ptl:          NOTRUN -> [SKIP][93] ([Intel XE#6019]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#944])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#4130] / [Intel XE#7366])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_survivability@runtime-survivability:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#8415])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_survivability@runtime-survivability.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:
    - shard-bmg:          [DMESG-WARN][97] ([Intel XE#9365]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][99] ([Intel XE#7809]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-ptl:          [ABORT][101] ([Intel XE#9362]) -> [PASS][102] +3 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-2/igt@kms_hdr@bpc-switch-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_vrr@cmrr-video-mode:
    - shard-ptl:          [FAIL][103] -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-5/igt@kms_vrr@cmrr-video-mode.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-3/igt@kms_vrr@cmrr-video-mode.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [ABORT][105] ([Intel XE#9093]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-9/igt@xe_ccs@suspend-resume.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
    - shard-bmg:          [ABORT][107] ([Intel XE#9481]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-7/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-lnl:          [ABORT][109] -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [FAIL][111] ([Intel XE#8578]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-3/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [DMESG-WARN][113] ([Intel XE#7727]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-lnl-7/igt@xe_pm@s4-basic-exec.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-bmg:          [DMESG-WARN][115] ([Intel XE#9365] / [Intel XE#9428]) -> [ABORT][116] ([Intel XE#9405] / [Intel XE#9422])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [DMESG-WARN][117] ([Intel XE#9365] / [Intel XE#9482]) -> [INCOMPLETE][118] ([Intel XE#7084] / [Intel XE#8150])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][119] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][120] ([Intel XE#2426] / [Intel XE#5848])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-ptl:          [FAIL][121] ([Intel XE#7695]) -> [ABORT][122] ([Intel XE#9362])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-2/igt@xe_pat@pat-sw-hw-suspend.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-7/igt@xe_pat@pat-sw-hw-suspend.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
  [Intel XE#9378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378
  [Intel XE#9405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9405
  [Intel XE#9422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9422
  [Intel XE#9428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9428
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9481]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9481
  [Intel XE#9482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9482


Build changes
-------------

  * Linux: xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05 -> xe-pw-175691v1

  IGT_9132: 9132
  xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05: 5dc178a4563d8d2ee7fc3a81d005700cbfa04c05
  xe-pw-175691v1: 175691v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/index.html

--===============2677250727393643653==
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
<tr><td><b>Series:</b></td><td>drm/i915/cx0: request TCSS power for the non-TC C20 PHY on PTL port B</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175691/">https://patchwork.freedesktop.org/series/175691/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05_FULL -&gt; xe-pw-175691v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-175691v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-175691v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-175691v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-lnl-1/igt@kms_async_flips@async-flip-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-3/igt@kms_async_flips@async-flip-dpms.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175691v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9405">Intel XE#9405</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9422">Intel XE#9422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378">Intel XE#9378</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-9/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-3/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-2/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-1/igt@kms_vrr@flip-basic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-8/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-mid-bb-invalid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-1/igt@xe_configfs@ctx-restore-mid-bb-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-7/igt@xe_configfs@ctx-restore-mid-bb-invalid.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@xe_evict@evict-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@xe_exec_multi_queue@max-queues-preempt-mode-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-global:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_madvise@atomic-global.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-5/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867">Intel XE#5867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-6/igt@xe_oa@buffer-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-3/igt@xe_oa@buffer-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334">Intel XE#7334</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@oag-0-128m:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-3/igt@xe_oa@buffer-size@oag-0-128m.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334">Intel XE#7334</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867">Intel XE#6867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_sriov_auto_provisioning@selfconfig-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-2/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-5/igt@kms_vrr@cmrr-video-mode.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-3/igt@kms_vrr@cmrr-video-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-9/igt@xe_ccs@suspend-resume.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093">Intel XE#9093</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-1/igt@xe_ccs@suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-7/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9481">Intel XE#9481</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-10/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-5/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-3/igt@xe_exec_fault_mode@atomic-many.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-lnl-7/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9428">Intel XE#9428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9405">Intel XE#9405</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9422">Intel XE#9422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9482">Intel XE#9482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05/shard-ptl-2/igt@xe_pat@pat-sw-hw-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/shard-ptl-7/igt@xe_pat@pat-sw-hw-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05 -&gt; xe-pw-175691v1</li>
</ul>
<p>IGT_9132: 9132<br />
  xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05: 5dc178a4563d8d2ee7fc3a81d005700cbfa04c05<br />
  xe-pw-175691v1: 175691v1</p>

</body>
</html>

--===============2677250727393643653==--
