Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1265CD484E
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 22:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF2A10E8DB;
	Mon, 11 May 2026 22:33:36 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E669B10E16B;
 Mon, 11 May 2026 22:33:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3297031874402698051=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/gt=5Fidle=3A_Use_NS?=
 =?utf-8?q?EC=5FPER=5FMSEC_instead_of_float_literal?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 May 2026 22:33:34 -0000
Message-ID: <177853881493.58917.13106627078841961411@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511153307.223435-1-shuicheng.lin@intel.com>
In-Reply-To: <20260511153307.223435-1-shuicheng.lin@intel.com>
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

--===============3297031874402698051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/gt_idle: Use NSEC_PER_MSEC instead of float literal
URL   : https://patchwork.freedesktop.org/series/166334/
State : failure

== Summary ==

CI Bug Log - changes from xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565_FULL -> xe-pw-166334v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166334v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166334v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166334v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-transition:
    - shard-bmg:          [PASS][1] -> [DMESG-FAIL][2] +2 other tests dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-8/igt@kms_atomic_transition@plane-all-transition.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition.html

  * igt@xe_copy_basic@mem-page-copy-17:
    - shard-lnl:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-lnl-1/igt@xe_copy_basic@mem-page-copy-17.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-5/igt@xe_copy_basic@mem-page-copy-17.html

  * igt@xe_exec_system_allocator@process-many-large-free-race-nomemset:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-free-race-nomemset.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-free-race-nomemset.html

  * igt@xe_madvise@atomic-global:
    - shard-lnl:          NOTRUN -> [SKIP][7] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@xe_madvise@atomic-global.html
    - shard-bmg:          NOTRUN -> [FAIL][8] +2 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-9/igt@xe_madvise@atomic-global.html

  
Known issues
------------

  Here are the changes found in xe-pw-166334v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#7445])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-5/igt@intel_hwmon@hwmon-write.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#3279])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#7679])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][19] ([Intel XE#7084]) +1 other test incomplete
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#3432]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2325] / [Intel XE#7358])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#306] / [Intel XE#7358])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#373]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7642]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#6974])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2321] / [Intel XE#7355])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1424])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#309] / [Intel XE#7343])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][32] -> [FAIL][33] ([Intel XE#7571])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#4354] / [Intel XE#5882])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-2/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2244])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#701] / [Intel XE#7359])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1421]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7178] / [Intel XE#7351])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#7178] / [Intel XE#7351])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#6312]) +7 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4141]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#656] / [Intel XE#7905]) +13 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7061] / [Intel XE#7356])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#6312] / [Intel XE#651]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2311]) +12 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7061]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7865]) +8 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7905]) +14 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2313]) +12 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#7915]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-6/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-3/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#6911] / [Intel XE#7466])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#7591])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7283]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7283]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-6/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane_cursor@primary:
    - shard-bmg:          [PASS][57] -> [ABORT][58] ([Intel XE#5545] / [Intel XE#7814]) +1 other test abort
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-7/igt@kms_plane_cursor@primary.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_plane_cursor@primary.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1489]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#4608])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#4608] / [Intel XE#7304])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1406])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-3/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][66] -> [SKIP][67] ([Intel XE#4692] / [Intel XE#7508])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#3904] / [Intel XE#7342])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7636]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7636]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#4518] / [Intel XE#7404])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][73] -> [INCOMPLETE][74] ([Intel XE#6321])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_balancer@twice-parallel-basic:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#7482]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@xe_exec_balancer@twice-parallel-basic.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#6703]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1392]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#7136]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#7136]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#6874]) +9 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#6874]) +6 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#7866])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#6196])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html

  * igt@xe_exec_threads@threads-multi-queue-fd-basic:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#7138]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-fd-basic.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#7138]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#6964])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#6964])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#7793])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#7590] / [Intel XE#977])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@xe_peer2peer@write.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2284] / [Intel XE#7370])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#4733] / [Intel XE#7417])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#6703]) +132 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-6/igt@xe_spin_batch@spin-all.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_spin_batch@spin-all.html

  * igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#7174])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-4/igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#3342])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#6557] / [Intel XE#6703])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-4/igt@xe_vm@large-split-binds-536870912.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_vm@large-split-binds-536870912.html

  * igt@xe_vm@overcommit-nonfault-vram-no-lr:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#7892])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@xe_vm@overcommit-nonfault-vram-no-lr.html

  
#### Possible fixes ####

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][102] ([Intel XE#7915]) -> [PASS][103] +1 other test pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-10/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][104] ([Intel XE#7340]) -> [PASS][105] +1 other test pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_pat@pt-caching:
    - shard-bmg:          [ABORT][106] ([Intel XE#7893]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-7/igt@xe_pat@pt-caching.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-3/igt@xe_pat@pt-caching.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [FAIL][108] ([Intel XE#6569]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-7/igt@xe_sriov_flr@flr-twice.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][110] ([Intel XE#6627] / [Intel XE#7419]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-7/igt@xe_survivability@runtime-survivability.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-6/igt@xe_survivability@runtime-survivability.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][112] ([Intel XE#1124]) -> [SKIP][113] ([Intel XE#6703]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][114] ([Intel XE#2887]) -> [SKIP][115] ([Intel XE#6703]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][116] ([Intel XE#2252]) -> [SKIP][117] ([Intel XE#6703]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][118] ([Intel XE#6974]) -> [SKIP][119] ([Intel XE#6703])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][120] ([Intel XE#2320]) -> [SKIP][121] ([Intel XE#6703])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][122] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][123] ([Intel XE#6703])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-10/igt@kms_cursor_crc@cursor-random-512x512.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][124] ([Intel XE#4354] / [Intel XE#7386]) -> [SKIP][125] ([Intel XE#6703])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][126] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][127] ([Intel XE#6703])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][128] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][129] ([Intel XE#6703]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][130] ([Intel XE#4141]) -> [SKIP][131] ([Intel XE#6703]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          [SKIP][132] ([Intel XE#2311]) -> [SKIP][133] ([Intel XE#6703]) +13 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][134] ([Intel XE#2313]) -> [SKIP][135] ([Intel XE#6703]) +12 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-blt.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][136] ([Intel XE#7376] / [Intel XE#870]) -> [SKIP][137] ([Intel XE#6703])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][138] ([Intel XE#1489]) -> [SKIP][139] ([Intel XE#6703]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-8/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          [SKIP][140] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][141] ([Intel XE#6703]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-4/igt@kms_psr@fbc-psr-suspend.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_sharpness_filter@filter-rotations:
    - shard-bmg:          [SKIP][142] ([Intel XE#6503]) -> [SKIP][143] ([Intel XE#6703])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@kms_sharpness_filter@filter-rotations.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_sharpness_filter@filter-rotations.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][144] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][145] ([Intel XE#1729] / [Intel XE#7424])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          [SKIP][146] ([Intel XE#7636]) -> [SKIP][147] ([Intel XE#6703]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-3/igt@xe_eudebug@discovery-empty.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_eudebug@discovery-empty.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][148] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][149] ([Intel XE#6703])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [SKIP][150] ([Intel XE#7136]) -> [SKIP][151] ([Intel XE#6703]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority:
    - shard-bmg:          [SKIP][152] ([Intel XE#6874]) -> [SKIP][153] ([Intel XE#6703]) +6 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-9/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-bmg:          [SKIP][154] ([Intel XE#7866]) -> [SKIP][155] ([Intel XE#6703])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-error.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          [SKIP][156] ([Intel XE#7793]) -> [SKIP][157] ([Intel XE#6703])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-8/igt@xe_page_reclaim@invalid-1g.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          [SKIP][158] ([Intel XE#7590]) -> [SKIP][159] ([Intel XE#6703])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-5/igt@xe_pat@xa-app-transient-media-off.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-bmg:          [SKIP][160] ([Intel XE#7599]) -> [SKIP][161] ([Intel XE#6703])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-6/igt@xe_prefetch_fault@prefetch-fault.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          [SKIP][162] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][163] ([Intel XE#6703])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          [SKIP][164] ([Intel XE#944]) -> [SKIP][165] ([Intel XE#6703])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7404]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7404
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8902 -> IGT_8903
  * Linux: xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565 -> xe-pw-166334v1

  IGT_8902: d28bd0b9e0347c58ca9b012c02de7e2ad5ffe847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8903: 6f88532e2fe22529195cc2f8cabff93d994688f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565: f8ee23694aa6be213355905a78f79bb1b0861565
  xe-pw-166334v1: 166334v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/index.html

--===============3297031874402698051==
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
<tr><td><b>Series:</b></td><td>drm/xe/gt_idle: Use NSEC_PER_MSEC instead of float literal</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166334/">https://patchwork.freedesktop.org/series/166334/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565_FULL -&gt; xe-pw-166334v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166334v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-166334v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166334v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-8/igt@kms_atomic_transition@plane-all-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-page-copy-17:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-lnl-1/igt@xe_copy_basic@mem-page-copy-17.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-5/igt@xe_copy_basic@mem-page-copy-17.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-free-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-free-race-nomemset.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-global:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@xe_madvise@atomic-global.html">SKIP</a> +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-9/igt@xe_madvise@atomic-global.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166334v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-5/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445">Intel XE#7445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-2/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-6/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-3/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-6/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-7/igt@kms_plane_cursor@primary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_plane_cursor@primary.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814">Intel XE#7814</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-3/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508">Intel XE#7508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7404">Intel XE#7404</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@xe_exec_balancer@twice-parallel-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-7/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-6/igt@xe_spin_batch@spin-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +132 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-4/igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-3/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-4/igt@xe_vm@large-split-binds-536870912.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_vm@large-split-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-no-lr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-1/igt@xe_vm@overcommit-nonfault-vram-no-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-10/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pt-caching:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-7/igt@xe_pat@pt-caching.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893">Intel XE#7893</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-3/igt@xe_pat@pt-caching.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-7/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-7/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-6/igt@xe_survivability@runtime-survivability.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-10/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-8/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-4/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-rotations:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@kms_sharpness_filter@filter-rotations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@kms_sharpness_filter@filter-rotations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-3/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-9/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_exec_reset@multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-8/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-5/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-6/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166334v1/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8902 -&gt; IGT_8903</li>
<li>Linux: xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565 -&gt; xe-pw-166334v1</li>
</ul>
<p>IGT_8902: d28bd0b9e0347c58ca9b012c02de7e2ad5ffe847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8903: 6f88532e2fe22529195cc2f8cabff93d994688f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565: f8ee23694aa6be213355905a78f79bb1b0861565<br />
  xe-pw-166334v1: 166334v1</p>

</body>
</html>

--===============3297031874402698051==--
