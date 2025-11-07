Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787A7CCFA05
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 11:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1495A10EA9C;
	Fri,  7 Nov 2025 11:35:54 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95D310EA9A;
 Fri,  7 Nov 2025 11:35:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1875747902589923723=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/rps=3A_call_rps_f?=
 =?utf-8?q?unctions_through_the_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Nov 2025 11:35:52 -0000
Message-ID: <176251535294.28862.2181824830016514862@10055242dc62>
X-Patchwork-Hint: ignore
References: <cover.1762440096.git.jani.nikula@intel.com>
In-Reply-To: <cover.1762440096.git.jani.nikula@intel.com>
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

--===============1875747902589923723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/rps: call rps functions through the parent interface
URL   : https://patchwork.freedesktop.org/series/157164/
State : failure

== Summary ==

CI Bug Log - changes from xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad_FULL -> xe-pw-157164v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157164v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157164v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157164v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@panthor/panthor_vm@vm_bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] +8 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-464/igt@panthor/panthor_vm@vm_bind.html

  
Known issues
------------

  Here are the changes found in xe-pw-157164v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [PASS][2] -> [FAIL][3] ([Intel XE#5993]) +3 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][4] -> [DMESG-WARN][5] ([Intel XE#4543]) +7 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#316])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124]) +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#2314] / [Intel XE#2894])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2314] / [Intel XE#2894])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#3432])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#3432])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#787]) +55 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#787]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#373]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2252]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#373])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-1/igt@kms_chamelium_frames@hdmi-frame-dump.html
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#373])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-7/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2341])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#1188]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2320]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1424]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#308]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2291]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][37] -> [FAIL][38] ([Intel XE#5299])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#3009])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-1/igt@kms_dp_aux_dev.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#4422])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4422])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#4422])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#4422])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#2316]) +9 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2293] / [Intel XE#2380])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2293])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#455]) +9 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][50] -> [DMESG-FAIL][51] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#651]) +14 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#656])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#651]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#651]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [PASS][56] -> [DMESG-FAIL][57] ([Intel XE#4543]) +3 other tests dmesg-fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][58] ([Intel XE#4543])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#5390])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2311]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#656]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#6312])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#6312])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2313]) +6 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#653])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#653]) +9 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#4090])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#2925])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#2925])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2925])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2486])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-4/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#4596]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#5021])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#5021])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#4596])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-4/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#4596])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#5020])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-436/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#718])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-adlp:         [PASS][81] -> [DMESG-WARN][82] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-8/igt@kms_pm_lpsp@kms-lpsp.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#1439] / [Intel XE#836])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-2/igt@kms_psr@psr-primary-blt.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-4/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#6503]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-8/igt@kms_sharpness_filter@filter-suspend.html

  * igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#6530]) +10 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-2/igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle.html
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#6530]) +10 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-2/igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle.html

  * igt@panthor/panthor_vm@vm_unbind_invalid_address:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#6530]) +10 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-7/igt@panthor/panthor_vm@vm_unbind_invalid_address.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1091] / [Intel XE#2849])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#6010])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@xe_configfs@survivability-mode.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#5626])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eudebug_online@resume-one:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#4837]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@xe_eudebug_online@resume-one.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][97] -> [INCOMPLETE][98] ([Intel XE#6321])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-small-external:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-4/igt@xe_evict@evict-beng-small-external.html
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#688])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-5/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1392]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2322]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1392] / [Intel XE#5575])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#288] / [Intel XE#5561])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#288]) +12 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-rebind.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#4837]) +4 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-1/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#4837]) +7 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-432/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-4/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html

  * igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#5007]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          [PASS][110] -> [WARN][111] ([Intel XE#5786])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_exec_system_allocator@process-many-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#4943]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#4915]) +150 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-434/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-race:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#4915]) +24 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-race.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#4943]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2229])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#6032])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-433/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#3573]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#979])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [PASS][120] -> [DMESG-WARN][121] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [PASS][122] -> [INCOMPLETE][123] ([Intel XE#4504])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-userptr.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#584])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-2/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm_residency@idle-residency@gt0:
    - shard-dg2-set2:     [PASS][125] -> [FAIL][126] ([Intel XE#6362]) +1 other test fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-dg2-466/igt@xe_pm_residency@idle-residency@gt0.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-464/igt@xe_pm_residency@idle-residency@gt0.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          [PASS][127] -> [FAIL][128] ([Intel XE#6251]) +3 other tests fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-adlp:         [PASS][129] -> [TIMEOUT][130] ([Intel XE#5213] / [Intel XE#6421]) +1 other test timeout
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-8/igt@xe_pmu@fn-engine-activity-load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#4733])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-434/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#944])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-433/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#4130])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-adlp:         [PASS][134] -> [SKIP][135] ([Intel XE#6372])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-1/igt@xe_sriov_flr@flr-each-isolation.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [PASS][136] -> [ABORT][137] ([Intel XE#5466] / [Intel XE#5545]) +1 other test abort
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][138] ([Intel XE#3908]) -> [PASS][139] +1 other test pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [DMESG-FAIL][140] ([Intel XE#4543]) -> [PASS][141] +9 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][142] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][144] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [PASS][145] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [DMESG-WARN][146] ([Intel XE#5354]) -> [PASS][147] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][148] ([Intel XE#2291]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [SKIP][150] ([Intel XE#2316]) -> [PASS][151] +4 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][152] ([Intel XE#301]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][154] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][156] ([Intel XE#4543]) -> [PASS][157] +11 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-9/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-4/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][158] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][159] +3 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][160] ([Intel XE#3012]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-adlp:         [FAIL][162] ([Intel XE#6279]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][164] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][165] +5 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][166] ([Intel XE#718]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [DMESG-WARN][168] ([Intel XE#3868]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:
    - shard-bmg:          [FAIL][170] ([Intel XE#5937]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-2/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html

  
#### Warnings ####

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][172] ([Intel XE#1178]) -> [INCOMPLETE][173] ([Intel XE#4907])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-dg2-436/igt@kms_content_protection@lic-type-0.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][174] ([Intel XE#3304]) -> [INCOMPLETE][175] ([Intel XE#4907])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][176] ([Intel XE#1178]) -> [SKIP][177] ([Intel XE#2341])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-4/igt@kms_content_protection@srm.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [INCOMPLETE][178] -> [SKIP][179] ([Intel XE#2291])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [DMESG-FAIL][180] ([Intel XE#4543]) -> [DMESG-WARN][181] ([Intel XE#2953] / [Intel XE#4173])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][182] ([Intel XE#2311]) -> [SKIP][183] ([Intel XE#2312]) +10 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-rte:
    - shard-bmg:          [SKIP][184] ([Intel XE#2312]) -> [SKIP][185] ([Intel XE#2311]) +9 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-rte.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][186] ([Intel XE#5390]) -> [SKIP][187] ([Intel XE#2312]) +7 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][188] ([Intel XE#2312]) -> [SKIP][189] ([Intel XE#5390]) +7 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][190] ([Intel XE#2313]) -> [SKIP][191] ([Intel XE#2312]) +7 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][192] ([Intel XE#2312]) -> [SKIP][193] ([Intel XE#2313]) +12 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][194] ([Intel XE#2426]) -> [FAIL][195] ([Intel XE#1729])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-adlp:         [SKIP][196] ([Intel XE#1392] / [Intel XE#5575]) -> [DMESG-FAIL][197] ([Intel XE#5213]) +1 other test dmesg-fail
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4907
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
  [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6279
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6362
  [Intel XE#6372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6372
  [Intel XE#6421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6421
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#6530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6530
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8612 -> IGT_8613
  * Linux: xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad -> xe-pw-157164v1

  IGT_8612: 8612
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad: 6aa8d62a50c33f091548cc961a713223d488d6ad
  xe-pw-157164v1: 157164v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/index.html

--===============1875747902589923723==
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
<tr><td><b>Series:</b></td><td>drm/i915/rps: call rps functions through the parent interface</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157164/">https://patchwork.freedesktop.org/series/157164/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad_FULL -&gt; xe-pw-157164v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157164v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-157164v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-157164v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@panthor/panthor_vm@vm_bind:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-464/igt@panthor/panthor_vm@vm_bind.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157164v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-1/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-7/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-5/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-1/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-436/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-8/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@kms_pm_lpsp@kms-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-2/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-4/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-8/igt@kms_sharpness_filter@filter-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-2/igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6530">Intel XE#6530</a>) +10 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-2/igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6530">Intel XE#6530</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_vm@vm_unbind_invalid_address:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-7/igt@panthor/panthor_vm@vm_unbind_invalid_address.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6530">Intel XE#6530</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@xe_configfs@survivability-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010">Intel XE#6010</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@xe_eu_stall@blocking-re-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@xe_eudebug_online@resume-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-4/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-5/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-1/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-432/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-4/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-434/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +150 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-433/igt@xe_oa@mmio-triggered-reports-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032">Intel XE#6032</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-2/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency@gt0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-dg2-466/igt@xe_pm_residency@idle-residency@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-464/igt@xe_pm_residency@idle-residency@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6362">Intel XE#6362</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-8/igt@xe_pmu@fn-engine-activity-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@xe_pmu@fn-engine-activity-load.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6421">Intel XE#6421</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-434/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-433/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-1/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6372">Intel XE#6372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-9/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-4/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6279">Intel XE#6279</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@xe_exec_reset@cm-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-2/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-dg2-436/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@kms_content_protection@lic-type-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4907">Intel XE#4907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4907">Intel XE#4907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-4/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157164v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8612 -&gt; IGT_8613</li>
<li>Linux: xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad -&gt; xe-pw-157164v1</li>
</ul>
<p>IGT_8612: 8612<br />
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad: 6aa8d62a50c33f091548cc961a713223d488d6ad<br />
  xe-pw-157164v1: 157164v1</p>

</body>
</html>

--===============1875747902589923723==--
