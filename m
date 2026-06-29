Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9937AC43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 21:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3985810EA62;
	Mon, 29 Jun 2026 21:34:02 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8078510E12F;
 Mon, 29 Jun 2026 21:34:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2467991956430349530=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/hw=5Fengine=3A_Fix_?=
 =?utf-8?q?double-free_of_managed_BO_in_error_path_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jun 2026 21:34:00 -0000
Message-ID: <178276884050.130398.5131357137750287211@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260626210631.3887291-1-shuicheng.lin@intel.com>
In-Reply-To: <20260626210631.3887291-1-shuicheng.lin@intel.com>
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

--===============2467991956430349530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hw_engine: Fix double-free of managed BO in error path (rev2)
URL   : https://patchwork.freedesktop.org/series/166336/
State : failure

== Summary ==

CI Bug Log - changes from xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34_FULL -> xe-pw-166336v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166336v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166336v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166336v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt1-vcs0:
    - shard-bmg:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt1-vcs0.html

  
Known issues
------------

  Here are the changes found in xe-pw-166336v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][2] -> [FAIL][3] ([Intel XE#3718] / [Intel XE#6078])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [PASS][4] -> [FAIL][5] ([Intel XE#6078])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_atomic_transition@modeset-transition:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][6] ([Intel XE#6819] / [Intel XE#8174]) +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2370])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1407]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327]) +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#7059] / [Intel XE#7085])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +8 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2328] / [Intel XE#7367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#7679])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#8365])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2669] / [Intel XE#7389]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2652]) +16 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#3432])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#3432])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +21 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#7358])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7358]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#373]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2252]) +9 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][29] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +8 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7642])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@suspend-resume:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7642])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1424]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2320]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2321] / [Intel XE#7355])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2321] / [Intel XE#7355]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#309] / [Intel XE#7343])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4331] / [Intel XE#7227])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#8265]) +7 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#8265]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6126] / [Intel XE#776])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2375])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4141]) +15 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2311]) +73 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7061]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#6312]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7865]) +7 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#7061] / [Intel XE#7356]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#7905]) +13 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7061]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7399])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#7399])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#656] / [Intel XE#7905]) +13 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2313]) +58 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1503])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_hdr@static-swap.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7591])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7283])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#8303]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#8303]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#7283]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#599])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2763] / [Intel XE#6886]) +8 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#7794])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#8399])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#4608])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#4608] / [Intel XE#7304]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1489]) +8 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1406] / [Intel XE#7345])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1406] / [Intel XE#4609])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1406])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1127] / [Intel XE#5813])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2330] / [Intel XE#5813]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#6503]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2509] / [Intel XE#7437])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1499]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#8397])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_vrr@lobf-dc3co.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#6599])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_configfs@ctx-restore-mid-bb-invalid:
    - shard-bmg:          [PASS][88] -> [ABORT][89] ([Intel XE#8007])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@xe_configfs@ctx-restore-mid-bb-invalid.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1062] / [Intel XE#7318] / [Intel XE#7457])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#7636]) +20 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#7636]) +6 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][93] -> [INCOMPLETE][94] ([Intel XE#6321] / [Intel XE#8355])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#8370]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@many-execqueues-virtual-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#7482]) +6 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2322] / [Intel XE#7372]) +10 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1392]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#8374]) +13 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#8374]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#8364]) +12 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#8364]) +27 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-gt-reset:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#8369]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-gt-reset.html

  * igt@xe_exec_reset@multi-queue-cancel:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#8369])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@xe_exec_reset@multi-queue-cancel.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#8378]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#8378]) +12 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#584] / [Intel XE#7369]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_intel_bb@blit-reloc:
    - shard-lnl:          [PASS][109] -> [ABORT][110] ([Intel XE#8007])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@xe_intel_bb@blit-reloc.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@xe_intel_bb@blit-reloc.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2229])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#2833])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2833])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#6964]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#7793])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@xe_page_reclaim@prl-max-entries.html
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#7793]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#4733] / [Intel XE#7417]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#944]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#944])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#8339])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html
    - shard-bmg:          NOTRUN -> [FAIL][121] ([Intel XE#7992]) +1 other test fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [SKIP][122] ([Intel XE#8517]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@core_hotunplug@hotreplug-lateclose.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@fbdev@write:
    - shard-bmg:          [SKIP][124] ([Intel XE#2134]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@fbdev@write.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@fbdev@write.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [SKIP][126] ([Intel XE#5177] / [Intel XE#8441] / [Intel XE#8480]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@intel_hwmon@hwmon-read.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][128] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          [FAIL][130] ([Intel XE#6078]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-bmg:          [INCOMPLETE][132] ([Intel XE#6819] / [Intel XE#7912] / [Intel XE#8174]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2:
    - shard-bmg:          [INCOMPLETE][134] ([Intel XE#6819] / [Intel XE#8174]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [TIMEOUT][136] ([Intel XE#8446] / [Intel XE#8479]) -> [PASS][137] +5 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [TIMEOUT][138] ([Intel XE#8479]) -> [PASS][139] +5 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [INCOMPLETE][140] ([Intel XE#5643]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-bmg:          [INCOMPLETE][142] ([Intel XE#5643] / [Intel XE#8479]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          [INCOMPLETE][144] ([Intel XE#5643] / [Intel XE#8479]) -> [PASS][145] +6 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          [TIMEOUT][146] ([Intel XE#8446] / [Intel XE#8479]) -> [PASS][147] +6 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [INCOMPLETE][148] ([Intel XE#8479] / [Intel XE#8506]) -> [PASS][149] +2 other tests pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p:
    - shard-lnl:          [INCOMPLETE][150] ([Intel XE#8445] / [Intel XE#8479]) -> [PASS][151] +2 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-1/igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
    - shard-lnl:          [INCOMPLETE][152] ([Intel XE#8445]) -> [PASS][153] +3 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][154] ([Intel XE#8150] / [Intel XE#8479]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [TIMEOUT][156] ([Intel XE#8451] / [Intel XE#8479]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][158] ([Intel XE#7571]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [INCOMPLETE][160] ([Intel XE#8151] / [Intel XE#8479]) -> [PASS][161] +2 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [INCOMPLETE][162] ([Intel XE#8155] / [Intel XE#8479]) -> [PASS][163] +3 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][164] ([Intel XE#301]) -> [PASS][165] +3 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][166] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          [INCOMPLETE][168] ([Intel XE#8479] / [Intel XE#8488]) -> [PASS][169] +4 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-bmg:          [CRASH][170] ([Intel XE#8461]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-bmg:          [INCOMPLETE][172] ([Intel XE#8479] / [Intel XE#8504]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-bmg:          [CRASH][174] -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][176] ([Intel XE#8504]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-bmg:          [TIMEOUT][178] ([Intel XE#8467] / [Intel XE#8479]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][180] ([Intel XE#8441] / [Intel XE#8480]) -> [PASS][181] +7 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [TIMEOUT][182] ([Intel XE#8466] / [Intel XE#8479]) -> [PASS][183] +7 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-bmg:          [INCOMPLETE][184] ([Intel XE#1035] / [Intel XE#8479]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - shard-bmg:          [CRASH][186] ([Intel XE#8460]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-lnl:          [INCOMPLETE][188] ([Intel XE#1035] / [Intel XE#8479]) -> [PASS][189] +3 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          [INCOMPLETE][190] ([Intel XE#8459] / [Intel XE#8479]) -> [PASS][191] +4 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [CRASH][192] ([Intel XE#8458]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:
    - shard-bmg:          [INCOMPLETE][194] ([Intel XE#8459]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [SKIP][196] ([Intel XE#8440]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-bmg:          [SKIP][198] -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_pm_rpm@system-suspend-modeset.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [SKIP][200] ([Intel XE#8440] / [Intel XE#8480]) -> [PASS][201] +127 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_properties@connector-properties-legacy.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-lnl:          [CRASH][202] ([Intel XE#8455]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [SKIP][204] ([Intel XE#8361]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:
    - shard-lnl:          [TIMEOUT][206] ([Intel XE#8468]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-fulls:
    - shard-lnl:          [TIMEOUT][208] ([Intel XE#8468] / [Intel XE#8479]) -> [PASS][209] +1 other test pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-fulls.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-fulls.html

  * igt@xe_ccs@block-copy-uncompressed-inc-dimension:
    - shard-bmg:          [INCOMPLETE][210] ([Intel XE#8437] / [Intel XE#8479]) -> [PASS][211] +4 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html

  * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
    - shard-lnl:          [ABORT][212] ([Intel XE#8007]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [INCOMPLETE][214] ([Intel XE#8479]) -> [PASS][215] +5 other tests pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
    - shard-bmg:          [CRASH][216] ([Intel XE#8450]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset:
    - shard-bmg:          [FAIL][218] ([Intel XE#8479]) -> [PASS][219] +12 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise:
    - shard-bmg:          [SKIP][220] ([Intel XE#8480]) -> [PASS][221] +94 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-fork-read-after:
    - shard-lnl:          [INCOMPLETE][222] ([Intel XE#8437] / [Intel XE#8479]) -> [PASS][223] +64 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-fork-read-after.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-fork-read-after.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap:
    - shard-bmg:          [INCOMPLETE][224] ([Intel XE#7928] / [Intel XE#8159] / [Intel XE#8479]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-dontunmap-eocheck:
    - shard-bmg:          [FAIL][226] -> [PASS][227] +1 other test pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-dontunmap-eocheck.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:
    - shard-lnl:          [TIMEOUT][228] ([Intel XE#8479]) -> [PASS][229] +1 other test pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise:
    - shard-lnl:          [TIMEOUT][230] ([Intel XE#8447] / [Intel XE#8479]) -> [PASS][231] +3 other tests pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset:
    - shard-lnl:          [INCOMPLETE][232] ([Intel XE#7928] / [Intel XE#8479]) -> [PASS][233] +3 other tests pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-fork-read-after:
    - shard-bmg:          [INCOMPLETE][234] ([Intel XE#8159] / [Intel XE#8437] / [Intel XE#8479]) -> [PASS][235] +1 other test pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-fork-read-after.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-fork-read-after.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          [TIMEOUT][236] ([Intel XE#8356] / [Intel XE#8447]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise:
    - shard-bmg:          [TIMEOUT][238] ([Intel XE#8447] / [Intel XE#8479]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck:
    - shard-lnl:          [INCOMPLETE][240] ([Intel XE#8479]) -> [PASS][241] +246 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap:
    - shard-bmg:          [INCOMPLETE][242] ([Intel XE#8159] / [Intel XE#8479]) -> [PASS][243] +25 other tests pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
    - shard-bmg:          [CRASH][244] ([Intel XE#8448]) -> [PASS][245] +3 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [INCOMPLETE][246] ([Intel XE#8479] / [Intel XE#8486]) -> [PASS][247] +1 other test pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          [ABORT][248] ([Intel XE#8007]) -> [PASS][249] +1 other test pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled:
    - shard-bmg:          [INCOMPLETE][250] ([Intel XE#8477] / [Intel XE#8479]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html

  * igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled:
    - shard-bmg:          [INCOMPLETE][252] ([Intel XE#8477]) -> [PASS][253] +1 other test pass
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0:
    - shard-bmg:          [ABORT][254] -> [PASS][255] +1 other test pass
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
    - shard-lnl:          [TIMEOUT][256] ([Intel XE#8462] / [Intel XE#8479]) -> [PASS][257] +2 other tests pass
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-6/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          [TIMEOUT][258] ([Intel XE#8446] / [Intel XE#8479]) -> [SKIP][259] ([Intel XE#1407]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [INCOMPLETE][260] ([Intel XE#5643] / [Intel XE#8479]) -> [SKIP][261] ([Intel XE#1407])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [INCOMPLETE][262] ([Intel XE#5643] / [Intel XE#8479]) -> [SKIP][263] ([Intel XE#3658] / [Intel XE#7360]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-bmg:          [SKIP][264] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][265] ([Intel XE#1124]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [TIMEOUT][266] ([Intel XE#8446]) -> [SKIP][267] ([Intel XE#1124]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][268] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][269] ([Intel XE#1124]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          [INCOMPLETE][270] ([Intel XE#5643] / [Intel XE#8479]) -> [SKIP][271] ([Intel XE#1124]) +7 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          [INCOMPLETE][272] ([Intel XE#8445] / [Intel XE#8479]) -> [SKIP][273] ([Intel XE#7679]) +5 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          [INCOMPLETE][274] ([Intel XE#8479] / [Intel XE#8506]) -> [SKIP][275] ([Intel XE#7679])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          [INCOMPLETE][276] ([Intel XE#8445] / [Intel XE#8479]) -> [SKIP][277] ([Intel XE#8365]) +3 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          [CRASH][278] ([Intel XE#8449]) -> [SKIP][279] ([Intel XE#7679])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][280] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][281] ([Intel XE#367])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-lnl:          [INCOMPLETE][282] ([Intel XE#8445]) -> [SKIP][283] ([Intel XE#367]) +6 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [INCOMPLETE][284] ([Intel XE#8479] / [Intel XE#8506]) -> [SKIP][285] ([Intel XE#367]) +5 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          [TIMEOUT][286] ([Intel XE#8469] / [Intel XE#8479]) -> [SKIP][287] ([Intel XE#367])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          [INCOMPLETE][288] ([Intel XE#8445]) -> [SKIP][289] ([Intel XE#8365]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][290] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][291] ([Intel XE#2887]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][292] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][293] ([Intel XE#2887])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-lnl:          [INCOMPLETE][294] ([Intel XE#8479]) -> [SKIP][295] ([Intel XE#2669] / [Intel XE#7389])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][296] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][297] ([Intel XE#2652])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [INCOMPLETE][298] ([Intel XE#8437] / [Intel XE#8479]) -> [SKIP][299] ([Intel XE#2887]) +13 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-lnl:          [INCOMPLETE][300] ([Intel XE#8479]) -> [SKIP][301] ([Intel XE#2887])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          [INCOMPLETE][302] ([Intel XE#8479]) -> [SKIP][303] ([Intel XE#3432])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][304] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][305] ([Intel XE#3432])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-lnl:          [INCOMPLETE][306] ([Intel XE#8437] / [Intel XE#8479]) -> [SKIP][307] ([Intel XE#3432]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [TIMEOUT][308] ([Intel XE#8463]) -> [SKIP][309] ([Intel XE#2887]) +4 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
    - shard-bmg:          [INCOMPLETE][310] ([Intel XE#8150] / [Intel XE#8479]) -> [SKIP][311] ([Intel XE#2887])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-bmg:          [SKIP][312] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][313] ([Intel XE#2252])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-bmg:          [SKIP][314] ([Intel XE#8480]) -> [SKIP][315] ([Intel XE#2252])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][316] ([Intel XE#8440] / [Intel XE#8480]) -> [FAIL][317] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_content_protection@legacy.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][318] ([Intel XE#8480]) -> [SKIP][319] ([Intel XE#2321] / [Intel XE#7355])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          [SKIP][320] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][321] ([Intel XE#2320])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][322] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][323] ([Intel XE#4354] / [Intel XE#7386])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-lnl:          [INCOMPLETE][324] ([Intel XE#8456]) -> [SKIP][325] ([Intel XE#8265])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-lnl:          [INCOMPLETE][326] ([Intel XE#8456] / [Intel XE#8479]) -> [SKIP][327] ([Intel XE#8265])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [INCOMPLETE][328] ([Intel XE#2597] / [Intel XE#8479] / [Intel XE#8488]) -> [SKIP][329] ([Intel XE#1421])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          [INCOMPLETE][330] ([Intel XE#8479] / [Intel XE#8488]) -> [SKIP][331] ([Intel XE#1421]) +2 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][332] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][333] ([Intel XE#301])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          [INCOMPLETE][334] ([Intel XE#8479]) -> [SKIP][335] ([Intel XE#1397] / [Intel XE#7385]) +6 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][336] ([Intel XE#8480]) -> [SKIP][337] ([Intel XE#7178] / [Intel XE#7351])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          [INCOMPLETE][338] ([Intel XE#8479]) -> [SKIP][339] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385]) +6 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][340] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][341] ([Intel XE#2311]) +12 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][342] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][343] ([Intel XE#2311]) +5 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][344] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][345] ([Intel XE#7061] / [Intel XE#7356])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][346] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][347] ([Intel XE#7061]) +2 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][348] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][349] ([Intel XE#4141]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][350] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][351] ([Intel XE#4141]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][352] ([Intel XE#8368] / [Intel XE#8479]) -> [SKIP][353] ([Intel XE#2311])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][354] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][355] ([Intel XE#2352] / [Intel XE#7399])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][356] ([Intel XE#8480]) -> [SKIP][357] ([Intel XE#2311]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [CRASH][358] ([Intel XE#8505]) -> [SKIP][359] ([Intel XE#2311])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-blt.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][360] ([Intel XE#8480]) -> [SKIP][361] ([Intel XE#7061])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][362] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][363] ([Intel XE#2313]) +5 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-bmg:          [SKIP][364] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][365] ([Intel XE#2313]) +10 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [CRASH][366] ([Intel XE#8505]) -> [SKIP][367] ([Intel XE#2313])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][368] ([Intel XE#8368] / [Intel XE#8479]) -> [SKIP][369] ([Intel XE#2313]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][370] ([Intel XE#8480]) -> [SKIP][371] ([Intel XE#2313])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-lnl:          [INCOMPLETE][372] ([Intel XE#1035] / [Intel XE#8479]) -> [SKIP][373] ([Intel XE#7283]) +18 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][374] ([Intel XE#8480]) -> [SKIP][375] ([Intel XE#7283]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-lnl:          [INCOMPLETE][376] ([Intel XE#1035]) -> [SKIP][377] ([Intel XE#7283]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [INCOMPLETE][378] ([Intel XE#1035] / [Intel XE#8479]) -> [SKIP][379] ([Intel XE#7283]) +2 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][380] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][381] ([Intel XE#2763] / [Intel XE#6886])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [WARN][382] -> [SKIP][383] ([Intel XE#2763] / [Intel XE#6886])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-bmg:          [CRASH][384] ([Intel XE#8458]) -> [SKIP][385] ([Intel XE#2763] / [Intel XE#6886])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][386] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][387] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_pm_backlight@bad-brightness.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][388] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][389] ([Intel XE#1489]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          [CRASH][390] ([Intel XE#8455]) -> [SKIP][391] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][392] ([Intel XE#8479]) -> [SKIP][393] ([Intel XE#4608]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          [CRASH][394] ([Intel XE#8455]) -> [SKIP][395] ([Intel XE#4608]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          [INCOMPLETE][396] ([Intel XE#8479]) -> [SKIP][397] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +2 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][398] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][399] ([Intel XE#1489])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-no-drrs:
    - shard-bmg:          [SKIP][400] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][401] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_psr@psr-no-drrs.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_psr@psr-no-drrs.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          [SKIP][402] ([Intel XE#8480]) -> [SKIP][403] ([Intel XE#1499])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_vrr@flipline.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_vrr@flipline.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          [SKIP][404] ([Intel XE#8480]) -> [SKIP][405] ([Intel XE#7636]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-bmg:          [SKIP][406] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][407] ([Intel XE#7636]) +1 other test skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race:
    - shard-lnl:          [INCOMPLETE][408] ([Intel XE#8479]) -> [SKIP][409] ([Intel XE#7482]) +2 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          [CRASH][410] ([Intel XE#8438] / [Intel XE#8482]) -> [SKIP][411] ([Intel XE#2322] / [Intel XE#7372])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [CRASH][412] ([Intel XE#8482]) -> [SKIP][413] ([Intel XE#2322] / [Intel XE#7372])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          [SKIP][414] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][415] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-lnl:          [INCOMPLETE][416] ([Intel XE#8439] / [Intel XE#8479]) -> [SKIP][417] ([Intel XE#1392]) +13 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [INCOMPLETE][418] ([Intel XE#8439] / [Intel XE#8479] / [Intel XE#8499]) -> [SKIP][419] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][420] ([Intel XE#8480]) -> [SKIP][421] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch:
    - shard-lnl:          [INCOMPLETE][422] ([Intel XE#8479]) -> [SKIP][423] ([Intel XE#8374]) +8 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
    - shard-bmg:          [SKIP][424] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][425] ([Intel XE#8374]) +2 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [INCOMPLETE][426] ([Intel XE#8479]) -> [SKIP][427] ([Intel XE#8374])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [SKIP][428] ([Intel XE#8480]) -> [SKIP][429] ([Intel XE#8374]) +3 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          [SKIP][430] ([Intel XE#8480]) -> [SKIP][431] ([Intel XE#8364]) +6 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:
    - shard-bmg:          [SKIP][432] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][433] ([Intel XE#8364]) +6 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-bmg:          [SKIP][434] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][435] ([Intel XE#8369])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_reset@multi-queue-gt-reset.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:
    - shard-bmg:          [SKIP][436] ([Intel XE#8480]) -> [SKIP][437] ([Intel XE#8378]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:
    - shard-bmg:          [INCOMPLETE][438] ([Intel XE#8366] / [Intel XE#8479]) -> [SKIP][439] ([Intel XE#8378])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:
    - shard-lnl:          [INCOMPLETE][440] ([Intel XE#8479]) -> [SKIP][441] ([Intel XE#8378]) +8 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][442] ([Intel XE#6281] / [Intel XE#7426]) -> [ABORT][443] ([Intel XE#8007])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [INCOMPLETE][444] ([Intel XE#8479] / [Intel XE#8486]) -> [ABORT][445] ([Intel XE#8007])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][446] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][447] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_media_fill@media-fill.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][448] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][449] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_mmap@small-bar.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@xe_mmap@small-bar.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          [SKIP][450] ([Intel XE#6964] / [Intel XE#8440]) -> [SKIP][451] ([Intel XE#6964])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-bmg:          [SKIP][452] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][453] ([Intel XE#7793])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_page_reclaim@pde-vs-pd.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          [SKIP][454] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353] / [Intel XE#8440]) -> [SKIP][455] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_peer2peer@read.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_peer2peer@read.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][456] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][457] ([Intel XE#944])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_query@multigpu-query-hwconfig.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7912
  [Intel XE#7928]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7928
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8356
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366
  [Intel XE#8368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437
  [Intel XE#8438]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438
  [Intel XE#8439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439
  [Intel XE#8440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440
  [Intel XE#8441]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441
  [Intel XE#8445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8445
  [Intel XE#8446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446
  [Intel XE#8447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447
  [Intel XE#8448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448
  [Intel XE#8449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8449
  [Intel XE#8450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8450
  [Intel XE#8451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8451
  [Intel XE#8455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8455
  [Intel XE#8456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8456
  [Intel XE#8458]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8458
  [Intel XE#8459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459
  [Intel XE#8460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8460
  [Intel XE#8461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461
  [Intel XE#8462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8462
  [Intel XE#8463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8463
  [Intel XE#8466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466
  [Intel XE#8467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8467
  [Intel XE#8468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8468
  [Intel XE#8469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8469
  [Intel XE#8477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8477
  [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479
  [Intel XE#8480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480
  [Intel XE#8482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482
  [Intel XE#8486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486
  [Intel XE#8488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8488
  [Intel XE#8499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499
  [Intel XE#8504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8504
  [Intel XE#8505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8505
  [Intel XE#8506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8506
  [Intel XE#8517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8517
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8987 -> IGT_8988
  * Linux: xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34 -> xe-pw-166336v2

  IGT_8987: 8987
  IGT_8988: 8988
  xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34: b9aebfff5a3c5049500a7bd4573815090a425f34
  xe-pw-166336v2: 166336v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/index.html

--===============2467991956430349530==
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
<tr><td><b>Series:</b></td><td>drm/xe/hw_engine: Fix double-free of managed BO in error path (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166336/">https://patchwork.freedesktop.org/series/166336/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34_FULL -&gt; xe-pw-166336v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166336v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-166336v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166336v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt1-vcs0:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt1-vcs0.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166336v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_atomic_transition@modeset-transition.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174">Intel XE#8174</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_dsc@dsc-basic-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126">Intel XE#6126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-mid-bb-invalid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_configfs@ctx-restore-mid-bb-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@xe_configfs@ctx-restore-mid-bb-invalid.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318">Intel XE#7318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457">Intel XE#7457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-vm-destroy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@xe_eudebug@discovery-empty-clients.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-virtual-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@xe_exec_reset@multi-queue-cancel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@blit-reloc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@xe_intel_bb@blit-reloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@xe_intel_bb@blit-reloc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8517">Intel XE#8517</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@intel_hwmon@hwmon-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7912">Intel XE#7912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174">Intel XE#8174</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174">Intel XE#8174</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8506">Intel XE#8506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-1/igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8445">Intel XE#8445</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8445">Intel XE#8445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8451">Intel XE#8451</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8488">Intel XE#8488</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +4 other tests pass</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461">Intel XE#8461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8504">Intel XE#8504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">CRASH</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8504">Intel XE#8504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8467">Intel XE#8467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Intel XE#8466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8460">Intel XE#8460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459">Intel XE#8459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8458">Intel XE#8458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459">Intel XE#8459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_properties@connector-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_properties@connector-properties-legacy.html">PASS</a> +127 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8455">Intel XE#8455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361">Intel XE#8361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8468">Intel XE#8468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-fulls:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-fulls.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8468">Intel XE#8468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode@pipe-a-edp-1-invalid-filter-with-scaling-mode-fulls.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed-inc-dimension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8450">Intel XE#8450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-free-madvise.html">PASS</a> +94 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-fork-read-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-fork-read-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-fork-read-after.html">PASS</a> +64 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7928">Intel XE#7928</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-dontunmap-eocheck.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-dontunmap-eocheck.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-madvise.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Intel XE#8447</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7928">Intel XE#7928</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-fork-read-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-fork-read-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-fork-read-after.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8356">Intel XE#8356</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Intel XE#8447</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Intel XE#8447</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck.html">PASS</a> +246 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap.html">PASS</a> +25 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448">Intel XE#8448</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486">Intel XE#8486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8477">Intel XE#8477</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8477">Intel XE#8477</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-6/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8462">Intel XE#8462</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8445">Intel XE#8445</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8506">Intel XE#8506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8445">Intel XE#8445</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8449">Intel XE#8449</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8445">Intel XE#8445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8506">Intel XE#8506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8469">Intel XE#8469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8445">Intel XE#8445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8463">Intel XE#8463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8456">Intel XE#8456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8456">Intel XE#8456</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8488">Intel XE#8488</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8488">Intel XE#8488</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-blt.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8505">Intel XE#8505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8505">Intel XE#8505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-10/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8458">Intel XE#8458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8455">Intel XE#8455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8455">Intel XE#8455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438">Intel XE#8438</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499">Intel XE#8499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366">Intel XE#8366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-9/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486">Intel XE#8486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-7/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-2/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-8/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-3/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8987 -&gt; IGT_8988</li>
<li>Linux: xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34 -&gt; xe-pw-166336v2</li>
</ul>
<p>IGT_8987: 8987<br />
  IGT_8988: 8988<br />
  xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34: b9aebfff5a3c5049500a7bd4573815090a425f34<br />
  xe-pw-166336v2: 166336v2</p>

</body>
</html>

--===============2467991956430349530==--
