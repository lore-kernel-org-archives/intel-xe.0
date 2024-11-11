Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A20D12D51
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 15:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DED710E166;
	Mon, 11 Nov 2024 15:17:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EBA10E166;
 Mon, 11 Nov 2024 15:17:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5652999182828917036=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5B1/3=5D_?=
 =?utf-8?q?drm/i915/watermark=3A_Initialize_latency_variable_to_appropriate_?=
 =?utf-8?q?value?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Nov 2024 15:17:34 -0000
Message-ID: <173133825461.2631721.11517634203864509543@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241111123259.1072534-1-suraj.kandpal@intel.com>
In-Reply-To: <20241111123259.1072534-1-suraj.kandpal@intel.com>
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

--===============5652999182828917036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/i915/watermark: Initialize latency variable to appropriate value
URL   : https://patchwork.freedesktop.org/series/141161/
State : failure

== Summary ==

CI Bug Log - changes from xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501_full -> xe-pw-141161v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141161v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141161v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141161v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-2/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-433/igt@kms_flip@plain-flip-ts-check@c-hdmi-a6.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-433/igt@kms_flip@plain-flip-ts-check@c-hdmi-a6.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][5] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  
Known issues
------------

  Here are the changes found in xe-pw-141161v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [PASS][7] -> [SKIP][8] ([Intel XE#1885])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@core_hotunplug@hotreplug.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@pan:
    - shard-dg2-set2:     [PASS][9] -> [SKIP][10] ([Intel XE#2134])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@fbdev@pan.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@fbdev@pan.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][11] ([Intel XE#3225])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-adlp:         [PASS][12] -> [DMESG-WARN][13] ([Intel XE#3086])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-1/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-8/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#2351] / [Intel XE#2890]) +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#787]) +59 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][21] -> [SKIP][22] ([Intel XE#2890]) +9 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][24] -> [INCOMPLETE][25] ([Intel XE#1195] / [Intel XE#1727])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-5:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#1195]) +1 other test incomplete
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-5.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][27] -> [DMESG-WARN][28] ([Intel XE#3113])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#306])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2252]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#373])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#1178]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#3407])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-5.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2320])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#308])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][36] ([Intel XE#1195] / [Intel XE#3226])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#1695])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#776])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][39] -> [FAIL][40] ([Intel XE#301]) +2 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#2423] / [i915#2575]) +16 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][42] -> [DMESG-WARN][43] ([Intel XE#2953] / [Intel XE#3086]) +1 other test dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-adlp:         [PASS][44] -> [FAIL][45] ([Intel XE#3098])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         [PASS][46] -> [FAIL][47] ([Intel XE#886]) +2 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-6/igt@kms_flip@plain-flip-ts-check.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-6/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#2351] / [Intel XE#2890]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#455]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2311]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [FAIL][51] ([Intel XE#2333]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#2890]) +13 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#651])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2313]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#656])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#653]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2340])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [PASS][58] -> [SKIP][59] ([Intel XE#2423] / [i915#2575]) +27 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][60] -> [FAIL][61] ([Intel XE#361])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2763]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2763]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2446]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1489]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#362])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#2168])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2905])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_exec_basic@many-null-defer-mmap:
    - shard-adlp:         [PASS][71] -> [TIMEOUT][72] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#2981])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@xe_exec_basic@many-null-defer-mmap.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@xe_exec_basic@many-null-defer-mmap.html

  * igt@xe_exec_basic@once-rebind:
    - shard-dg2-set2:     [PASS][73] -> [SKIP][74] ([Intel XE#1130]) +54 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@xe_exec_basic@once-rebind.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_exec_basic@once-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#288])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-bmg:          [PASS][76] -> [FAIL][77] ([Intel XE#1630]) +3 other tests fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [FAIL][78] ([Intel XE#1630])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-basic-imm:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#288])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-basic-imm.html

  * igt@xe_exec_threads@threads-shared-vm-rebind-bindexecqueue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1130]) +24 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_exec_threads@threads-shared-vm-rebind-bindexecqueue.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#2229]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_mmap@bad-flags:
    - shard-adlp:         [PASS][82] -> [TIMEOUT][83] ([Intel XE#1033] / [Intel XE#1727]) +2 other tests timeout
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@xe_mmap@bad-flags.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@xe_mmap@bad-flags.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][84] -> [ABORT][85] ([Intel XE#1358] / [Intel XE#1607]) +1 other test abort
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-1/igt@xe_pm@s4-basic.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][86] -> [ABORT][87] ([Intel XE#1607] / [Intel XE#1794])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [SKIP][88] ([Intel XE#1885]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-adlp:         [DMESG-WARN][90] ([Intel XE#3086]) -> [PASS][91] +1 other test pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-3/igt@core_hotunplug@unplug-rescan.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-2/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - shard-dg2-set2:     [SKIP][92] ([Intel XE#2423] / [i915#2575]) -> [PASS][93] +45 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][94] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][95] +2 other tests pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][96] ([Intel XE#1426]) -> [PASS][97] +1 other test pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][98] ([Intel XE#2890]) -> [PASS][99] +11 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][100] ([Intel XE#877]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][102] ([Intel XE#1195] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][104] ([Intel XE#877]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-adlp:         [FAIL][106] ([Intel XE#1475]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][108] ([Intel XE#301]) -> [PASS][109] +2 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@busy-flip@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][110] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@kms_flip@busy-flip@a-hdmi-a1.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@kms_flip@busy-flip@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:
    - shard-bmg:          [FAIL][112] ([Intel XE#3321]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][114] ([Intel XE#301]) -> [PASS][115] +7 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][117] +4 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][118] ([Intel XE#361]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#2446]) -> [PASS][121] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [TIMEOUT][122] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-5/igt@xe_evict@evict-threads-large.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-4/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_compute_mode@many-execqueues-basic:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1130]) -> [PASS][125] +76 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-basic.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@xe_exec_compute_mode@many-execqueues-basic.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [FAIL][126] ([Intel XE#1630]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][128] ([Intel XE#1794]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#316]) -> [SKIP][131] ([Intel XE#2351] / [Intel XE#2890])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-WARN][132] ([Intel XE#3194]) -> [FAIL][133] ([Intel XE#1231] / [Intel XE#1242])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][134] ([Intel XE#3194]) -> [FAIL][135] ([Intel XE#1231] / [Intel XE#1242])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#2890]) -> [SKIP][137] ([Intel XE#1124]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][139] ([Intel XE#1124]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [TIMEOUT][140] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][141] ([Intel XE#1231] / [Intel XE#1242] / [Intel XE#3052])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1124]) -> [SKIP][143] ([Intel XE#2890]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1124]) -> [SKIP][145] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#367]) -> [SKIP][147] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#2423] / [i915#2575]) -> [SKIP][149] ([Intel XE#367]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#2890]) -> [SKIP][151] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][153] ([Intel XE#455] / [Intel XE#787])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#2890]) -> [SKIP][155] ([Intel XE#2907])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][157] ([Intel XE#2351] / [Intel XE#2890])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#2423] / [i915#2575]) -> [SKIP][159] ([Intel XE#306]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#306]) -> [SKIP][161] ([Intel XE#2423] / [i915#2575])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#2423] / [i915#2575]) -> [SKIP][163] ([Intel XE#373]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#373]) -> [SKIP][165] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#307]) -> [SKIP][167] ([Intel XE#2423] / [i915#2575])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#2423] / [i915#2575]) -> [SKIP][169] ([Intel XE#307])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#2423] / [i915#2575]) -> [SKIP][171] ([Intel XE#308]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#308]) -> [SKIP][173] ([Intel XE#2423] / [i915#2575])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#701]) -> [SKIP][175] ([Intel XE#2423] / [i915#2575])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_feature_discovery@chamelium.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#2423] / [i915#2575]) -> [SKIP][177] ([Intel XE#703])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#2423] / [i915#2575]) -> [SKIP][179] ([Intel XE#1138])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][180] ([Intel XE#301]) -> [SKIP][181] ([Intel XE#2423] / [i915#2575])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][182] ([Intel XE#656]) -> [TIMEOUT][183] ([Intel XE#1033] / [Intel XE#1727])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#651]) -> [SKIP][185] ([Intel XE#2890]) +7 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#2890]) -> [SKIP][187] ([Intel XE#651]) +9 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [FAIL][188] ([Intel XE#1861]) -> [TIMEOUT][189] ([Intel XE#1033] / [Intel XE#1727])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][191] ([Intel XE#651]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#651]) -> [SKIP][193] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#653]) -> [SKIP][195] ([Intel XE#2890]) +7 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#653]) -> [SKIP][197] ([Intel XE#2351] / [Intel XE#2890]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#2890]) -> [SKIP][199] ([Intel XE#455]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#2890]) -> [SKIP][201] ([Intel XE#653]) +11 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][203] ([Intel XE#653]) +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#2423] / [i915#2575]) -> [SKIP][205] ([Intel XE#455])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_hdr@invalid-hdr.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#2925]) -> [SKIP][207] ([Intel XE#2890])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#2890]) -> [SKIP][209] ([Intel XE#346])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#455]) -> [SKIP][211] ([Intel XE#2423] / [i915#2575])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][213] ([Intel XE#2423] / [i915#2575])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#870]) -> [SKIP][215] ([Intel XE#2890])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_pm_backlight@basic-brightness.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#2890]) -> [SKIP][217] ([Intel XE#2938])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1122]) -> [SKIP][219] ([Intel XE#2351] / [Intel XE#2890])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][221] ([Intel XE#908])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#2890]) -> [SKIP][223] ([Intel XE#1489]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1489]) -> [SKIP][225] ([Intel XE#2890]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][227] ([Intel XE#2850] / [Intel XE#929])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-render.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#2890]) -> [SKIP][229] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_psr@fbc-psr2-no-drrs.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][231] ([Intel XE#2890]) +4 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][233] ([Intel XE#2351])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][234] ([Intel XE#1729]) -> [SKIP][235] ([Intel XE#2426])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [FAIL][236] ([Intel XE#1729]) -> [SKIP][237] ([Intel XE#362])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#2423] / [i915#2575]) -> [SKIP][239] ([Intel XE#2168])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_vrr@lobf.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_vrr@lobf.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1123]) -> [SKIP][241] ([Intel XE#1130])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1130]) -> [SKIP][243] ([Intel XE#1126])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1130]) -> [SKIP][245] ([Intel XE#2905]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@xe_eudebug@multigpu-basic-client-many.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#2905]) -> [SKIP][247] ([Intel XE#1130]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@xe_eudebug_online@reset-with-attention.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1130]) -> [FAIL][249] ([Intel XE#1600])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#288]) -> [SKIP][251] ([Intel XE#1130]) +9 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1130]) -> [SKIP][253] ([Intel XE#288]) +11 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_fault_injection@inject-fault-probe:
    - shard-dg2-set2:     [DMESG-WARN][254] ([Intel XE#3343]) -> [SKIP][255] ([Intel XE#1130])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1130]) -> [SKIP][257] ([Intel XE#2541]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@xe_oa@missing-sample-flags.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#2541]) -> [SKIP][259] ([Intel XE#1130]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cfg.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#1130]) -> [SKIP][261] ([Intel XE#2284] / [Intel XE#366])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#944]) -> [SKIP][263] ([Intel XE#1130])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@xe_query@multigpu-query-hwconfig.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [ABORT][264] -> [SKIP][265] ([Intel XE#1130])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2981]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2981
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3407
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501 -> xe-pw-141161v1

  IGT_8102: a05b40911bfb79c9bdf6ff7e8ab1a68948afbbf6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501: 040d63e62c0fa6b0535db1b1ed98d504d9014501
  xe-pw-141161v1: 141161v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/index.html

--===============5652999182828917036==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/i915/watermark: Initialize latency variable to appropriate value</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141161/">https://patchwork.freedesktop.org/series/141161/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501_full -&gt; xe-pw-141161v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141161v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141161v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141161v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-2/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-433/igt@kms_flip@plain-flip-ts-check@c-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-433/igt@kms_flip@plain-flip-ts-check@c-hdmi-a6.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141161v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-1/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-8/igt@kms_big_fb@linear-8bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-5.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3407">Intel XE#3407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-6/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-6/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@xe_eudebug@discovery-race-vmbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@xe_exec_basic@many-null-defer-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@xe_exec_basic@many-null-defer-mmap.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2981">Intel XE#2981</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@xe_exec_basic@once-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_exec_basic@once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-rebind-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_exec_threads@threads-shared-vm-rebind-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@bad-flags:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@xe_mmap@bad-flags.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@xe_mmap@bad-flags.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-1/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-3/igt@core_hotunplug@unplug-rescan.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-2/igt@core_hotunplug@unplug-rescan.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> +45 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-0.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@kms_flip@busy-flip@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@kms_flip@busy-flip@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-5/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-4/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@xe_exec_compute_mode@many-execqueues-basic.html">PASS</a> +76 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@xe_eudebug_online@reset-with-attention.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_eudebug_online@reset-with-attention.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-435/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-463/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141161v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501 -&gt; xe-pw-141161v1</li>
</ul>
<p>IGT_8102: a05b40911bfb79c9bdf6ff7e8ab1a68948afbbf6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2204-040d63e62c0fa6b0535db1b1ed98d504d9014501: 040d63e62c0fa6b0535db1b1ed98d504d9014501<br />
  xe-pw-141161v1: 141161v1</p>

</body>
</html>

--===============5652999182828917036==--
