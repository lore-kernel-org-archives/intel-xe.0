Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B63C982DA
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 04:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE8910E0D9;
	Mon, 21 Sep 2026 04:39:11 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F5510E076;
 Mon, 21 Sep 2026 04:39:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6949051324012865986=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/dp=3A_Disable_DC5?=
 =?utf-8?q?/6_before_AUX_programming_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Sep 2026 04:39:10 -0000
Message-ID: <178996555026.185327.8137117457426174130@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
In-Reply-To: <20260918060426.1162123-1-suraj.kandpal@intel.com>
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

--===============6949051324012865986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Disable DC5/6 before AUX programming (rev3)
URL   : https://patchwork.freedesktop.org/series/174474/
State : failure

== Summary ==

CI Bug Log - changes from xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7_FULL -> xe-pw-174474v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-174474v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-174474v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-174474v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][1] +40 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@xe_exec_system_allocator@many-large-execqueues-malloc-race.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][2] +152 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html

  * igt@xe_exec_system_allocator@twice-large-new-race:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +26 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-1/igt@xe_exec_system_allocator@twice-large-new-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@xe_exec_system_allocator@twice-large-new-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][5] -> [SKIP][6] +678 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_module_load@reload.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_module_load@reload.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][9] ([Intel XE#2327]) -> [SKIP][10] +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][11] ([Intel XE#1124]) -> [SKIP][12] +10 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][13] ([Intel XE#7679]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][15] ([Intel XE#367]) -> [SKIP][16] +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][17] ([Intel XE#2887]) -> [SKIP][18] +14 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][19] ([Intel XE#3432]) -> [SKIP][20] +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][21] ([Intel XE#2252]) -> [SKIP][22] +9 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          [SKIP][23] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][24] +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_chamelium_color@ctm-negative.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][25] ([Intel XE#7358]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][27] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_content_protection@dp-mst-type-1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][29] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][30] +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_content_protection@legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][31] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][32] +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_cursor_crc@cursor-random-512x512.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          [SKIP][33] ([Intel XE#2320]) -> [SKIP][34] +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][35] ([Intel XE#2286] / [Intel XE#6035]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][37] ([Intel XE#4354] / [Intel XE#5882]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_dp_link_training@non-uhbr-mst.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][39] ([Intel XE#8265]) -> [SKIP][40] +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][41] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][43] ([Intel XE#2373] / [Intel XE#7448]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][45] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][46] +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][47] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][48] +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][49] ([Intel XE#2311]) -> [SKIP][50] +64 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][51] ([Intel XE#7061]) -> [SKIP][52] +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][53] ([Intel XE#4141]) -> [SKIP][54] +14 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][55] ([Intel XE#2352] / [Intel XE#7399]) -> [SKIP][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][57] ([Intel XE#2313]) -> [SKIP][58] +64 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][59] ([Intel XE#2486]) -> [SKIP][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_panel_fitting@legacy.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][61] ([Intel XE#7283]) -> [SKIP][62] +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][63] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][64] +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][65] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-after-dc6:
    - shard-bmg:          [SKIP][67] ([Intel XE#8395] / [Intel XE#8396]) -> [SKIP][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_pm_dc@dc3co-after-dc6.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_pm_dc@dc3co-after-dc6.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][69] ([Intel XE#7794]) -> [SKIP][70] +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][71] ([Intel XE#1489]) -> [SKIP][72] +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][73] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][75] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][76] +11 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][77] ([Intel XE#7795]) -> [SKIP][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][79] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][80] +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][81] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][82] +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][83] ([Intel XE#2413]) -> [SKIP][84] +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][85] ([Intel XE#1435] / [Intel XE#8695]) -> [SKIP][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          [SKIP][87] ([Intel XE#6503]) -> [SKIP][88] +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_sharpness_filter@invalid-plane-with-filter.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][89] ([Intel XE#1499] / [Intel XE#9271]) -> [SKIP][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-bmg:          [ABORT][91] ([Intel XE#8868]) -> [SKIP][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][93] ([Intel XE#6599]) -> [SKIP][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_compute@ccs-mode-basic.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_evict@evict-cm-threads-small-multi-queue:
    - shard-bmg:          [SKIP][95] ([Intel XE#8370]) -> [SKIP][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@xe_evict@evict-cm-threads-small-multi-queue.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_evict@evict-cm-threads-small-multi-queue.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][97] ([Intel XE#6321] / [Intel XE#8355]) -> [SKIP][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][99] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][100] +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          [SKIP][101] ([Intel XE#8374]) -> [SKIP][102] +12 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][103] ([Intel XE#8364]) -> [SKIP][104] +28 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-bmg:          [SKIP][105] ([Intel XE#8369]) -> [SKIP][106] +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_exec_reset@multi-queue-cat-error.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-madvise:
    - shard-bmg:          [DMESG-WARN][107] -> [SKIP][108] +51 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-madvise.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-madvise.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          [INCOMPLETE][109] ([Intel XE#7098] / [Intel XE#8159]) -> [SKIP][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_system_allocator@process-many-new-nomemset:
    - shard-bmg:          [SKIP][111] -> [DMESG-WARN][112] +43 other tests dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_exec_system_allocator@process-many-new-nomemset.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_exec_system_allocator@process-many-new-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-bmg:          [SKIP][113] ([Intel XE#8378]) -> [SKIP][114] +9 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          [SKIP][115] ([Intel XE#7954]) -> [SKIP][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_gpgpu_fill@offset-4x4.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_mempage_offline@inject-single-page:
    - shard-bmg:          [SKIP][117] ([Intel XE#9203]) -> [SKIP][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@xe_mempage_offline@inject-single-page.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_mempage_offline@inject-single-page.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-bmg:          [SKIP][119] ([Intel XE#7590]) -> [SKIP][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          [FAIL][121] ([Intel XE#7695]) -> [SKIP][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_pat@pat-sw-hw-reset-compare.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][123] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_pm@d3cold-basic.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_pm@d3cold-basic.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          [SKIP][125] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][126] +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][127] ([Intel XE#944]) -> [SKIP][128] +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][129] ([Intel XE#8966]) -> [SKIP][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_survivability@runtime-survivability.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_survivability@runtime-survivability.html

  
Known issues
------------

  Here are the changes found in xe-pw-174474v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#8749])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [PASS][132] -> [SKIP][133] ([Intel XE#8749]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@core_hotunplug@hotunplug-rescan.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@eof:
    - shard-bmg:          [PASS][134] -> [SKIP][135] ([Intel XE#2134])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@fbdev@eof.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@fbdev@eof.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2327]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1124]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1467] / [Intel XE#7367])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#610] / [Intel XE#7387])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#1124]) +6 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#7679])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#367]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2652]) +34 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#2887])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][145] ([Intel XE#7084] / [Intel XE#8150])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2887]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2252]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2325] / [Intel XE#7358])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#7358])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#373]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#6969]) +23 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][152] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2390] / [Intel XE#6974])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#1468] / [Intel XE#7396])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][155] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2320]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#309] / [Intel XE#7343])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2286] / [Intel XE#6035])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#1508])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#1340] / [Intel XE#7435])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#8265]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#8265])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#8680])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#1138] / [Intel XE#7344])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][166] -> [INCOMPLETE][167] ([Intel XE#2049] / [Intel XE#2597] / [Intel XE#8155]) +1 other test incomplete
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#7178] / [Intel XE#7351])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#7179]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#7061] / [Intel XE#7356])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#7061]) +3 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#6312]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#4141]) +7 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#7061] / [Intel XE#7356])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#2311]) +47 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#7865]) +4 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#7905]) +4 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#2313]) +40 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#1503])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#8348])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#6912] / [Intel XE#7375])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#8303]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#7283]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#5021] / [Intel XE#7377])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#5020] / [Intel XE#7348])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][191] ([Intel XE#8395] / [Intel XE#8396])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#8396]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][193] ([Intel XE#8399])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          NOTRUN -> [SKIP][194] ([Intel XE#8710])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [PASS][196] -> [SKIP][197] ([Intel XE#8710])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#1489]) +4 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#2387] / [Intel XE#7429])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][200] ([Intel XE#1406])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][201] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][202] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][203] ([Intel XE#3904] / [Intel XE#7342])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sharpness_filter@filter-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#6503])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_sharpness_filter@filter-dpms.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][205] ([Intel XE#2426] / [Intel XE#5848])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][206] ([Intel XE#9093])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][207] ([Intel XE#1499] / [Intel XE#9271]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_vrr@max-min.html

  * igt@runner@aborted:
    - shard-lnl:          NOTRUN -> [FAIL][208] ([Intel XE#8990])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-3/igt@runner@aborted.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#8608])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][210] ([Intel XE#6321] / [Intel XE#8355])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#6540] / [Intel XE#688])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#7482]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#1392]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][214] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#8374])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][216] ([Intel XE#8374]) +11 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:
    - shard-lnl:          NOTRUN -> [SKIP][217] ([Intel XE#8364]) +5 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][218] ([Intel XE#8364]) +25 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][219] ([Intel XE#9130])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-bmg:          NOTRUN -> [SKIP][220] ([Intel XE#8369]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_threads@threads-multi-queue-basic:
    - shard-lnl:          NOTRUN -> [SKIP][221] ([Intel XE#8378])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][222] ([Intel XE#8378]) +4 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][223] -> [SKIP][224] ([Intel XE#2229]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@xe_live_ktest@xe_bo.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mempage_offline@inject-duplicate-page:
    - shard-lnl:          NOTRUN -> [SKIP][225] ([Intel XE#9203])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_mempage_offline@inject-duplicate-page.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250]) -> ([PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [SKIP][276]) ([Intel XE#2457] / [Intel XE#7405])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-1/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-8/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-6/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-6/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-1/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-9/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-9/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-2/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-2/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-8/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-9/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-9/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-1/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-1/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-4/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-4/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][277] ([Intel XE#6964])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][278] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          NOTRUN -> [SKIP][279] ([Intel XE#7793]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-lnl:          NOTRUN -> [SKIP][280] ([Intel XE#7793])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][281] ([Intel XE#1420] / [Intel XE#7590])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][282] ([Intel XE#7590])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][283] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          NOTRUN -> [SKIP][284] ([Intel XE#5694] / [Intel XE#7370])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-bmg:          [PASS][285] -> [FAIL][286] ([Intel XE#8555]) +2 other tests fail
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-2/igt@xe_pmu@engine-activity-accuracy-50.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-9/igt@xe_pmu@engine-activity-accuracy-50.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][287] ([Intel XE#4733] / [Intel XE#7417]) +3 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][288] ([Intel XE#944]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-lnl:          NOTRUN -> [SKIP][289] ([Intel XE#944])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:
    - shard-bmg:          NOTRUN -> [FAIL][290] ([Intel XE#7992])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority:
    - shard-lnl:          NOTRUN -> [SKIP][291] ([Intel XE#8339])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-with-load:
    - shard-bmg:          [SKIP][292] ([Intel XE#8749]) -> [PASS][293] +1 other test pass
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@core_hotunplug@hotreplug-with-load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@core_hotunplug@hotreplug-with-load.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [ABORT][294] ([Intel XE#8007]) -> [PASS][295] +1 other test pass
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-8/igt@core_hotunplug@unplug-rescan.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][296] -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@core_setmaster@master-drop-set-root.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@pan:
    - shard-bmg:          [SKIP][298] ([Intel XE#2134]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@fbdev@pan.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@fbdev@pan.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [INCOMPLETE][300] ([Intel XE#9320]) -> [PASS][301] +1 other test pass
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          [SKIP][302] ([Intel XE#8710]) -> [PASS][303] +1 other test pass
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_pm_rpm@universal-planes.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_pm_rpm@universal-planes.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][304] -> [PASS][305] +507 other tests pass
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset:
    - shard-bmg:          [DMESG-WARN][306] -> [PASS][307] +28 other tests pass
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-bmg:          [ABORT][308] ([Intel XE#9093]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_pm@s2idle-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][310] ([Intel XE#8583]) -> [SKIP][311] ([Intel XE#5177])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@intel_hwmon@hwmon-write.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-bmg:          [SKIP][312] -> [SKIP][313] ([Intel XE#2327]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][314] -> [SKIP][315] ([Intel XE#7059] / [Intel XE#7085]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][316] -> [SKIP][317] ([Intel XE#1124]) +6 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][318] -> [SKIP][319] ([Intel XE#367]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][320] -> [SKIP][321] ([Intel XE#2652])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][322] -> [INCOMPLETE][323] ([Intel XE#7084] / [Intel XE#8150])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][324] -> [SKIP][325] ([Intel XE#2887]) +12 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][326] -> [SKIP][327] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_chamelium_color@degamma.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-bmg:          [SKIP][328] -> [SKIP][329] ([Intel XE#7358])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][330] -> [SKIP][331] ([Intel XE#2252]) +6 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          [SKIP][332] -> [SKIP][333] ([Intel XE#6974])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][334] -> [FAIL][335] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_content_protection@srm.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][336] -> [SKIP][337] ([Intel XE#7642])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_content_protection@type1.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][338] -> [SKIP][339] ([Intel XE#2321] / [Intel XE#7355]) +2 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          [SKIP][340] -> [SKIP][341] ([Intel XE#2320]) +2 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-bmg:          [SKIP][342] -> [SKIP][343] ([Intel XE#9009])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          [SKIP][344] -> [SKIP][345] ([Intel XE#8265]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          [SKIP][346] -> [SKIP][347] ([Intel XE#4422] / [Intel XE#7442])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][348] -> [SKIP][349] ([Intel XE#2374] / [Intel XE#6128])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_feature_discovery@psr2.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_feature_discovery@vrr:
    - shard-bmg:          [SKIP][350] -> [SKIP][351] ([Intel XE#8586])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_feature_discovery@vrr.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][352] -> [SKIP][353] ([Intel XE#7178] / [Intel XE#7349]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][354] -> [SKIP][355] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][356] -> [SKIP][357] ([Intel XE#2311]) +50 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][358] -> [SKIP][359] ([Intel XE#4141]) +13 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][360] -> [SKIP][361] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][362] -> [SKIP][363] ([Intel XE#7061]) +3 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][364] -> [SKIP][365] ([Intel XE#2352] / [Intel XE#7399])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][366] -> [SKIP][367] ([Intel XE#2313]) +53 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-bmg:          [SKIP][368] -> [FAIL][369] ([Intel XE#9319])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][370] -> [SKIP][371] ([Intel XE#6911] / [Intel XE#7378])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-bmg:          [SKIP][372] -> [SKIP][373] ([Intel XE#7283]) +4 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][374] -> [SKIP][375] ([Intel XE#2393])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][376] -> [SKIP][377] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-framedrop-check:
    - shard-bmg:          [SKIP][378] -> [SKIP][379] ([Intel XE#8395] / [Intel XE#8396])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_pm_dc@dc3co-framedrop-check.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_pm_dc@dc3co-framedrop-check.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][380] -> [SKIP][381] ([Intel XE#2499])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][382] -> [SKIP][383] ([Intel XE#1489]) +6 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][384] -> [SKIP][385] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][386] -> [SKIP][387] ([Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          [SKIP][388] -> [SKIP][389] ([Intel XE#6503]) +2 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_sharpness_filter@filter-scaler-downscale.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][390] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][391] ([Intel XE#2509] / [Intel XE#7437])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          [SKIP][392] -> [ABORT][393] ([Intel XE#9093])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][394] -> [SKIP][395] ([Intel XE#1499] / [Intel XE#9271]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_vrr@flip-suspend.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][396] -> [SKIP][397] ([Intel XE#2168] / [Intel XE#7444])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_vrr@lobf.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_vrr@lobf.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [SKIP][398] -> [SKIP][399] ([Intel XE#6599])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][400] -> [SKIP][401] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          [SKIP][402] -> [SKIP][403] ([Intel XE#8370]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][404] -> [SKIP][405] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          [SKIP][406] -> [SKIP][407] ([Intel XE#8374]) +9 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          [SKIP][408] -> [SKIP][409] ([Intel XE#8364]) +28 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-madvise:
    - shard-bmg:          [SKIP][410] -> [DMESG-WARN][411] ([Intel XE#9309])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-madvise.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefetch-madvise.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
    - shard-bmg:          [SKIP][412] -> [SKIP][413] ([Intel XE#8378]) +7 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][414] -> [SKIP][415] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_mmap@small-bar.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_mmap@small-bar.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-bmg:          [SKIP][416] -> [SKIP][417] ([Intel XE#7793])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_page_reclaim@binds-full-pd.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          [SKIP][418] -> [FAIL][419] ([Intel XE#7695])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_pat@pat-sw-hw-suspend.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][420] -> [SKIP][421] ([Intel XE#2284] / [Intel XE#7370]) +2 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_prefetch_fault@l2-prefetch-fault:
    - shard-bmg:          [SKIP][422] -> [SKIP][423] ([Intel XE#8815])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_prefetch_fault@l2-prefetch-fault.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_prefetch_fault@l2-prefetch-fault.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][424] -> [SKIP][425] ([Intel XE#4733] / [Intel XE#7417])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][426] -> [SKIP][427] ([Intel XE#944]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_query@multigpu-query-hwconfig.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          [SKIP][428] -> [FAIL][429] ([Intel XE#7992])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [SKIP][430] -> [DMESG-WARN][431] ([Intel XE#8963])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
  [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8555]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555
  [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#8966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8966
  [Intel XE#8990]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8990
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309
  [Intel XE#9319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319
  [Intel XE#9320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9320
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7 -> xe-pw-174474v3

  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7: fd2ca2a0c165980cac3a07afa88032da881db2d7
  xe-pw-174474v3: 174474v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/index.html

--===============6949051324012865986==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Disable DC5/6 before AUX progra=
mming (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/174474/">https://patchwork.freedesktop.org/series/174474/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-174474v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-174474v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5790-fd2ca2a0c165980cac3a07afa88032da8=
81db2d7_FULL -&gt; xe-pw-174474v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-174474v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-174474v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1744=
74v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@xe_exec_system_allocator@many=
-large-execqueues-malloc-race.html">DMESG-WARN</a> +40 other tests dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_exec_system_allocator@many=
-large-execqueues-new-race-nomemset.html">SKIP</a> +152 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-new-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-1/igt@xe_exec_=
system_allocator@twice-large-new-race.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@xe_exec=
_system_allocator@twice-large-new-race.html">DMESG-WARN</a> +26 other tests=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/sh=
ard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_e=
arly.html">SKIP</a> +678 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_modu=
le_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_module_load@reload.html">FA=
IL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_big=
_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms=
_big_fb@linear-32bpp-rotate-270.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/s=
hard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">=
SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1744=
74v3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x=
1080p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_bw@l=
inear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-b=
mg-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_ccs=
@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-=
7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> +14 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/ig=
t@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_cham=
elium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms=
_chamelium_audio@hdmi-audio-edid.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_cham=
elium_color@ctm-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bm=
g-7/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_cham=
elium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/sha=
rd-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_con=
tent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/sha=
rd-bmg-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1744=
74v3/shard-bmg-7/igt@kms_content_protection@legacy.html">SKIP</a> +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_cur=
sor_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/sha=
rd-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_curs=
or_crc@cursor-sliding-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms=
_cursor_crc@cursor-sliding-32x10.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2286">Intel XE#2286</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6035">Intel XE#6035</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_cursor_legacy@sh=
ort-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_dp_=
link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-=
bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_dsc=
@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@km=
s_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_fbc=
_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">In=
tel XE#7442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-174474v3/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-=
visible-area.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_feat=
ure_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7448">Intel XE#7448</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bm=
g-7/igt@kms_feature_discovery@display-3x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel =
XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-upscaling.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel=
 XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-174474v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw=
-render.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-=
bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> +=
64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@drrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1744=
74v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-rend=
er.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#414=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174=
474v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-d=
raw-blt.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/sha=
rd-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174=
474v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plf=
lip-blt.html">SKIP</a> +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_pla=
ne@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Int=
el XE#7283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-174474v3/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-=
modifier-source-clamping.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_pla=
ne_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#27=
63</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688=
6">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20=
-downscale-factor-0-75.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_pm_b=
acklight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#87=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174=
474v3/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_pm_d=
c@dc3co-after-dc6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/ig=
t@kms_pm_dc@dc3co-after-dc6.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_pm_=
dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7794">Intel XE#7794</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_pm_dc@dc5-psr.ht=
ml">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_psr=
2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1744=
74v3/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-=
fb.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bm=
g-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@kms_psr=
@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-=
bmg-7/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> +11 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/sha=
rd-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1744=
74v3/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKI=
P</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#734=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174=
474v3/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">=
SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_scal=
ing_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/=
igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@kms_setm=
ode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/=
shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_shar=
pness_filter@invalid-plane-with-filter.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bm=
g-7/igt@kms_sharpness_filter@invalid-plane-with-filter.html">SKIP</a> +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@kms_vrr@=
seamless-rr-switch-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg=
-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@sriov_ba=
sic@pf-unbind-with-vfs-enabled-numvfs-all.html">ABORT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shar=
d-bmg-7/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html">SKIP</a=
></li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_compu=
te@ccs-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6599">Intel XE#6599</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_compute@cc=
s-mode-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@xe_evict=
@evict-cm-threads-small-multi-queue.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7=
/igt@xe_evict@evict-cm-threads-small-multi-queue.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@xe_evict=
@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1744=
74v3/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Inte=
l XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7372">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-im=
m:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@xe_exec_=
fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Int=
el XE#8374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-174474v3/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-que=
ue-userptr-invalidate-imm.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_exec_=
multi_queue@max-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1744=
74v3/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-s=
mem.html">SKIP</a> +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_exec=
_reset@multi-queue-cat-error.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe=
_exec_reset@multi-queue-cat-error.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-madvise:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@xe_exec_=
system_allocator@many-large-execqueues-mmap-remap-madvise.html">DMESG-WARN<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474=
v3/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-mmap-rema=
p-madvise.html">SKIP</a> +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@xe_exec_=
system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Int=
el XE#8159</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-174474v3/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-new-pre=
fetch.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_exec_=
system_allocator@process-many-new-nomemset.html">SKIP</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe=
_exec_system_allocator@process-many-new-nomemset.html">DMESG-WARN</a> +43 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@xe_exec_=
threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel=
 XE#8378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-174474v3/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-hang-fd-us=
erptr-invalidate-race.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_gpgpu=
_fill@offset-4x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7954">Intel XE#7954</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_gpgpu_fill@=
offset-4x4.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-single-page:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@xe_mempa=
ge_offline@inject-single-page.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/9203">Intel XE#9203</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@x=
e_mempage_offline@inject-single-page.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@xe_pat@l=
2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe=
_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_pat@=
pat-sw-hw-reset-compare.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_pat@=
pat-sw-hw-reset-compare.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_pm@d3=
cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_pm@=
d3cold-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@xe_pxp@p=
xp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Inte=
l XE#7417</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-174474v3/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-termin=
ation-irq.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_quer=
y@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/ig=
t@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_survi=
vability@runtime-survivability.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8966">Intel XE#8966</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-=
7/igt@xe_survivability@runtime-survivability.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174474v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@core_hotunplug@hotrebind.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8749">Intel XE#8749</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@core_hot=
unplug@hotunplug-rescan.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@core_hotunplug@hotunp=
lug-rescan.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8749">Intel XE#8749</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@fbdev@e=
of.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-174474v3/shard-bmg-7/igt@fbdev@eof.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1467">Intel XE#1467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_bw@connected-linear-tilin=
g-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_bw@linear-tiling-1-displ=
ays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +34 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs@pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@kms_chamelium_audio@dp-audio-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_chamelium_color_pipeline@=
plane-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-af=
ter-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_color_pipeline@plane-lut1=
d-post-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +23 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@kms_content_protection@atomic=
-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_content_protection@dp-ms=
t-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_content_protection@mei-in=
terface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1468">Intel XE#1468</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7396">Intel XE#7396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_cursor_crc@cursor-offscr=
een-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_cursor_legacy@2x-long-cur=
sor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_dirtyfb@psr-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_dither@fb-8bpc-vs-panel-=
6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@kms_dsc@dsc-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265=
">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-9/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel =
XE#8155</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE=
#7351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_flip_scaled_crc@flip-p01=
6-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>=
) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs=
-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_frontbuffer_tracking@drr=
shdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs=
hdr-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +47 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-blt:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcp=
srhdr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-=
2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-=
rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +40 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_mst@mst-suspend-read-crc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8=
888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_plane@pixel-format-4-tile=
d-bmg-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_plane@pixel-format-4-tile=
d-mtl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-=
yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_plane_scaling@plane-scale=
r-with-clipping-clamping-pixel-formats@pipe-b.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel=
 XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/737=
6">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_pm_dc@dc3co-framedrop-che=
ck@pr-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_pm_dc@dc3co-framedrop-che=
ck@psr2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">=
Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_pm_rpm@basic-pci-d3-state=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8710">Intel XE#8710</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@kms_pm_r=
pm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@kms_pm_rpm@modeset=
-non-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8710">Intel XE#8710</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_psr@pr-sprite-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@kms_psr@psr-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">I=
ntel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_rotation_crc@sprite-rota=
tion-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_sharpness_filter@filter-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_vblank@ts-continuation-dp=
ms-suspend@pipe-d-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/9093">Intel XE#9093</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9271">Intel XE#9271</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-3/igt@runner@aborted.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8990">Inte=
l XE#8990</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_cw_post_sync@walker-post-s=
ync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_evict@evict-beng-mixed-man=
y-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_evict@evict-threads-small-=
multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_exec_balancer@no-exec-cm-p=
arallel-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_exec_basic@multigpu-once-u=
serptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-fault-priority.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-fault-priority.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +25 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_exec_reset@gt-reset-fault-=
injection.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9130">Intel XE#9130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_exec_reset@multi-queue-gt=
-reset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_exec_threads@threads-multi=
-queue-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_exec_threads@threads-mult=
i-queue-mixed-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt@xe_live_=
ktest@xe_bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_live_ktest@xe_bo.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Int=
el XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-duplicate-page:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_mempage_offline@inject-dup=
licate-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881d=
b2d7/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da=
881db2d7/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa880=
32da881db2d7/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a0=
7afa88032da881db2d7/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980c=
ac3a07afa88032da881db2d7/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165=
980cac3a07afa88032da881db2d7/shard-bmg-9/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0=
c165980cac3a07afa88032da881db2d7/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2c=
a2a0c165980cac3a07afa88032da881db2d7/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5790-=
fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-=
bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/s=
hard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2=
d7/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard=
-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-174474v3/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard=
-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-174474v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard=
-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-174474v3/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard=
-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-174474v3/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-174474v3/shard-bmg-4/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shar=
d-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-174474v3/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe=
_module_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_multigpu_svm@mgpu-latency-=
copy-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7325">Intel XE#7325</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7393">Intel XE#7393</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_page_reclaim@binds-1g-part=
ial.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_page_reclaim@binds-null-vm=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_pat@xa-app-transient-media=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_peer2peer@write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427"=
>Intel XE#2427</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6953">Intel XE#6953</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_pm@d3cold-i2c.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">In=
tel XE#5694</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-2/igt@xe_pmu@e=
ngine-activity-accuracy-50.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-9/igt@xe_pmu@engine-acti=
vity-accuracy-50.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8555">Intel XE#8555</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7417">Intel XE#7417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_query@multigpu-query-cs-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges@numvfs-random.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-lnl-2/igt@xe_sriov_scheduling@equal-thr=
oughput-normal-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-with-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@core_hot=
unplug@hotreplug-with-load.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@core=
_hotunplug@hotreplug-with-load.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-8/igt@core_hot=
unplug@unplug-rescan.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-8/igt@core_hotu=
nplug@unplug-rescan.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@core_set=
master@master-drop-set-root.html">FAIL</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@core_setmaster@ma=
ster-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@fbdev@pa=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@fbdev@pan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-6/igt@kms_hdr@=
static-toggle-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9320">Intel XE#9320</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@km=
s_hdr@static-toggle-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_pm_r=
pm@universal-planes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8710">Intel XE#8710</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_pm_rpm=
@universal-planes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_exec_=
basic@many-bindexecqueue-rebind.html">SKIP</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@xe_exec_basic=
@many-bindexecqueue-rebind.html">PASS</a> +507 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-1/igt@xe_exec_=
system_allocator@threads-many-execqueues-new-nomemset.html">DMESG-WARN</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/s=
hard-bmg-8/igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemse=
t.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-10/igt@xe_pm@s=
2idle-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/9093">Intel XE#9093</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-5/igt@xe_pm@s=
2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-3/igt@intel_hw=
mon@hwmon-write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8583">Intel XE#8583</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-7/igt@intel_hwmon@hwm=
on-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5177">Intel XE#5177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_big_=
fb@linear-16bpp-rotate-270.html">SKIP</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_big_fb@linear=
-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_big_=
fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/ig=
t@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7=
059</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/70=
85">Intel XE#7085</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_big_=
fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_big_fb@yf-t=
iled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_bw@l=
inear-tiling-2-displays-target-1920x1080p.html">SKIP</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms=
_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_ccs@=
crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms=
_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8=
150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/i=
gt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE=
#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_cham=
elium_color@degamma.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_chamelium_color@degam=
ma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_cham=
elium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/ig=
t@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7=
358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_cham=
elium_edid@dp-edid-resolution-list.html">SKIP</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_chamel=
ium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_cont=
ent_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@k=
ms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_cont=
ent_protection@srm.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_content_protection@srm=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_cont=
ent_protection@type1.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_content_protection@=
type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_cursor_crc=
@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_curs=
or_crc@cursor-sliding-64x21.html">SKIP</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_cursor_crc@cu=
rsor-sliding-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_dp_l=
inktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_dp=
_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_dsc@=
dsc-with-output-formats-bigjoiner.html">SKIP</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_dsc@ds=
c-with-output-formats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/=
igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Inte=
l XE#4422</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_feature_discovery@psr2=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_feat=
ure_discovery@vrr.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_feature_discovery@vrr.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474=
v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rc=
ccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/sha=
rd-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscal=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/sh=
ard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-=
render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2311">Intel XE#2311</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">In=
tel XE#4141</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-abgr161616f-draw-blt.html">SKIP</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms=
_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Inte=
l XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/i=
gt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel =
XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_frontbu=
ffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-1=
0/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">I=
ntel XE#2313</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_hdmi=
_audio_bw@suspend-disk-audio-recovery.html">SKIP</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_hdm=
i_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9319">Intel XE#9319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_join=
er@invalid-modeset-ultra-joiner.html">SKIP</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_joiner@i=
nvalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_plan=
e@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/ig=
t@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7=
283</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_plan=
e_lowres@tiling-y.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_plane_lowres@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_pm_b=
acklight@bad-brightness.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_pm_backlight@bad-=
brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_pm_d=
c@dc3co-framedrop-check.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_pm_dc@dc3co-frame=
drop-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">I=
ntel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_psr2=
_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/i=
gt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel =
XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_psr@=
fbc-psr2-cursor-plane-move.html">SKIP</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_psr@fbc-psr2-c=
ursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_rota=
tion_crc@primary-rotation-270.html">SKIP</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_rotation_cr=
c@primary-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_shar=
pness_filter@filter-scaler-downscale.html">SKIP</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@kms_sha=
rpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-2/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-174474v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_vbla=
nk@ts-continuation-dpms-suspend.html">SKIP</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@kms_vblank@ts=
-continuation-dpms-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9093">Intel XE#9093</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_vrr@=
flip-suspend.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/9271">Intel XE#9271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@kms_vrr@=
lobf.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-174474v3/shard-bmg-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Int=
el XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_compu=
te@ccs-mode-compute-kernel.html">SKIP</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@xe_compute@ccs-mod=
e-compute-kernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_creat=
e@multigpu-create-massive-size.html">SKIP</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_create@mult=
igpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#735=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_evict=
@evict-small-multi-queue-priority.html">SKIP</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_evict@e=
vict-small-multi-queue-priority.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_=
exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel=
 XE#7372</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_exec_=
fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/ig=
t@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE=
#8374</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_exec_=
multi_queue@two-queues-priority.html">SKIP</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@xe_exec_multi=
_queue@two-queues-priority.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +28 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-prefet=
ch-madvise:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_exec_=
system_allocator@threads-shared-vm-many-stride-malloc-prefetch-madvise.html=
">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-174474v3/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-s=
tride-malloc-prefetch-madvise.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/9309">Intel XE#9309</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_exec_=
threads@threads-multi-queue-mixed-userptr-rebind.html">SKIP</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/=
igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Inte=
l XE#8378</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_mmap@=
small-bar.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_mmap@small-bar.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE=
#586</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
323">Intel XE#7323</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7384">Intel XE#7384</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_page_=
reclaim@binds-full-pd.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-3/igt@xe_page_reclaim@binds-f=
ull-pd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_pat@p=
at-sw-hw-suspend.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-174474v3/shard-bmg-2/igt@xe_pat@pat-sw-hw-suspend.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_pm@s3=
-d3cold-basic-exec.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_pm@s3-d3cold-basic-exec=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7370">Intel XE#7370</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_prefe=
tch_fault@l2-prefetch-fault.html">SKIP</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_prefetch_fault=
@l2-prefetch-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8815">Intel XE#8815</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_pxp@p=
xp-stale-bo-exec-post-termination-irq.html">SKIP</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_pxp=
@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#74=
17</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_query=
@multigpu-query-hwconfig.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_query@multigpu-qu=
ery-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_sriov=
_auto_provisioning@exclusive-ranges.html">SKIP</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-6/igt@xe_sriov_=
auto_provisioning@exclusive-ranges.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7/shard-bmg-7/igt@xe_wedge=
d@wedged-at-any-timeout.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174474v3/shard-bmg-10/igt@xe_wedged@wedged-at-=
any-timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7 -&gt; xe-pw-174=
474v3</li>
</ul>
<p>IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5790-fd2ca2a0c165980cac3a07afa88032da881db2d7: fd2ca2a0c165980cac3a07a=
fa88032da881db2d7<br />
  xe-pw-174474v3: 174474v3</p>

</body>
</html>

--===============6949051324012865986==--
