Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EF1C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 15:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF5C10ECD3;
	Tue,  8 Sep 2026 15:44:57 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF5610ECD2;
 Tue,  8 Sep 2026 15:44:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1791288547046454350=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Separate_GGTT_pools_for_su?=
 =?utf-8?q?bmissions_and_VFs_provisioning_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 15:44:56 -0000
Message-ID: <178888229650.134388.2194435532029475670@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908100602.1626556-1-piotr.piorkowski@intel.com>
In-Reply-To: <20260908100602.1626556-1-piotr.piorkowski@intel.com>
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

--===============1791288547046454350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Separate GGTT pools for submissions and VFs provisioning (rev5)
URL   : https://patchwork.freedesktop.org/series/171735/
State : failure

== Summary ==

CI Bug Log - changes from xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e_FULL -> xe-pw-171735v5_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-171735v5_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-171735v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-171735v5_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-bmg:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-7/igt@kms_pm_rpm@dpms-non-lpsp.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-3/igt@kms_pm_rpm@dpms-non-lpsp.html

  
New tests
---------

  New tests have been introduced between xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e_FULL and xe-pw-171735v5_FULL:

### New IGT tests (15) ###

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.77] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.57] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.77] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.52] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [13.18] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [12.83] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_plane_multiple@tiling-none@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.08] s

  * igt@kms_plane_multiple@tiling-none@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_plane_multiple@tiling-none@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  

Known issues
------------

  Here are the changes found in xe-pw-171735v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#3279])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1407]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#367]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#2669] / [Intel XE#7389]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#2887])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_color@ctm-max:
    - shard-lnl:          [PASS][13] -> [SKIP][14] ([Intel XE#3297])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_color@ctm-max.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_color@ctm-max.html

  * igt@kms_color_pipeline@plane-lut1d:
    - shard-lnl:          [PASS][15] -> [SKIP][16] ([Intel XE#7006])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_color_pipeline@plane-lut1d.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d.html

  * igt@kms_content_protection@suspend-resume:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#7642])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#309] / [Intel XE#7343])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#7809])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#8265])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_dsc@dsc-basic-ultrajoiner.html
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#8265])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_feature_discovery@vrr:
    - shard-lnl:          [PASS][24] -> [SKIP][25] ([Intel XE#8586])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_feature_discovery@vrr.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1421])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-lnl:          [PASS][27] -> [SKIP][28] ([Intel XE#2482]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_flip@basic-flip-vs-modeset.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][29] -> [FAIL][30] ([Intel XE#301]) +2 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-lnl:          [PASS][31] -> [SKIP][32] ([Intel XE#1745] / [Intel XE#9144]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7178] / [Intel XE#7351])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#6312]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-lnl:          [PASS][36] -> [SKIP][37] ([Intel XE#2548] / [Intel XE#7779]) +16 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#656] / [Intel XE#7905]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4141]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1469] / [Intel XE#7399])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2352] / [Intel XE#7399])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2311]) +9 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7905]) +8 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7061])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7061])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          [PASS][47] -> [SKIP][48] ([Intel XE#7779])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2313]) +15 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7865]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2486])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-lnl:          [PASS][52] -> [SKIP][53] ([Intel XE#7250] / [Intel XE#9128])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#8303]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-lnl:          [PASS][55] -> [SKIP][56] ([Intel XE#7780] / [Intel XE#9125])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_plane@planar-pixel-format-settings.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#5021] / [Intel XE#7377])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#4596] / [Intel XE#5854])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-lnl:          [PASS][59] -> [SKIP][60] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - shard-lnl:          [PASS][61] -> [SKIP][62] ([Intel XE#2763] / [Intel XE#6886]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-lnl:          [PASS][65] -> [SKIP][66] ([Intel XE#6927] / [Intel XE#8854])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_pm_dc@dc5-pageflip-negative.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [PASS][67] -> [SKIP][68] ([Intel XE#4886]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_pm_rpm@legacy-planes.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-bmg:          [PASS][69] -> [ABORT][70] ([Intel XE#9093])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@kms_pm_rpm@system-suspend-idle.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-4/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-lnl:          [PASS][71] -> [SKIP][72] ([Intel XE#9129]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_properties@crtc-properties-legacy.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1489]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#4608]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [PASS][77] -> [SKIP][78] ([Intel XE#1489])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-basic:
    - shard-lnl:          [PASS][81] -> [SKIP][82] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_psr@psr2-basic.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-lnl:          [PASS][83] -> [SKIP][84] ([Intel XE#9125]) +45 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1499])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@kms_vrr@flipline.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][86] -> [INCOMPLETE][87] ([Intel XE#6321] / [Intel XE#8355])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#6540] / [Intel XE#688])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#7482])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_exec_balancer@no-exec-cm-virtual-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1392])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2322] / [Intel XE#7372])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#8374]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#8364]) +8 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-priority:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#8364]) +6 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-bmg:          [PASS][95] -> [FAIL][96] ([Intel XE#9096])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#8378])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#8378])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#6964])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#7793])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_page_reclaim@basic-mixed.html
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#7793])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-lnl:          [PASS][102] -> [SKIP][103] ([Intel XE#7590] / [Intel XE#9125])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@xe_pat@display-vs-wb-transient.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1420] / [Intel XE#7590])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_sriov_flr@flr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#7569])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_sriov_flr@flr-basic.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - shard-lnl:          [SKIP][107] ([Intel XE#2134]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@fbdev@eof.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@fbdev@eof.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][109] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_color@ctm-green-to-red:
    - shard-lnl:          [SKIP][111] ([Intel XE#3297]) -> [PASS][112] +1 other test pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_color@ctm-green-to-red.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_color@ctm-green-to-red.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-lnl:          [SKIP][113] ([Intel XE#7006]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-lnl:          [SKIP][115] ([Intel XE#9127]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@psr1:
    - shard-lnl:          [SKIP][117] ([Intel XE#1135]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_feature_discovery@psr1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-lnl:          [SKIP][119] ([Intel XE#2482]) -> [PASS][120] +6 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][121] ([Intel XE#301]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][123] ([Intel XE#7779]) -> [PASS][124] +3 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-lnl:          [SKIP][125] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][126] +17 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_invalid_mode@int-max-clock:
    - shard-lnl:          [SKIP][127] ([Intel XE#2568]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_invalid_mode@int-max-clock.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-lnl:          [SKIP][129] ([Intel XE#7250] / [Intel XE#9128]) -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [SKIP][131] ([Intel XE#9128]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane@plane-position-hole.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-lnl:          [SKIP][133] ([Intel XE#3307] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_scaling@invalid-num-scalers.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-lnl:          [SKIP][135] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][136] +5 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - shard-lnl:          [SKIP][137] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][138] +5 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html

  * igt@kms_pm_backlight@fade:
    - shard-lnl:          [SKIP][139] ([Intel XE#870]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_pm_backlight@fade.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][141] ([Intel XE#8399]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-lnl:          [SKIP][143] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_pm_rpm@dpms-lpsp.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          [SKIP][145] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][146] +4 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@psr2-sprite-render.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_setmode@basic-no-cpu-idle:
    - shard-lnl:          [SKIP][147] ([Intel XE#9142]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_setmode@basic-no-cpu-idle.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_setmode@basic-no-cpu-idle.html

  * igt@kms_vblank@query-forked:
    - shard-lnl:          [SKIP][149] ([Intel XE#9125]) -> [PASS][150] +35 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_vblank@query-forked.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_vblank@query-forked.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [FAIL][151] ([Intel XE#9096]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [ABORT][153] ([Intel XE#8007]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [SKIP][179], [PASS][180]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-6/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-10/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-2/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-10/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-1/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-4/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-7/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-9/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-9/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-4/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-6/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-2/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-7/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-2/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-1/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-10/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-1/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-5/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-3/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-10/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-10/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-10/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-1/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-4/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-4/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-8/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-9/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-6/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-6/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-5/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-9/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-9/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-1/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-1/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-4/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-6/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-8/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-lnl:          [SKIP][206] ([Intel XE#9125]) -> [SKIP][207] ([Intel XE#1407]) +3 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-lnl:          [SKIP][208] ([Intel XE#1407]) -> [SKIP][209] ([Intel XE#9125]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][210] ([Intel XE#9125]) -> [SKIP][211] ([Intel XE#1124]) +7 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][212] ([Intel XE#1428] / [Intel XE#7387]) -> [SKIP][213] ([Intel XE#9125])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][214] ([Intel XE#1124]) -> [SKIP][215] ([Intel XE#9125]) +6 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][216] ([Intel XE#7679]) -> [SKIP][217] ([Intel XE#9125]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][218] ([Intel XE#367]) -> [SKIP][219] ([Intel XE#9125])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][220] ([Intel XE#9125]) -> [SKIP][221] ([Intel XE#8365])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-lnl:          [SKIP][222] ([Intel XE#2887]) -> [SKIP][223] ([Intel XE#9125]) +12 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][224] ([Intel XE#9125]) -> [SKIP][225] ([Intel XE#2887]) +10 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][226] ([Intel XE#9125]) -> [SKIP][227] ([Intel XE#2669] / [Intel XE#7389])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][228] ([Intel XE#9125]) -> [SKIP][229] ([Intel XE#3432]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          [SKIP][230] ([Intel XE#3432]) -> [SKIP][231] ([Intel XE#9125])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][232] ([Intel XE#2669] / [Intel XE#7389]) -> [SKIP][233] ([Intel XE#9125])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          [SKIP][234] ([Intel XE#9125]) -> [SKIP][235] ([Intel XE#307] / [Intel XE#6974])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_content_protection@dp-mst-type-1.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          [SKIP][236] ([Intel XE#9125]) -> [SKIP][237] ([Intel XE#7642]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_content_protection@lic-type-1.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          [SKIP][238] ([Intel XE#7642]) -> [SKIP][239] ([Intel XE#9125]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_content_protection@type1.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-lnl:          [SKIP][240] ([Intel XE#1424]) -> [SKIP][241] ([Intel XE#9125])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_cursor_crc@cursor-random-32x32.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-lnl:          [SKIP][242] ([Intel XE#9125]) -> [SKIP][243] ([Intel XE#1424]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_crc@cursor-random-64x21.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-lnl:          [SKIP][244] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][245] ([Intel XE#9125]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          [SKIP][246] ([Intel XE#9125]) -> [SKIP][247] ([Intel XE#2321] / [Intel XE#7355]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          [SKIP][248] ([Intel XE#9125]) -> [SKIP][249] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          [SKIP][250] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][251] ([Intel XE#9125]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          [SKIP][252] ([Intel XE#9125]) -> [SKIP][253] ([Intel XE#323] / [Intel XE#6035])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          [SKIP][254] ([Intel XE#4354] / [Intel XE#5882]) -> [SKIP][255] ([Intel XE#9125])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-mst.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          [SKIP][256] ([Intel XE#4354] / [Intel XE#7450]) -> [SKIP][257] ([Intel XE#9125])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_dp_link_training@non-uhbr-sst.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-lnl:          [SKIP][258] ([Intel XE#9125]) -> [SKIP][259] ([Intel XE#9009])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-lnl:          [SKIP][260] ([Intel XE#8265]) -> [SKIP][261] ([Intel XE#9125]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          [SKIP][262] ([Intel XE#9125]) -> [SKIP][263] ([Intel XE#8265]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-lnl:          [SKIP][264] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][265] ([Intel XE#9125])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][266] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) -> [SKIP][267] ([Intel XE#1745] / [Intel XE#9144])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          [SKIP][268] ([Intel XE#1745] / [Intel XE#9144]) -> [SKIP][269] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +3 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          [SKIP][270] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][271] ([Intel XE#6312] / [Intel XE#651]) +6 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][272] ([Intel XE#7905]) -> [SKIP][273] ([Intel XE#7779]) +36 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          [SKIP][274] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][275] ([Intel XE#656] / [Intel XE#7905]) +31 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-lnl:          [SKIP][276] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][277] ([Intel XE#2548] / [Intel XE#7779]) +25 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][278] ([Intel XE#7779]) -> [SKIP][279] ([Intel XE#6312]) +9 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          [SKIP][280] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][281] ([Intel XE#2548] / [Intel XE#7779]) +7 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-lnl:          [SKIP][282] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][283] ([Intel XE#7779]) +5 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
    - shard-lnl:          [SKIP][284] ([Intel XE#7779]) -> [SKIP][285] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          [SKIP][286] ([Intel XE#1469] / [Intel XE#7399]) -> [SKIP][287] ([Intel XE#2548] / [Intel XE#7779])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][288] ([Intel XE#7779]) -> [SKIP][289] ([Intel XE#7061]) +6 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:
    - shard-lnl:          [SKIP][290] ([Intel XE#6312]) -> [SKIP][291] ([Intel XE#7779]) +11 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-lnl:          [SKIP][292] ([Intel XE#7779]) -> [SKIP][293] ([Intel XE#7399])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          [SKIP][294] ([Intel XE#7779]) -> [SKIP][295] ([Intel XE#7865]) +16 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte:
    - shard-lnl:          [SKIP][296] ([Intel XE#7779]) -> [SKIP][297] ([Intel XE#7905]) +32 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:
    - shard-lnl:          [SKIP][298] ([Intel XE#7061]) -> [SKIP][299] ([Intel XE#7779]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-lnl:          [SKIP][300] ([Intel XE#7399]) -> [SKIP][301] ([Intel XE#7779])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
    - shard-lnl:          [SKIP][302] ([Intel XE#7865]) -> [SKIP][303] ([Intel XE#7779]) +18 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          [SKIP][304] ([Intel XE#9125]) -> [SKIP][305] ([Intel XE#3374] / [Intel XE#3544])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_hdr@brightness-with-hdr.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          [SKIP][306] ([Intel XE#1503]) -> [SKIP][307] ([Intel XE#9125])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_hdr@static-swap.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          [SKIP][308] ([Intel XE#9125]) -> [SKIP][309] ([Intel XE#1503])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_hdr@static-toggle-suspend.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-lnl:          [SKIP][310] ([Intel XE#599] / [Intel XE#7382]) -> [SKIP][311] ([Intel XE#9125])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plane_lowres@tiling-x.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          [SKIP][312] ([Intel XE#9125]) -> [SKIP][313] ([Intel XE#599])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_lowres@tiling-yf.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-lnl:          [SKIP][314] ([Intel XE#9125]) -> [SKIP][315] ([Intel XE#4596] / [Intel XE#5854])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-4.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          [SKIP][316] ([Intel XE#9125]) -> [SKIP][317] ([Intel XE#5020] / [Intel XE#7348])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          [SKIP][318] ([Intel XE#3307]) -> [SKIP][319] ([Intel XE#3307] / [Intel XE#7687] / [Intel XE#9125])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_plane_scaling@intel-max-src-size.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-lnl:          [SKIP][320] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][321] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +3 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          [SKIP][322] ([Intel XE#1489]) -> [SKIP][323] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [SKIP][324] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) -> [SKIP][325] ([Intel XE#1489])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          [SKIP][326] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][327] ([Intel XE#1489]) +3 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][328] ([Intel XE#1489]) -> [SKIP][329] ([Intel XE#2893] / [Intel XE#7304]) +3 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          [SKIP][330] ([Intel XE#1122] / [Intel XE#7429]) -> [SKIP][331] ([Intel XE#1128] / [Intel XE#7413])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2_su@page_flip-xrgb8888.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-lnl:          [SKIP][332] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][333] ([Intel XE#1406] / [Intel XE#7345]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-blt.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          [SKIP][334] ([Intel XE#1406] / [Intel XE#7345]) -> [SKIP][335] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          [SKIP][336] ([Intel XE#1406]) -> [SKIP][337] ([Intel XE#2850] / [Intel XE#929])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_psr@pr-primary-page-flip.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-lnl:          [SKIP][338] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][339] ([Intel XE#1406]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@pr-sprite-plane-move.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][340] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][341] ([Intel XE#9125])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          [SKIP][342] ([Intel XE#9125]) -> [SKIP][343] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-90.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][344] ([Intel XE#9125]) -> [SKIP][345] ([Intel XE#1127] / [Intel XE#5813])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][346] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][347] ([Intel XE#2426] / [Intel XE#5848])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [DMESG-WARN][348] ([Intel XE#9130]) -> [ABORT][349] ([Intel XE#9131] / [Intel XE#9145])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-10/igt@xe_exec_reset@gt-reset-fault-injection.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-10/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [ABORT][350] ([Intel XE#8963]) -> [DMESG-WARN][351] ([Intel XE#8963])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@xe_wedged@basic-wedged.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_wedged@basic-wedged.html
    - shard-bmg:          [ABORT][352] ([Intel XE#8591] / [Intel XE#8963]) -> [DMESG-WARN][353] ([Intel XE#8963])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-2/igt@xe_wedged@basic-wedged.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7450
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7569
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7780
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e -> xe-pw-171735v5

  IGT_9085: 9085
  xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e: 06602b51786b6c2a0f97e58f0e0f168be1ada27e
  xe-pw-171735v5: 171735v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/index.html

--===============1791288547046454350==
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
<tr><td><b>Series:</b></td><td>Separate GGTT pools for submissions and VFs =
provisioning (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/171735/">https://patchwork.freedesktop.org/series/171735/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-171735v5/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-171735v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5704-06602b51786b6c2a0f97e58f0e0f168be=
1ada27e_FULL -&gt; xe-pw-171735v5_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-171735v5_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-171735v5_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1717=
35v5_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pm_rpm@dpms-non-lpsp:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-7/igt@kms_pm_r=
pm@dpms-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-171735v5/shard-bmg-3/igt@kms_pm_rpm@dpms-non-lpsp.htm=
l">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5704-06602b51786b6c2a0f97e58f0=
e0f168be1ada27e_FULL and xe-pw-171735v5_FULL:</p>
<h3>New IGT tests (15)</h3>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-=
b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-e=
dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-e=
dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-edp-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b-edp-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-171735v5_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_atomic_transition@plane-a=
ll-modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@kms_bw@linear-tiling-4-displa=
ys-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_colo=
r@ctm-max.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_color@ctm-max.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel X=
E#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_colo=
r_pipeline@plane-lut1d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_color_pipeline@pla=
ne-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_content_protection@suspen=
d-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_content_protection@suspen=
d-resume@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-9/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-9/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_dsc@dsc-basic-ultrajoiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8265">Intel XE#8265</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_dsc@dsc-basic-ultrajoiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_feat=
ure_discovery@vrr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_feature_discovery@vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_flip@2x-flip-vs-wf_vblank=
-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_flip=
@basic-flip-vs-modeset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_flip@basic-flip-vs=
-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-8/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_flip=
_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard=
-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/9144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE=
#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7385">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9144">Intel XE#9144</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
hdr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@k=
ms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779"=
>Intel XE#7779</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)=
 +5 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1469">Intel XE#1469</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-rende=
r:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +8 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard=
-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_frontbuffer_tracking@psrh=
dr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@psrh=
dr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_panel_fitting@atomic-fast=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_plan=
e@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard=
-lnl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7250">Intel XE#7250</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_plane@pixel-format-4-tile=
d-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_plan=
e@planar-pixel-format-settings.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_plane@plan=
ar-pixel-format-settings.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7780">Intel XE#7780</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-=
yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-=
yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_plan=
e_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shar=
d-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plan=
e_scaling@planes-scaler-unity-scaling@pipe-b.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/ig=
t@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/68=
86">Intel XE#6886</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_pm_d=
c@dc5-pageflip-negative.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_pm_dc@dc5-pagefli=
p-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6927">Intel XE#6927</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8854">Intel XE#8854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_pm_r=
pm@legacy-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_pm_rpm@legacy-planes.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4886">Intel XE#4886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@kms_pm_r=
pm@system-suspend-idle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-4/igt@kms_pm_rpm@system-susp=
end-idle.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9093">Intel XE#9093</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_prop=
erties@crtc-properties-legacy.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_properties@=
crtc-properties-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9129">Intel XE#9129</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-=
edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-=
edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel =
XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_psr2=
_sf@psr2-overlay-plane-update-continuous-sf.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@k=
ms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-blt@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@kms_psr@psr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_psr@=
psr2-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_psr@psr2-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel=
 XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_rota=
tion_crc@primary-x-tiled-reflect-x-180.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_ro=
tation_crc@primary-x-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +45 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@kms_vrr@flipline.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_evict=
@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-9/igt@xe_evict@evic=
t-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_evict@evict-small-external=
-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_exec_balancer@no-exec-cm-v=
irtual-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-1/igt@xe_exec_=
threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-1/i=
gt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel =
XE#9096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_exec_threads@threads-multi=
-queue-mixed-fd-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_exec_threads@threads-multi=
-queue-mixed-fd-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/igt@xe_multigpu_svm@mgpu-pagefaul=
t-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_page_reclaim@basic-mixed.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7793">Intel XE#7793</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_page_reclaim@basic-mixed.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@xe_pat@d=
isplay-vs-wb-transient.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@xe_pat@display-vs-wb-t=
ransient.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7590">Intel XE#7590</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_sriov_flr@flr-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/75=
69">Intel XE#7569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@fbdev@eo=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@fbdev@eof.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#=
8150</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
171735v5/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_colo=
r@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_color@ct=
m-green-to-red.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_colo=
r_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/i=
gt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9127">Intel XE#9127</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_fbcon_fbt@fbc.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_feature_=
discovery@psr1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_flip=
@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_fl=
ip@basic-flip-vs-wf_vblank.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-5/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE=
#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-171735v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shr=
fb-draw-mmap-wc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel X=
E#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multid=
raw.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_inva=
lid_mode@int-max-clock.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_inva=
lid_mode@int-max-clock.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e@pixel-format-x-tiled-modifier-source-clamping.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Int=
el XE#9128</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-171735v5/shard-lnl-7/igt@kms_plane@pixel-format-x-tiled-modifier-sour=
ce-clamping.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e@plane-position-hole.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_plane=
@plane-position-hole.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e_scaling@invalid-num-scalers.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel X=
E#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-171735v5/shard-lnl-7/igt@kms_plane_scaling@invalid-num-scalers.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/68=
86">Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_plane=
_scaling@plane-scaler-with-clipping-clamping-rotation.html">PASS</a> +5 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/68=
86">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_plane_scaling@plane-upscale-20x20=
-with-pixel-format@pipe-a.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_pm_b=
acklight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_pm_backlight@fa=
de.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_pm_d=
c@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#83=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171=
735v5/shard-lnl-2/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@=
psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/ig=
t@kms_psr@psr2-sprite-render.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-no-cpu-idle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_setm=
ode@basic-no-cpu-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_setmo=
de@basic-no-cpu-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_vbla=
nk@query-forked.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_vblank@quer=
y-forked.html">PASS</a> +35 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@xe_exec_=
threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5=
/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-6/igt@xe_fault=
_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1717=
35v5/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepa=
re.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-10/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-=
bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/s=
hard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada2=
7e/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1=
ada27e/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f16=
8be1ada27e/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e=
0f168be1ada27e/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e=
58f0e0f168be1ada27e/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0=
f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6=
c2a0f97e58f0e0f168be1ada27e/shard-bmg-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b517=
86b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-9/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602=
b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-0=
6602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-57=
04-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e=
/shard-bmg-10/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1a=
da27e/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE=
#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-171735v5/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-171735v5/shard-bmg-10/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/sha=
rd-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-10/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-171735v5/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-171735v5/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-9/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-171735v5/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-171735v5/shard-bmg-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-171735v5/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-9/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-171735v5/shard-bmg-9/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-171735v5/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-171735v5/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-8/igt@xe_module_loa=
d@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_big_=
fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_=
big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_big_=
fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_b=
ig_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_big_=
fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_b=
ig_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_big_=
fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/s=
hard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel=
 XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-171735v5/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1717=
35v5/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_bw@l=
inear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-l=
nl-6/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_bw@l=
inear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard=
-lnl-2/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Inte=
l XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_ccs@=
bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl=
-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#912=
5</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_ccs@=
ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-=
7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887=
</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_ccs@=
crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/i=
gt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel =
XE#7389</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-ln=
l-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3=
432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/sha=
rd-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">=
Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#73=
89</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
1735v5/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@km=
s_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cont=
ent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_c=
ontent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_cont=
ent_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_conten=
t_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_curs=
or_crc@cursor-random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_=
cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_curs=
or_crc@cursor-random-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_=
cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_curs=
or_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/sha=
rd-lnl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/=
igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel =
XE#7343</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/s=
hard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE=
#9125</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/=
shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
323">Intel XE#323</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-l=
nl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7450">Intel XE#7450</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-l=
nl-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_dp_l=
inktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-ln=
l-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009">Intel XE#9=
009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_dsc@=
dsc-with-formats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_=
dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_dsc@=
dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/ig=
t@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel =
XE#7442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-171735v5/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-=
tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#=
1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7385">Intel XE#7385</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#=
1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel X=
E#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9144">Intel XE#9144</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-lin=
ear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel=
 XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/9144">Intel XE#9144</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#=
2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-pri=
mscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#=
7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-s=
hrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7779">Intel XE#7779</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779"=
>Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn=
-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +31 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">I=
ntel XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-s=
hrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +25 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE=
#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-171735v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6312">Intel XE#6312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel =
XE#6312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p=
-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) =
+7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel=
 XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-171735v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7779">Intel XE#7779</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/s=
hard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/70=
61">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7356">Intel XE#7356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5=
/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel =
XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#777=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171=
735v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-=
mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7061">Intel XE#7061</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-modesetfrombusy.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/sha=
rd-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">=
Intel XE#7779</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-=
2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#777=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171=
735v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7865">Intel XE#7865</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/i=
gt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +=
32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5=
/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7779">Intel XE#7779</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6=
/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1717=
35v5/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7779">Intel XE#7779</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_hdr@static-swap=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_hdr@s=
tatic-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plan=
e_lowres@tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@k=
ms_plane_lowres@tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/igt@kms_plane_lo=
wres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@kms_plane_=
multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_plan=
e_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@km=
s_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">In=
tel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">=
Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_plane_scaling@planes-up=
scale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel=
 XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1717=
35v5/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Int=
el XE#4608</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7304">Intel XE#7304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-p=
lane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_psr2=
_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#=
7304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
171735v5/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2=
_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-l=
nl-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE=
#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7304">Intel XE#7304</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2=
_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-=
7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@=
fbc-psr2-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/ig=
t@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@kms_psr@=
fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl=
-6/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929<=
/a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_psr@=
pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_psr@pr=
-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@=
pr-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-3/ig=
t@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@kms_rota=
tion_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#390=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342=
">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-171735v5/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflec=
t-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-2/igt@km=
s_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">In=
tel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl=
-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#112=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813=
">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shar=
d-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">In=
tel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-10/igt@xe_exec=
_reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg=
-10/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131">Intel XE#9131</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Int=
el XE#9145</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@xe_wedge=
d@basic-wedged.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-lnl-7/igt@xe_wedged@basic=
-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-2/igt@xe_wedge=
d@basic-wedged.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8591">Intel XE#8591</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171735v5/shard-bmg-2/igt@x=
e_wedged@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e -&gt; xe-pw-171=
735v5</li>
</ul>
<p>IGT_9085: 9085<br />
  xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e: 06602b51786b6c2a0f97e58=
f0e0f168be1ada27e<br />
  xe-pw-171735v5: 171735v5</p>

</body>
</html>

--===============1791288547046454350==--
