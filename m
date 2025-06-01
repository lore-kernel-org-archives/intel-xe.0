Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD48C54FB3
	for <intel-xe@archiver.kernel.org>; Sun,  1 Jun 2025 11:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E714610E395;
	Sun,  1 Jun 2025 11:51:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C4E10E38E;
 Sun,  1 Jun 2025 11:51:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3354723538957871840=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe=3A_Small_fixes_and_?=
 =?utf-8?q?cleanups_for_PXP_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 01 Jun 2025 11:51:00 -0000
Message-ID: <174877866051.37522.12054187006747531044@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250522225401.3953243-5-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250522225401.3953243-5-daniele.ceraolospurio@intel.com>
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

--===============3354723538957871840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Small fixes and cleanups for PXP (rev4)
URL   : https://patchwork.freedesktop.org/series/149211/
State : success

== Summary ==

CI Bug Log - changes from xe-3167-52afe38ad6f8eccc238956b78e04977dded23411_FULL -> xe-pw-149211v4_FULL
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

  Here are the changes found in xe-pw-149211v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] ([Intel XE#873])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1407]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][3] ([Intel XE#1124]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#316]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#4543]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#619])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#607])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124]) +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2314] / [Intel XE#2894])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#367]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#367]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#787]) +69 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#787]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2907]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     [PASS][22] -> [INCOMPLETE][23] ([Intel XE#3862]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][24] -> [INCOMPLETE][25] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +1 other test incomplete
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#4417]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#306])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#306])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#306]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#373]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#373]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#455])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#307])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#308]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1424]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-size-hints:
    - shard-adlp:         [PASS][36] -> [DMESG-WARN][37] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-adlp-2/igt@kms_cursor_crc@cursor-size-hints.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-8/igt@kms_cursor_crc@cursor-size-hints.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#323])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1137])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2316]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][42] -> [FAIL][43] ([Intel XE#301]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1421]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#310]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [PASS][46] -> [FAIL][47] ([Intel XE#301] / [Intel XE#3321])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1401] / [Intel XE#1745])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1401])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#455]) +10 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#651]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#651]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#651]) +20 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#656]) +10 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#656]) +7 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#653]) +22 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#653])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#3012])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#2925])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#346])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#5020])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-bmg:          [PASS][63] -> [DMESG-WARN][64] ([Intel XE#3428]) +1 other test dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#2763]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#2763]) +7 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          NOTRUN -> [FAIL][68] ([Intel XE#2029])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#2893] / [Intel XE#4608])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#4608]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1489]) +5 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1122])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@pr-cursor-blt:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1406])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-3/igt@kms_psr@pr-cursor-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#3414])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [FAIL][77] ([Intel XE#4689])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1499])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_configfs@survivability-mode:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#5084])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_configfs@survivability-mode.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#944])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#4497])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#4837]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#4837]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#4837]) +9 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1392]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1392]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1392]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#288]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#288]) +16 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2360]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro-dontunmap-eocheck:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#4915]) +38 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#4943])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#4915]) +184 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2229])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#512])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_mmap@small-bar.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#2541] / [Intel XE#3573])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2838] / [Intel XE#979])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#2284] / [Intel XE#366])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2284] / [Intel XE#366])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][101] -> [ABORT][102] ([Intel XE#1794]) +1 other test abort
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#584])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#944])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#944]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#4130])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][107] ([Intel XE#2291]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][109] ([Intel XE#301]) -> [PASS][110] +2 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [SKIP][111] ([Intel XE#2316]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][113] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][115] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][116] +6 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][117] ([Intel XE#4543]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-adlp:         [ABORT][119] ([Intel XE#2953] / [Intel XE#4925]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-adlp-1/igt@kms_force_connector_basic@force-edid.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [FAIL][121] ([Intel XE#4741]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-434/igt@kms_pm_rpm@basic-pci-d3-state.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [DMESG-WARN][123] -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-adlp-1/igt@xe_module_load@many-reload.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][125] ([Intel XE#1794]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][127] ([Intel XE#1178]) -> [SKIP][128] ([Intel XE#2341])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-3/igt@kms_content_protection@atomic.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-1/igt@kms_content_protection@atomic.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][129] ([Intel XE#2311]) -> [SKIP][130] ([Intel XE#2312]) +10 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][131] ([Intel XE#2312]) -> [SKIP][132] ([Intel XE#4141])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][133] ([Intel XE#4141]) -> [SKIP][134] ([Intel XE#2312]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][135] ([Intel XE#2312]) -> [SKIP][136] ([Intel XE#2311]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][137] ([Intel XE#2313]) -> [SKIP][138] ([Intel XE#2312]) +10 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][139] ([Intel XE#2312]) -> [SKIP][140] ([Intel XE#2313]) +4 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][141] ([Intel XE#734]) -> [FAIL][142] ([Intel XE#3325])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@xe_module_load@load:
    - shard-bmg:          [SKIP][143] ([Intel XE#2457]) -> ([DMESG-WARN][144], [DMESG-WARN][145], [DMESG-WARN][146], [DMESG-WARN][147], [DMESG-WARN][148], [DMESG-WARN][149], [DMESG-WARN][150], [DMESG-WARN][151], [DMESG-WARN][152], [SKIP][153]) ([Intel XE#2457] / [Intel XE#3428])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-3/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@load.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][154] ([Intel XE#4835]) -> [FAIL][155] ([Intel XE#4819]) +1 other test fail
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-432/igt@xe_pmu@gt-frequency.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@xe_pmu@gt-frequency.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4835
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4925
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5084
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3167-52afe38ad6f8eccc238956b78e04977dded23411 -> xe-pw-149211v4

  IGT_8387: 8387
  xe-3167-52afe38ad6f8eccc238956b78e04977dded23411: 52afe38ad6f8eccc238956b78e04977dded23411
  xe-pw-149211v4: 149211v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/index.html

--===============3354723538957871840==
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
<tr><td><b>Series:</b></td><td>drm/xe: Small fixes and cleanups for PXP (re=
v4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149211/">https://patchwork.freedesktop.org/series/149211/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149211v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149211v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3167-52afe38ad6f8eccc238956b78e04977dd=
ed23411_FULL -&gt; xe-pw-149211v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149211v4_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_async_flips@invalid-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/sha=
rd-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-1/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_bw@linear-tiling-1-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_bw@linear-tiling-2-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-3/igt@kms_bw@linear-tiling-2-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-=
tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-=
tiled-dg2-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_ccs@crc-primary-basic-y-t=
iled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-432/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg=
2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4522">Intel XE#4522</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_chamelium_color@ctm-max.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_chamelium_color@ctm-neg=
ative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-3/igt@kms_chamelium_color@ctm-red-t=
o-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@kms_chamelium_frames@hdmi-c=
rc-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_content_protection@atomi=
c-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_content_protection@dp-mst=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_cursor_crc@cursor-onscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-adlp-2/igt@kms_cur=
sor_crc@cursor-size-hints.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-8/igt@kms_cursor_crc@cur=
sor-size-hints.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other te=
sts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-1/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/sha=
rd-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_flip@2x-flip-vs-suspend-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank@c-dp4.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-433/igt@kms_flip@fl=
ip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel X=
E#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_frontbuffer_tracking@dr=
rs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-3/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-1/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_joiner@basic-force-ultr=
a-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_joiner@invalid-modeset-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_plane_multiple@tiling-yf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-2/igt@kms_plan=
e_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shar=
d-bmg-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-=
d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3428">Intel XE#3428</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029"=
>Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb=
8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_psr@fbc-psr2-no-drrs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-3/igt@kms_psr@pr-cursor-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_rotation_crc@primary-ro=
tation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_rotation_crc@primary-x-ti=
led-reflect-x-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4689">Intel XE#4689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_configfs@survivability-mo=
de.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5084">Intel XE#5084</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_create@multigpu-create-ma=
ssive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@xe_eu_stall@blocking-read.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_eudebug@basic-vm-bind-dis=
covery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_eudebug@multigpu-basic-cli=
ent-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@xe_eudebug@vm-bind-clear-fa=
ultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exe=
c-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@xe_exec_basic@multigpu-once=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_exec_fault_mode@many-bind=
execqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@xe_exec_fault_mode@twice-in=
valid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro-dontunmap-=
eocheck:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_exec_system_allocator@pro=
cess-many-large-mmap-remap-ro-dontunmap-eocheck.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>=
) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_exec_system_allocator@proc=
ess-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-=
nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@xe_exec_system_allocator@th=
reads-many-large-execqueues-malloc-mlock-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +184 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe=
_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">In=
tel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_oa@non-privileged-map-oa-=
buffer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-436/igt@xe_oa@polling-small-buf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_pm@d3cold-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-lnl-1/igt@xe_pm@s4=
-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149211v4/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_pm_residency@cpg-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_query@multigpu-query-inval=
id-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@xe_query@multigpu-query-top=
ology.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_sriov_auto_provisioning@se=
lfconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149211v4/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard=
-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-1/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-=
3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/sha=
rd-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Int=
el XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149211v4/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hd=
mi-a1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149211v4/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a=
-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-adlp-1/igt@kms_for=
ce_connector_basic@force-edid.html">ABORT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4925">Intel XE#4925</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/sh=
ard-adlp-6/igt@kms_force_connector_basic@force-edid.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-434/igt@kms_pm=
_rpm@basic-pci-d3-state.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4741">Intel XE#4741</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-434/igt@kms_p=
m_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-adlp-1/igt@xe_modu=
le_load@many-reload.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-6/igt@xe_module_load@man=
y-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-lnl-8/igt@xe_pm@s4-v=
m-bind-unbind-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-3/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-1/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149211v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/sha=
rd-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">=
Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149211v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149211v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49211v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149211v4/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-adlp-2/igt@kms_pm_=
dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/734">Intel XE#734</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149211v4/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3325">Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-bmg-3/igt@xe_modul=
e_load@load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@loa=
d.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-b=
mg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@=
load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shar=
d-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/s=
hard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-bmg-6/igt@xe_module=
_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3167-52afe38ad6f8eccc238956b78e04977dded23411/shard-dg2-432/igt@xe_pmu=
@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4835">Intel XE#4835</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149211v4/shard-dg2-432/igt@xe_pmu@gt-frequ=
ency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4819">Intel XE#4819</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3167-52afe38ad6f8eccc238956b78e04977dded23411 -&gt; xe-pw-149=
211v4</li>
</ul>
<p>IGT_8387: 8387<br />
  xe-3167-52afe38ad6f8eccc238956b78e04977dded23411: 52afe38ad6f8eccc238956b=
78e04977dded23411<br />
  xe-pw-149211v4: 149211v4</p>

</body>
</html>

--===============3354723538957871840==--
